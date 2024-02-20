const foldButton = document.querySelector('[data-testid="fold-button"]');
const productList = document.querySelector('.css-bd9p1l.e17a7yib10');
let isFolded = false;

foldButton.addEventListener('click', () => {
  if (isFolded) {
    // 펼쳐진 상태일 때의 동작
    productList.style.display = 'block';
    isFolded = false;
  } else {
    // 접힌 상태일 때의 동작
    productList.style.display = 'none';
    isFolded = true;
  }
});