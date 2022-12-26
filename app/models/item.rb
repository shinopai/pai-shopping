class Item < ApplicationRecord
  # relation
  belongs_to :sub_category
  has_many :cart_items, dependent: :destroy
  has_many :orders

  # for socialization
  acts_as_likeable
end
