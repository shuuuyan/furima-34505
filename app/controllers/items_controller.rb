class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")         #新規投稿順
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :shippingarea_id, :condition_id, :shippingday_id, :price, :delivery_fee_id).merge(user_id: current_user.id)
  end
end
