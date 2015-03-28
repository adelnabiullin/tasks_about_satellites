require 'spec_helper'

describe "Пользовательские страницы" do

	subject { page }

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
		end
  	end

  	describe "страница профиля" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end
end