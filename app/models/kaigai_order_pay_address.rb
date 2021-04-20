class KaigaiOrderPayAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :kaigai_order_id, :user_id, :token

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :user_id
    validates :kaigai_order_id
    validates :token
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    kaigai_order_pay = KaigaiOrderPay.create(user_id: user_id, kaigai_order_id: kaigai_order_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
      building_name: building_name, phone_number: phone_number, kaigai_order_pay_id: kaigai_order_pay.id)
    v_orders = kaigai_order_pay.kaigai_order.orders
    v_orders.update_all(arrival_status_id: 3)
    end
  end
