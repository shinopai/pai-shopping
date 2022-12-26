class Order < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :item
end
