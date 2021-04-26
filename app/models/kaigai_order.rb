class KaigaiOrder < ApplicationRecord
  belongs_to :user
  has_one :invoice
  has_one :kaigai_tracking
  has_one :kaigai_order_over
  has_one :kaigai_order_cancel
  has_one :kaigai_order_pay
  has_many :order_kaigai_orders
  has_many :orders, through: :order_kaigai_orders

  with_options presence: true do
    validates :kaigai_order_name
    validates :kaigai_order_weight
  end

  validates :kaigai_order_price, numericality: true, inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
