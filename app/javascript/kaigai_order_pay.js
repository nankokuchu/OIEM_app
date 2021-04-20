window.addEventListener('load', pay);

function pay(){
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) =>{
    e.preventDefault()
    
    const formInfo = document.getElementById('charge-form')
    const formData = new FormData(formInfo)

    const card = {
      number: formData.get("kaigai_order_pay_address[number]"),
      cvc: formData.get("kaigai_order_pay_address[cvc]"),
      exp_month: formData.get("kaigai_order_pay_address[exp_month]"),
      exp_year: `20${formData.get("kaigai_order_pay_address[exp_year]")}`,
    }
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const formToken = document.getElementById('charge-form')
        const tokenObj = `<input name= "token", value= ${token} type= "hidden">`
        formToken.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute('name');
      document.getElementById("card-exp-month").removeAttribute('name');
      document.getElementById("card-exp-year").removeAttribute('name');
      
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();

    });
  });
};
