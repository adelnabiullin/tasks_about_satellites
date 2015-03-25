require 'spec_helper'

describe "Статические страницы" do

	subject { page }

	describe "Главная страница" do
		before { visit root_path }

		it { should have_content('Задачи о Спутниках') }
		it { should have_title('Задачи о Спутниках') }
		it { should_not have_title('Главная') }
	end

	describe "Страница 'Помощь'" do
		before { visit help_path }

		it { should have_content('Помощь') }
		it { should have_title('Задачи о Спутниках | Помощь') }
	end

	describe "Страница 'О нас'" do
		before { visit about_path }

		it { should have_content('О нас') }
		it { should have_title('Задачи о Спутниках | О нас') }
	end
end