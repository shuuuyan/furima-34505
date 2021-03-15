require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    @buyer_shipping = FactoryBot.build(:buyer_shipping)
  end

  describe '商品購入機能' do
    context '購入ができる時' do
      it 'postal_code, shippingarea_id, city, address, phone_numberが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end



    context '購入ができない時' do
      it "postal_codeが空では出品できないこと" do  
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end














end
