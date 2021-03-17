class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :item_buyer, only: [:edit, :update, :destroy]


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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
   else 
     render :edit
   end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :shippingarea_id, :condition_id, :shippingday_id, :price, :delivery_fee_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def item_buyer 
    redirect_to root_path unless @item.buyer.nil?
  end
end
