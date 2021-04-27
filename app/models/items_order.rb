class ItemsOrder
  include ActiveModel::Model
  attr_accessor :order_name, :total_price, :item_price, :quantity, :order_number, :invoice_status_id, :user_id, :item_id, :order_status_id, :arrival_status_id,
                :order_invoice_item_name, :order_invoice_item_material, :order_invoice_item_price

  with_options presence: true do
    validates :order_name
    validates :user_id
    validates :item_id
    validates :order_number
    validates :order_invoice_item_name
    validates :order_invoice_item_material
    validates :order_invoice_item_price
  end

  with_options numericality: true, format: { with: /\A[0-9]+\z/ } do
    validates :total_price
    validates :item_price
    validates :quantity
  end

  def save
    order = Order.new(total_price: total_price, item_price: item_price, order_name: order_name, quantity: quantity, arrival_status_id: arrival_status_id,
                      invoice_status_id: invoice_status_id, user_id: user_id, item_id: item_id, order_number: order_number)
    order.save
    Item.find(order.item.id).update(order_status_id: 2)

    order_invoice = OrderInvoice.new(order_invoice_item_name: order_invoice_item_name,
                                     order_invoice_item_material: order_invoice_item_material, order_invoice_item_price: order_invoice_item_price, order_invoice_item_quantity: order.quantity, order_id: order.id)
    order_invoice.save
  end
end
