class TrackingNumber < ApplicationRecord
  belongs_to :order

  validates :number, presence: true, format: { with: /\A[a-z0-9]+\z/i }
end
