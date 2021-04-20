class KaigaiOrderPay < ApplicationRecord
  belongs_to :user
  belongs_to :kaigai_order
  has_one :address
end
