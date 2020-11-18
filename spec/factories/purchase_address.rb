FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipality { 'テスト' }
    address { '1-1' }
    phone_number { '11111111111' }
    building_name {"テスト"}
  end
end
