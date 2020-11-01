class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id,  numericality: { other_than: 0 }
    validates :status_id, numericality: { other_than: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :shipping_fee_id, numericality: { other_than: 0 }
    validates :scheduled_delivery_id, numericality: { other_than: 0 }
    end
end
