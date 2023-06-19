class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token
 
 with_options presence: true do
    validates :token, presence: true
    validates :user_id
    validates :postal_code, presence: { message: "can't be blank" }, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :city, presence: { message: "can't be blank" }
    validates :addresses, presence: { message: "can't be blank" }
    validates :phone_number, presence: { message: "can't be blank" }, length: { minimum: 10, message: "is too short" }, numericality: { only_integer: true, message: "is invalid. Input only numbers" }
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  
  
  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, phone_number: phone_number, order: order)
  end
end
