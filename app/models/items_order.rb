class ItemsOrder
  include ActiveModel::Model
  attr_accessor :price, :quantity, :order_number, :invoice_status_id, :user_id, :item_id, :order_status_id, :arrival_status_id

  with_options presence: true do
    validates :price
    validates :quantity
    validates :user_id
    validates :item_id
    validates :order_number
  end

  def save
    order = Order.new(price: price, quantity: quantity, arrival_status_id: arrival_status_id,
                      invoice_status_id: invoice_status_id, user_id: user_id, item_id: item_id, order_number: order_number)
    order.save
    Item.find(order.item.id).update(order_status_id: 2)
  end
end
