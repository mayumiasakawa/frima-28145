class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  VALID_NUMBER_REGEX = /^[300-9999999]/
  validates :name, presence: true
  validates :text, presence: true
  validates :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 }
  validates :status_id, presence: true
  # validates :price, presence: true, format: { with: VALID_NUMBER_REGEX }, length: { minimum: 3, maximum: 8 }
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery, presence: true
end
