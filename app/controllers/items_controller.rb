class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
  end

  private
  
  def itenm_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
