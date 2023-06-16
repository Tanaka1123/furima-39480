class ShippingCharge < ActiveHash::Base
  self.data = [
    { id: 0, charge: '---', fee: '---' },
    { id: 1, charge: '着払い(購入者負担)', fee: '着払い(購入者負担の送料)' },
    { id: 2, charge: '送料込み(出品者負担)', fee: '送料込み(出品者負担の送料)' }
  ]
end
