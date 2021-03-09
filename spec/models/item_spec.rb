require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品登録' do
    context '出品ができる時' do
      it 'image, name, description, category_id, shippingarea_id, condition_id, shippingday_id, price, delivery_fee_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end

    end
    context '出品ができない時' do
      it "imageが空では出品できないこと" do  
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが0では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'condition_idが0では出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'delivery_fee_idが0では出品できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
      end
      it 'shippingarea_idが0では出品できない' do
        @item.shippingarea_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingarea must be other than 0")
      end
      it 'shippingday_idが0では出品できない' do
        @item.shippingday_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingday must be other than 0")
      end
      it 'priceは半角数字でなければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは¥300~¥9,999,999の間意外だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end