require 'rails_helper'

RSpec.describe BuyerShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shipping = FactoryBot.build(:buyer_shipping, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  describe '商品購入機能' do
    context '購入ができる時' do
      it '全てのデータが存在すれば登録できる' do
        expect(@buyer_shipping).to be_valid
      end
      it 'buildingは空でも登録できる' do
      @buyer_shipping.building = ''
      expect(@buyer_shipping).to be_valid
      end
    end

    context '購入ができない時' do
      it "postal_codeが空では購入できないこと" do  
        @buyer_shipping.postal_code = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it "shippingarea_idが0では購入できないこと" do  
        @buyer_shipping.shippingarea_id = 0
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Shippingarea can't be blank")
      end
      it "cityが空では購入できないこと" do  
        @buyer_shipping.city = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では購入できないこと" do  
        @buyer_shipping.address = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では購入できないこと" do  
        @buyer_shipping.phone_number = ''
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @buyer_shipping.token = nil
        @buyer_shipping.valid? 
        expect(@buyer_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号にハイフンがないと購入できないこと" do  
        @buyer_shipping.postal_code = '111.1111'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号は全角数字では購入できない' do
        @buyer_shipping.postal_code = '１２３-４５６７'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "電話番号が11桁以内でないと購入できないこと" do  
        @buyer_shipping.phone_number = '090123456789'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は全角数字では購入できない' do
        @buyer_shipping.phone_number = '０９０１２３４５６７８'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は英数字混合では購入できない' do
        @buyer_shipping.phone_number = '0901a1a2b2b'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Phone number is invalid")
      end     
    end
  end
end