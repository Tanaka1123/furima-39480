window.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById('new-item-price')

 // 購入ページのみコードを読み込むための条件分岐
  if (!form) return null;
  if ( document.getElementById('item-price')!= null) {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        let tax = Math.floor(inputValue * 0.1).toLocaleString();
        addTaxDom.innerHTML = tax ;
        profitDom.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString();
    })
  }
});
