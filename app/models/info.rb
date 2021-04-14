class Info < ApplicationRecord
  with_options presence: true do
    validates :info_order_tracking_number
    validates :info_order_weight
  end
end
