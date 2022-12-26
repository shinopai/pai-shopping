class CartItem < ApplicationRecord
  # for shopping cart
  acts_as_shopping_cart_item_for :cart

  # relation
  belongs_to :item
end
