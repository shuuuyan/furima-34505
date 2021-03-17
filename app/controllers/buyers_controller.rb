class BuyersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation
  before_action :item_buyer
  before_action :buyer_rogin, except: [:index, :show]

  def index
    @buyer_shipping = BuyerShipping.new
  end

  def create
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
      pay_item
      @buyer_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_shipping).permit(:postal_code, :shippingarea_id, :city, :address, :building, :phone_number,:number, :cvc, :exp_month, :exp_year).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy' 
    )
  end

  def contributor_confirmation
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def item_buyer 
    redirect_to root_path unless @item.buyer.nil?
  end

  def buyer_rogin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
