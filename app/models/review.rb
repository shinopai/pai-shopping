class Review < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :item

  # validation
  validates :body, presence: true,
                   length: { maximum: 200 }
  validates :user_id, uniqueness: { scope: :item_id }
end
