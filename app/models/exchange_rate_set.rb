class ExchangeRateSet < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :exchange_country

  with_options numericality: { other_than: 0, message: "お選びください" } do
    validates :exchange_country_id
  end

  validates :rate, presence: true
end
