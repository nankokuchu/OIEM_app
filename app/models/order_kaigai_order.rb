class OrderKaigaiOrder < ApplicationRecord
  belongs_to :order
  belongs_to :kaigai_order
end
