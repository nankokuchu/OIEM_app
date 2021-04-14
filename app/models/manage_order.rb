class ManageOrder
  include ActiveModel::Model
  attr_accessor :order_tracking_number, :order_weight, :order_id, :arrival_status_id

  with_options presence: true do
    validates :order_tracking_number
    validates :order_weight
    validates :order_id
  end
  
  def save
    manage = Manage.new(order_tracking_number: order_tracking_number, order_weight: order_weight, order_id: order_id)
    manage.save
    Order.find(manage.order.id).update(arrival_status_id: 2)
  end

end