document.addEventListener('DOMContentLoaded', function(){
  const itemOrderQuantityElement = document.getElementById('item-order-quantity')
  const itemOrderPriceElement = document.getElementById('item-order-price')
  const itemOrderTotalPriceElement = document.getElementById('item-order-total-price')
  itemOrderQuantityElement.addEventListener('keyup', function(){
    const itemOrderQuantity = itemOrderQuantityElement.value
    const itemOrderPrice = itemOrderPriceElement.value
    itemOrderTotalPriceElement.value = Math.floor(itemOrderPrice * itemOrderQuantity)
  })
});