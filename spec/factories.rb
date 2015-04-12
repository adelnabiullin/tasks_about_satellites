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

<<<<<<< HEAD
	factory :task do
		sequence(:name) { |n| "Task number #{n}" }
		sequence(:content) { |n| "Lorem ipsum #{n} content." }
	end

	factory :solution do
		# ignore do
		# 	fail_file false
		# 	large_file false
		# 	wrong_ext false
		# end

		# content {
		# 	Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/right_small_file.java"), 'text/java')
		# }

		content {
			fixture_file_upload('/files/right_small_file.java', 'text/x-java')
		}
		
		# do
		# 	if wrong_ext
		# 		fixture_file_upload(Rails.root.join('spec', 'files', 'wrong_ext_file.jav').to_s, 'text/plain')
		# 	else
		# 		if fail_file
		# 			if large_file
		# 				fixture_file_upload(Rails.root.join('spec', 'files', 'fail_large_file.java').to_s, 'text/x-java')
		# 			else
		# 				fixture_file_upload(Rails.root.join('spec', 'files', 'fail_small_file.java').to_s, 'text/x-java')
		# 			end
		# 		else
		# 			if large_file
		# 				fixture_file_upload(Rails.root.join('spec', 'files', 'right_large_file.java').to_s, 'text/x-java')
		# 			else
		# 				fixture_file_upload('/files/right_small_file.java', 'text/x-java')
		# 			end
		# 		end
		# 	end
		# end
	end
end
=======
  factory :task do
    sequence(:name) { |n| "Task number #{n}" }
    sequence(:content) { |n| "Lorem ipsum #{n} content." }
  end
end
>>>>>>> file-uploads-paperclip
