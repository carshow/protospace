class Like < ApplicationRecord
  belongs_to :user
  belongs_to :prototype, counter_cache: :likes_count

  validates :user_id, :prototype_id, presence: true
end
