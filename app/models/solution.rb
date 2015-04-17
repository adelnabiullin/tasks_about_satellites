class Solution < ActiveRecord::Base
  belongs_to :user, counter_cache: true, touch: :updated_at
  belongs_to :task
  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AttachmentUploader

  validates :user_id, presence: true
  validates :task_id, presence: true
  validates_presence_of :attachment
end
