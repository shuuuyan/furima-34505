class BuyerShipping 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shippingarea_id, :city, :address, :building, :phone_number

  validates :user_id, :item_id, :postal_code, :shippingarea_id, :city,:address, :phone_number, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shippingarea_id, numericality: {other_than: 0, message: "can't be blank"}
validates :phone_number, format: { with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/, message: "is invalid"}



  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, shippingarea_id: shippingarea_id, city: city, address: address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
  
end

