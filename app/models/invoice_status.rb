class InvoiceStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: 'インボイス未反映' },
    { id: 2, name: 'インボイス反映済み' }
  ]

  include ActiveHash::Associations
  has_many :orders
end
