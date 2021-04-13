class TrackingNumber < ApplicationRecord
  belongs_to :order

  validates :number, presence: true
end
