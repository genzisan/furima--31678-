window.addEventListener('load', () => {
  console.log("ok")
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const priceProfit = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
      addTaxDom.innerHTML = Math.floor(inputValue　/ 10)
      priceProfit.innerHTML = Math.floor(inputValue　* 0.9)
    })
});

//Math.floor(5.3)
//=> 5

//const test = 1.1
//Math.floor(test + 1)
//=> 2