class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shippingarea
  belongs_to :condition
  belongs_to :shippingday
  belongs_to :delivery_fee

  validates :name, :description, :category_id, :shippingarea_id, :condition_id, :shippingday_id, :price, :delivery_fee_id,  presence: true
  validates :category_id, :shippingarea_id, :condition_id, :shippingday_id, :delivery_fee_id, numericality: { other_than: 0 } 

  # validates :name,            presence: true
  # validates :description,     presence: true
  # validates :category_id,     presence: true
  # validates :shippingarea_id, presence: true
  # validates :condition_id,    presence: true
  # validates :shippingday_id,  presence: true
  # validates :price,           presence: true
  # validates :delivery_fee_id, presence: true
end
