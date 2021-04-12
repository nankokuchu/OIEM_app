document.addEventListener('DOMContentLoaded', function(){

  const purchasePriceElement = document.getElementById('item-ppurchase_price')
  const itemWeightElement = document.getElementById('item-weight')
  const rateElement = document.getElementById('item_ratehoge')
  const overseaFeedElement = document.getElementById('item_overseahoge')
  const domesticFeedElement = document.getElementById('item_domestichoge')
  const buyPriceElement = document.getElementById( "item-purchase_price" )

  const commissionElement = document.getElementById('item_commissionhoge')
  const sellingPriceElement = document.getElementById('item-selling_price')
  const feeElement = document.getElementById('price-text')
  const profitElement = document.getElementById('profit')
  const profitPercentElement = document.getElementById('profit-percent')

  purchasePriceElement.addEventListener('keyup', function(){
    add();
  });

  itemWeightElement.addEventListener('keyup', function(){
    add();
  });

  rateElement.addEventListener('change', function(){
    add();
  });

  overseaFeedElement.addEventListener('change', function(){
    add();
  });

  domesticFeedElement.addEventListener('change', function(){
    add();
  });

  buyPriceElement.addEventListener('keyup', function(){
    add();
  });

  commissionElement.addEventListener('change', function(){
    add();
  });

  sellingPriceElement.addEventListener('keyup', function(){
    add();
  });

  function add(){
    const purchasePrice = purchasePriceElement.value;
    const itemWeight = Math.ceil(itemWeightElement.value);
    console.log(itemWeight)
    const rateValue = rateElement.value;
    const overseaFeed = overseaFeedElement.value;
    const domesticFeed = domesticFeedElement.value;
    buyPriceElement.value = Math.floor(purchasePrice * rateValue + overseaFeed * rateValue * itemWeight + Number(domesticFeed));
    feeElement.innerHTML = Math.floor(sellingPriceElement.value * commissionElement.value);
    profitElement.innerHTML = Math.floor(sellingPriceElement.value - feeElement.innerHTML - buyPriceElement.value );
    profitPercentElement.innerHTML = Math.floor(profitElement.innerHTML / buyPriceElement.value * 100);  
  };
});

