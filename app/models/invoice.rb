class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :kaigai_order
end


