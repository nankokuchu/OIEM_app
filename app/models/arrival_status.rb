class ArrivalStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '新規' },
    { id: 2, name: '処理中' },
    { id: 3, name: '海外発送済' },
    { id: 4, name: '処理済' },
    { id: 5, name: 'キャンセル' }
  ]

  include ActiveHash::Associations
  has_many :orders
end
