window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
     priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value
     addTaxDom.innerHTML = Math.round(inputValue * 0.1 );
     addProfitDom.innerHTML = Math.round(inputValue * 0.9)
 })
});