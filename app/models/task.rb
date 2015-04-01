class Task < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 60 }
	validates :content, presence: true, length: { maximum: 1500 }
end