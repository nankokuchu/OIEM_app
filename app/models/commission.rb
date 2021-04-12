class Commission < ActiveHash::Base
  
  self.data = [
    { percent: 0, name: '---'},
    { percent: 0.1, name: '手数料10％'},
    { percent: 0.11, name: '手数料11％'},
    { percent: 0.12, name: '手数料12％'},
    { percent: 0.13, name: '手数料13％'},
    { percent: 0.14, name: '手数料14％'},
    { percent: 0.15, name: '手数料15％'},
    { percent: 0.16, name: '手数料16％'},
    { percent: 0.17, name: '手数料17％'},
    { percent: 0.18, name: '手数料18％'},
    { percent: 0.19, name: '手数料19％'},
    { percent: 0.2, name: '手数料20％'},
  ]
end