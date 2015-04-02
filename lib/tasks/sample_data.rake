namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    Task.create!(name: "Возвращение Моргота", content: "    Имеются два орбитальных спутника: Элендил и Феанор. Они занимаются исследованием территории Средиземья. Имеется ряд различных характеристик поверхности, на основании которых спутники выявляют факт наличия или отсутствия полезных ископаемых в данной местности. Каждый из них способен в процессе сканирования получить значения(1 или 0) лишь определенных параметров поверхности, которые другой самостоятельно узнать не может. Существует функция, аргументами которой являются эти параметры, принимающая значения: 1 - полезные ископаемые есть, 0 - их нет. Спутники должны, обмениваясь информацией, вычислить значение этой функции. Помогите им сделать это так, чтобы при этом они обменялись наименьшим количеством информации. Нужно торопиться, ведь вся Арда в опасности! Мелькор вернулся и собирает войска, а у нуменорцев после Войны Кольца не осталось ресурсов для ковки снаряжения и постройки оборонительных сооружений.")
    99.times do |n|
      name = Faker::Company.name
      content = Faker::Lorem.paragraph
      Task.create!(name: name, content: content)
    end
  end
end