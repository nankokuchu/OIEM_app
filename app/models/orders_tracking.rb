class OrdersTracking
  include ActiveModel::Model

  attr_accessor :price, :quantity, :order_number, :invoice_status_id, :user_id, :item_id, :order_status_id, :arrival_status_id,
                :tracking_number

  with_options presence: true do
    validates :price
    validates :quantity
    validates :user_id
    validates :item_id
    validates :order_number
    validates :arrival_status_id
  end

  def save
    order = Order.new(price: price, quantity: quantity, order_number: order_number, user_id: user_id, item_id: item_id,
                      arrival_status_id: arrival_status_id)
    order.update
    TrackingNumber.create(tracking_number: tracking_number, order_id: order.id)
  end
end
