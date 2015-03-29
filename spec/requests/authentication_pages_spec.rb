require 'spec_helper'

describe "Аутентификация" do

	subject { page }

	describe "страницы входа" do
		before { visit signin_path }

		it { should have_content('Вход') }
		it { should have_title('Вход') }

		describe "с невалидной информацией" do
	      	before { click_button "Войти" }

	      	it { should have_title('Вход') }
	      	it { should have_selector('div.alert.alert-error') }

	      	describe "после посещения другой страницы" do
        		before { click_link "Главная" }
        		it { should_not have_selector('div.alert.alert-error') }
      		end
    	end
		
		describe "с валидной информацией" do
	      	let(:user) { FactoryGirl.create(:user) }
	      	before { sign_in user }

	      	it { should have_title(user.name) }
	      	it { should have_link('Пользователи', href: users_path) }
	      	it { should have_link('Профиль', href: user_path(user)) }
	      	it { should have_link('Настройки', href: edit_user_path(user)) }
	      	it { should have_link('Выход', href: signout_path) }
	      	it { should_not have_link('Войти', href: signin_path) }

	      	describe "после нажатия на 'выход'" do
		        before { click_link "Выход" }

		        it { should have_link('Вход') }
      		end
		end
	end

	describe "авторизация" do

    	describe "для невошедших пользователей" do
			let(:user) { FactoryGirl.create(:user) }

			describe "в контроллере Users" do

				describe "при попытке посетить защищенную страницу" do
			        before do
			          	visit edit_user_path(user)
			          	fill_in "Почта", with: user.email
			          	fill_in "Пароль", with: user.password
			          	click_button "Войти"
			        end

			        describe "после входа" do

			          	it "должна отобразиться желаемая защищенная страница" do
			            	expect(page).to have_title('Редактирование пользовательских данных')
			          	end
			        end
      			end

				describe "посещение страницы редактирования" do
					before { visit edit_user_path(user) }

					it { should have_title('Вход') }
				end

				describe "запрос update действия" do
					before { patch user_path(user) }

					specify { expect(response).to redirect_to(signin_path) }
				end

				describe "посещение index страницы пользователей" do
		          	before { visit users_path }

		          	it { should have_title('Вход') }
		        end
			end
		end

		describe "несоответсвующего пользователя" do
			let(:user) { FactoryGirl.create(:user) }
			let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
			before { sign_in user, no_capybara: true }

			describe "отправка GET запроса в действие Users#edit" do
				before { get edit_user_path(wrong_user) }

				specify { expect(response.body).not_to match(full_title('Редактирование пользовательских данных')) }
				specify { expect(response).to redirect_to(root_url) }
			end

			describe "отправка PATCH запроса в действие Users#update" do
				before { patch user_path(wrong_user) }

				specify { expect(response).to redirect_to(root_url) }
			end
    	end

    	describe "as non-admin user" do
	      	let(:user) { FactoryGirl.create(:user) }
	      	let(:non_admin) { FactoryGirl.create(:user) }

	      	before { sign_in non_admin, no_capybara: true }

	      	describe "submitting a DELETE request to the Users#destroy action" do
		        before { delete user_path(user) }
		        specify { expect(response).to redirect_to(root_url) }
	      	end
	    end
  	end
end