class HomeController < ApplicationController
  def index
    @categories = Category.all.order(created_at: :desc)
    @recommend_items = Item.order("RAND()").limit(3)
    @new_items = Item.order(created_at: :desc).limit(40)
  end
end
