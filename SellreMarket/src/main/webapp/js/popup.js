let selectedNumber = 1; // Initial value


// 번호를 받아서 -1, +1 selectNumber에 적용한다.
function updateNumber(change) {
	selectedNumber += change;

	// Ensure the number stays within the range of 1 to 10
	selectedNumber = Math.min(Math.max(selectedNumber, 1), 10);

	// Update the displayed number using textContent
	document.getElementById('selectedNumber').textContent = selectedNumber;

	// Update the total price when the selected number changes
	updateTotalPrice(selectedNumber);
	addCart(selectedNumber);
}

// total price sum을 위한 함수
function updateTotalPrice(selectedNumber) {
	const hiddenPrice = document.getElementById('hiddenPrice');
	const totalPriceElement = document.getElementById('totalPrice');

	// Get the current total price as an integer
	const totalPrice = parseInt(hiddenPrice.value.replace(/,/g, ""), 10);

	// Update the total price by multiplying it with the selected number
	const newTotalPrice = totalPrice * selectedNumber;

	// Set the new total price as the content of the element
	totalPriceElement.textContent = newTotalPrice.toLocaleString(); // Add commas back
}


function addCart(selectedNumber) {
	/* var selectedNumber = document.getElementById('selectedNumber').textContent; */

	$.ajax({
		type: 'POST',
		url: 'getCart.do',
		data: { selectedNumber: selectedNumber }
		/* success: function(response) {
			window.location.href('getCart.do');
		} */
	});

        /* document.getElementById('addCart').value = selectedNumber;
        document.getElementById('myForm').action = 'getCart.do';
        document.getElementById('myForm').submit(); */
        
}