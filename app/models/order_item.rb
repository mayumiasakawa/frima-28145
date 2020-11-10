class OrderItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
    # validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number
  end

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture,city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end