class DomesticFeed < ActiveHash::Base

  self.data = [
    { price: 0, name: '---' },
    { price: 800, name: 'ゆうパック60サイズ' },
    { price: 900, name: 'ゆうパック80サイズ' },
    { price: 1000, name: 'ゆうパック100サイズ' },
    { price: 1200, name: 'ゆうパック120サイズ' },
    { price: 1400, name: 'ゆうパック140サイズ' },
    { price: 198, name: '日本郵便クリックポスト' },
  ]
end