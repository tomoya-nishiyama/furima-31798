class OrderAddresse

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :post_code, :prefectre_id, :city, :house_number, :building_name, :phone_number, :price, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectre_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, length: {maximum: 11}
    validates :token
  end

  def save

    order = Order.create(item_id: item_id, user_id: user_id)

    Addresse.create(post_code: post_code, prefectre_id: prefectre_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end