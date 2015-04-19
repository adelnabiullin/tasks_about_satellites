include ActionDispatch::TestProcess

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
    sequence(:name) { |n| "Task #{n}" }
    sequence(:content) { |n| "Lorem ipsum #{n} dolor amet." }
  end

  factory :solution do
    association :user_id, factory: :user
    association :task_id, factory: :task
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'solutions', 'right.java')) }
  end
end
