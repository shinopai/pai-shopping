class Cart < ApplicationRecord
  # relation
  belongs_to :user

  # for shopping cart
  acts_as_shopping_cart_using :cart_item
end
