FactoryBot.define do
  factory :furima do
    furima_name  { 'テスト' }
    category_id  { 2 }
    day_id       { 2 }
    status_id    { 2 }
    details      { 'テスト' }
    delivery_id  { 2 }
    prefecture_id { 2 }
    price { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
