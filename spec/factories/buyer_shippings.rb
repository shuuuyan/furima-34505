FactoryBot.define do
  factory :buyer_shipping do
    postal_code { '123-4567' }
    shippingarea_id { 1 }
    city              { '横浜市' }
    address { '青山1-1' }
    phone_number           { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end