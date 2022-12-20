class ItemsController < ApplicationController
  before_action :get_all_categories

  def search
    @items = @q.result.page(params[:page]).per(20)
  end

  def get_items_by_category
    @category = SubCategory.find(params[:id])
    @items = @category.items.page(params[:page]).per(30)

    render :by_category
  end


  # private
  private
  def get_all_categories
    @categories = Category.all
  end
end
