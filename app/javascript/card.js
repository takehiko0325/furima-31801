const pay = () => {
  Payjp.setPublicKey("pk_test_******************"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_sell[number]"),
      cvc: formData.get("user_sell[cvc]"),
      exp_month: formData.get("user_sell[exp_month]"),
      exp_year: `20${formData.get("user_sell[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("user_sell_number").removeAttribute("name");
      document.getElementById("user_sell_cvc").removeAttribute("name");
      document.getElementById("user_sell_month").removeAttribute("name");
      document.getElementById("user_sell_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);