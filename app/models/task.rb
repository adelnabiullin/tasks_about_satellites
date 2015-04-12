class Task < ActiveRecord::Base
  has_many :solutions, dependent: :destroy
  has_many :users, through: :solutions

  validates :name, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 1500 }
end
