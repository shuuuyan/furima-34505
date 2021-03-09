FactoryBot.define do
  factory :item do
    name            { '写真' }
    description     { '貰い物' }
    category_id     { 1 }
    condition_id    { 1 }
    delivery_fee_id { 1 }
    shippingarea_id { 1 }
    shippingday_id  { 1 }
    price           { 1000 }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end


# email { Faker::Internet.free_email }
# content {Faker::Lorem.sentence}
# association :user
# association :room

