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


// 장바구니 담기 클릭 시 수량을 넘기며 종료
function cart() {
	
	
	/* window.close();
	var selectedNumber = document.getElementById('selectedNumber').textContent; 
	document.getElementById('qty').value =  selectedNumber;
	console.log(qty + " add cart");
	$.ajax({
		type: 'POST',
		url: 'getCart.do',
		data: {qty:qty}
		/* success: function(response) {
			console.log(response);
			window.close();
		} 
	});
	
	
	
		
        document.getElementById('addCart').value = selectedNumber;
        document.getElementById('myForm').action = 'getCart.do';
        document.getElementById('myForm').submit();
        */
       	
        
} 


/* function setCookie(cname, cvalue, exdays)
{
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/";
}
function getCookie(cname)
{
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i=0; i<ca.length; i++)
    {
        var c = ca[i];
        while(c.charAt(0) == ' ')
        {
            c = c.substring(1);
        }
        if(c.indexOf(name) == 0)
        {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
*/