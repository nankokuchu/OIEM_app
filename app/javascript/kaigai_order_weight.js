document.addEventListener('DOMContentLoaded', function(){
  const orderWeightElement = document.getElementsByName('order-weight');
  const kaigaiOrderWeightElement = document.getElementById('kaigai-order-weight')
  const kaigaiOrderPriceElement = document.getElementById('kaigai-order-price')
  let sum = parseFloat(0)
  for (let i=0; i<orderWeightElement.length; i++){
      if (orderWeightElement[i].checked){
        sum = sum + parseFloat(orderWeightElement[i].value)
      }
      kaigaiOrderWeightElement.value = Math.ceil(sum)
      kaigaiOrderPriceElement.value = 1800+(kaigaiOrderWeightElement.value - 1) * 260
  }



});