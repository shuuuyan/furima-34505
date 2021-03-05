FactoryBot.define do
  factory :user do
    nickname { 'tarou' }
    email { Faker::Internet.free_email }
    password              { 'a12345' }
    password_confirmation { 'a12345' }
    familyname           { '山田' }
    familyname_kana      { 'ヤマダ' }
    firstname            { '太郎' }
    firstname_kana       { 'タロウ' }
    birthdate { '2000-01-01' }
  end
end
