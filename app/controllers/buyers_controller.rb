class BuyersController < ApplicationController

  def index
    @buyer_shipping = BuyerShipping.new
  end

  def create
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
       @buyer_shipping.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_shipping).permit(:postal_code, :shippingarea_id, :city, :address, :building, :phone_number, :buyer_shipping, :commit).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

end

# 復習用に残しています。
#9行目でvalid?メソッドを使用しているのは、BuyershippingクラスがApplicationRecordを継承していないことにより、saveメソッドにはバリデーションを実行する機能がないため