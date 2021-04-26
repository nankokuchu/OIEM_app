class OrderKaigaiOrderCancel
  include ActiveModel::Model
  attr_accessor :arrival_status_id, :user_id, :kaigai_order_id

  with_options presence: true do
    validates :user_id
    validates :kaigai_order_id
  end

  def save
    kaigai_order_cancel = KaigaiOrderCancel.create(user_id: user_id, kaigai_order_id: kaigai_order_id)
    v_orders = kaigai_order_cancel.kaigai_order.orders
    v_orders.update_all(arrival_status_id: 2)
  end
end
