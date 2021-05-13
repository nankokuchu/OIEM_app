class TransportationExpense < ApplicationRecord
  belongs_to :user

  validates :price, numericality: true, inclusion: { in: 0..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :name, presence: true
end
