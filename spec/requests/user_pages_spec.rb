require 'spec_helper'

describe "Пользовательские страницы" do

	subject { page }

  	describe "страница регистрации" do
	    before { visit signup_path }

	    it { should have_content('Регистрация') }
	    it { should have_title(full_title('Регистрация')) }
  	end
end