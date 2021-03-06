class CapturedImage < ApplicationRecord
  belongs_to :prototype, optional: true

  mount_uploader :content, ContentUploader

  validates :content, :status, presence: true
end
