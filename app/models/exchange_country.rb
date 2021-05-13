class ExchangeCountry < ActiveHash::Base
  self.data = [
    { id: 0, country: '---' },
    { id: 1, country: '中国人民元(CNY)' },
    { id: 2, country: '韓国ウォン(KRW)' }
  ]

  include ActiveHash::Associations
  has_many :exchange_rate_sets
end