document.addEventListener("DOMContentLoaded", function() {
  var quantity = parseInt(document.querySelector('.count').innerText);
  var decreaseButton = document.querySelector('button[aria-label="수량내리기"]');

  setButtonState();

  document.querySelector('button[aria-label="수량올리기"]').addEventListener('click', function() {
    quantity++;
    updateQuantity();
    setButtonState();
  });
  
  decreaseButton.addEventListener('click', function() {
    quantity--;
    updateQuantity();
    setButtonState();
  });

  function updateQuantity() {
    document.querySelector('.count').innerText = quantity;
  }

  function setButtonState() {
    if (quantity <= 1) {
      decreaseButton.disabled = true;
      decreaseButton.classList.remove('css-8azp8', 'e1hx75jb0');
      decreaseButton.classList.add('css-1e90glc', 'e1hx75jb0');
    } else {
      decreaseButton.disabled = false;
      decreaseButton.classList.remove('css-1e90glc', 'e1hx75jb0');
      decreaseButton.classList.add('css-8azp8', 'e1hx75jb0');
    }
  }
});
