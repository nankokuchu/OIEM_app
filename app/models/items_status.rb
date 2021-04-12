class ItemsStatus < ActiveHash::Base

  self.data = [
    { id: 1, name: '表示' },
    { id: 2, name: '非表示' },
  ]

  include ActiveHash::Associations
  has_many :items
end