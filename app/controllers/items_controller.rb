class ItemsController < ApplicationController
  before_action :get_all_categories, except: %i(favorite)
  before_action :get_item, except: %i(search get_items_by_category)

  def search
      @items = @q.result.page(params[:page]).per(20)
  end

  def get_items_by_category
    @category = SubCategory.find(params[:id])
    @items = @category.items.page(params[:page]).per(30)

    render :by_category
  end

  def show

  end

  def favorite
    current_user.toggle_like!(@item)

    redirect_to request.referer
  end

  def add_item
    if current_user.cart.nil?
      cart = Cart.new
      cart.user_id = current_user.id
    if cart.save
      cart.add(@item, @item.price, params[:quantity])
      @item.quantity -= params[:quantity].to_i
      @item.save
    end
    else
      cart = current_user.cart
      cart.add(@item, @item.price, params[:quantity])
      @item.quantity -= params[:quantity].to_i
      @item.save
    end

    redirect_to request.referer
  end

  # private
  private
  def get_all_categories
    @categories = Category.all
  end

  def get_item
    @item = Item.find(params[:id])
  end
end
