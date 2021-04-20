class Address < ApplicationRecord
  belongs_to :kaigai_order_pay

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
