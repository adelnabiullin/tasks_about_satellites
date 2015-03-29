require 'spec_helper'

describe "Пользовательские страницы" do

	subject { page }

	describe "index" do

	    let(:user) { FactoryGirl.create(:user) }

	    before(:each) do
	      	sign_in user
      		visit users_path
	    end

	    it { should have_title('Пользователи') }
	    it { should have_content('Список пользователей') }

	    describe "pagination" do

	      	before(:all) { 30.times { FactoryGirl.create(:user) } }
	      	after(:all)  { User.delete_all }

	      	it { should have_selector('div.pagination') }

	      	it "должен быть перечислен каждый пользователь" do
		        User.paginate(page: 1).each do |user|
		          expect(page).to have_selector('li', text: user.name)
		        end
	      	end
    	end

    	describe "delete links" do

	      	it { should_not have_link('удалить') }

	      	describe "as an admin user" do
		        let(:admin) { FactoryGirl.create(:admin) }
		        before do
		          	sign_in admin
		          	visit users_path
		        end

		        it { should have_link('удалить', href: user_path(User.first)) }
		        it "should be able to delete another user" do
		          	expect {
		            	click_link('удалить', match: :first)
		          	}.to change(User, :count).by(-1)
		        end
		        it { should_not have_link('удалить', href: user_path(admin)) }
	      	end
    	end
  	end

  	describe "страница регистрации" do
	    before { visit signup_path }

	    it { should have_content('Регистрация') }
	    it { should have_title(full_title('Регистрация')) }

	    let(:submit) { "Создать аккаунт" }

		describe "с невалидной информацией" do
			it "не должен создать пользоваетеля" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "с валидной информацией" do
			before do
				fill_in "Имя", with: "Example User"
				fill_in "Почта", with: "user@example.com"
				fill_in "Пароль", with: "foobar"
				fill_in "Подтверждение пароля", with: "foobar"
			end

			it "должен создать пользователя" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "после сохранения пользователя" do
		        before { click_button submit }
		        let(:user) { User.find_by(email: 'user@example.com') }

		        it { should have_link('Выход') }
		        it { should have_title(user.name) }
		        it { should have_selector('div.alert.alert-success', text: 'Добро пожаловать') }
      		end
		end
  	end

  	describe "страница профиля" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end

	describe "редактирование" do
	    let(:user) { FactoryGirl.create(:user) }
	    before do
	    	sign_in user
	    	visit edit_user_path(user)
	    end

	    describe "страница" do
	      	it { should have_content("Обновление данных профиля") }
	      	it { should have_title("Редактирование пользовательских данных") }
	      	it { should have_link('изменить', href: 'http://gravatar.com/emails') }
	    end

	    describe "с невалидной информацией" do
	      	before { click_button "Сохранить изменения" }

	      	it { should have_content('error') }
	    end

	    describe "with valid information" do
			let(:new_name)  { "New Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Имя", with: new_name
				fill_in "Почта", with: new_email
				fill_in "Пароль", with: user.password
				fill_in "Подтверждение пароля", with: user.password
				click_button "Сохранить изменения"
			end

			it { should have_title(new_name) }
			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Выход', href: signout_path) }
			specify { expect(user.reload.name).to  eq new_name }
			specify { expect(user.reload.email).to eq new_email }
    	end
  	end
end