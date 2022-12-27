class Item < ApplicationRecord
  # relation
  belongs_to :sub_category
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :reviews, dependent: :destroy

  # for socialization
  acts_as_likeable
end
