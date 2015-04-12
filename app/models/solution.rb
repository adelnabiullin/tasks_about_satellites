class Solution < ActiveRecord::Base
  belongs_to :user, counter_cache: true, touch: :solutions_updated_at
  belongs_to :task
  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AttachmentUploader
end
