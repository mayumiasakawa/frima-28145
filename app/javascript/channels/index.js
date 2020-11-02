// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', function(){
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener('input',function(){
    const addTaxPrice = inputPrice.value * 0.1;
    const profitPrice = (inputPrice.value - addTaxPrice);
    const addTax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTax.innerHTML = `${addTaxPrice}`;
    profit.innerHTML = `${profitPrice}`;
  })
})