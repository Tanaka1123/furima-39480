class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :addresses
    validates :phone_number,  format: { with: /\A\d+\z/, message: 'is invalid. Input only numbers' },
                              length: { in: 10..11, too_short: 'is too short', too_long: 'is too long' }
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    ShippingAddress.create(postal_code:, prefecture:, city:, addresses:,
                           building:, phone_number:, order:)
  end
end
