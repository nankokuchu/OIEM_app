class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :tracking_number

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :invoice_status
  belongs_to :arrival_status

  with_options presence: true do
    validates :price
    validates :quantity
    validates :user_id
    validates :item_id
    validates :order_number
    validates :arrival_status_id
  end
end
