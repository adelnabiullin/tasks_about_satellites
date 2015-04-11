FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :task do
    sequence(:name) { |n| "Task number #{n}" }
    sequence(:content) { |n| "Lorem ipsum #{n} content." }
  end
end
