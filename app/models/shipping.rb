class Shipping < ApplicationRecord
  belongs_to :order

  include ActiveModel::Mpdel
  attr_accessor :postal_code, :prefecture, :city, :house_number, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number
  end
end
