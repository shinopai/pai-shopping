class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_current_user

  def show_cart
    @cart_items = CartItem.where(owner_id: @user.cart.id).all

    render :cart
  end

  def confirm_order
    orders = CartItem.where(owner_id: @user.cart)

    orders.each do |order|
      Order.create!(
        quantity: order.quantity,
        user_id: @user.id,
        item_id: order.item_id
      )
    end

    @user.cart.clear

    redirect_to thanks_path
  end


  # private
  def get_current_user
    @user = current_user
  end
end
