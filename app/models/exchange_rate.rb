class ExchangeRate < ActiveHash::Base

  self.data = [
    { rate: 0, exchange: '---'},
    { rate: 16.79, exchange: '中国人民元のレート'},
    { rate: 0.98, exchange: '韓国ウォンレート'},
  ]

end
