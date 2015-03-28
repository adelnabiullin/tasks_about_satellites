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
	      	before do
		        fill_in "Почта", with: user.email.upcase
		        fill_in "Пароль", with: user.password
		        click_button "Войти"
	      	end

	      	it { should have_title(user.name) }
	      	it { should have_link('Профиль', href: user_path(user)) }
	      	it { should have_link('Выход', href: signout_path) }
	      	it { should_not have_link('Войти', href: signin_path) }

	      	describe "после нажатия на 'выход'" do
		        before { click_link "Выход" }

		        it { should have_link('Вход') }
      		end
		end
	end
end