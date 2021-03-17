class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one    :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shippingarea
  belongs_to :condition
  belongs_to :shippingday
  belongs_to :delivery_fee

  validates :image, :name, :description, :category_id, :shippingarea_id, :condition_id, :shippingday_id, :price, :delivery_fee_id,  presence: true
  validates :category_id, :shippingarea_id, :condition_id, :shippingday_id, :delivery_fee_id, numericality: { other_than: 0 } 
  validates :price, numericality: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/, message: 'is invalid' }
  validates :price, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
end
