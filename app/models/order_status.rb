class OrderStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '未発注' },
    { id: 2, name: '発註済' }
  ]

  include ActiveHash::Associations
  has_many :items
end
