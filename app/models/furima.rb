class Furima < ApplicationRecord
  has_one :purchase
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :day
  belongs_to :delivery
  belongs_to :status
  belongs_to :category

  with_options presence: true do
    validates :furima_name
    validates :category_id, numericality: { other_than: 1 }
    validates :price, numericality:       { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :day_id, numericality:      { other_than: 1 }
    validates :status_id, numericality:   { other_than: 1 }
    validates :details
    validates :delivery_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :image
  end
end
