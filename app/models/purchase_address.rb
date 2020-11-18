class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :municipality, :address, :phone_number, :prefecture_id, :building_name, :user_id, :furima_id, :token

  # 各種モデルのバリデーションを記述すること
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number,  format: { with: /\A\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end
  # 各種モデルのバリデーションを記述すること

  def save
    purchase = Purchase.create(user_id: user_id, furima_id: furima_id)
    Address.create(postal_code: postal_code, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, prefecture_id: prefecture_id, purchase_id: purchase.id)
  end
end
