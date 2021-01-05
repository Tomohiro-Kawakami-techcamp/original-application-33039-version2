window.addEventListener('load', () => {
  const quantityInput = document.getElementById("quantity");
  quantityInput.addEventListener("input", () => {
    const quantityValue = quantityInput.value;
    const priceValue = document.getElementById("food-price");
    //priceValue.innerHTML = Math.floor(quantityValue * 0.1);
    const sumValue = document.getElementById("sum");
    sumValue.innerHTML = quantityValue * priceValue;
  })
});