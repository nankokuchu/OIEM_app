class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :manage
  has_one :order_cancel
  has_one :tracking_number
  has_many :order_kaigai_orders
  has_many :kaigai_orders, through: :order_kaigai_orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :invoice_status
  belongs_to :arrival_status

end
