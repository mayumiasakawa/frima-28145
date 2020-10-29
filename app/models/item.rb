class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image

  VALID_NUMBER_REGEX = /^[300-9999999]/
  validates :name, presence: true
  validates :text, presence: true
  validates :category, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true
  # validates :price, presence: true, format: { with: VALID_NUMBER_REGEX }, length: { minimum: 3, maximum: 8 }
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery, presence: true
end
