
const form = document.getElementById("form");
const firstname = document.getElementById("firstname");
const lastname = document.getElementById("lastname");
const email = document.getElementById("email");
const password = document.getElementById("password");
const passwordCheck = document.getElementById("passwordCheck");
const mobilenumber = document.getElementById("mobilenumer");

console.log(form,firstname,lastname,email,password,passwordCheck,mobilenumber);


form.addEventListener("submit", (event) =>
{
	event.preventDefault();
	inspect();
});


function inspect() {
	//The the values from the inputs
	const firstnameValue = firstname.value.trim();
	const lastnameValue = lastname.value.trim();
	const emailValue = email.value.trim();
	const passwordValue = password.value.trim();
	const passwordCheckValue = passwordCheck.value.trim();
	const mobilenumberValue = mobilenumber.value.trim();
	let isValid;
	console.log(firstnameValue,lastnameValue,emailValue,passwordValue,passwordCheckValue,mobilenumberValue)

	if (firstnameValue == "") {
		//display error
		//add error class
		setErrorFor(firstname, "Firstname can't be blank");


	} else {
		//add success class
		setSuccessFor(firstname);


	}
	
	
	if (lastnameValue == "") {
		//display error
		//add error class
		setErrorFor(lastname, "lastname can't be blank");


	} else {
		//add success class
		setSuccessFor(lastname);


	}

	if (emailValue == "") {

		setErrorFor(email, "Email can't be blank");


	}
	else{
		if (!emailverification(emailValue)) {
			setErrorFor(email, "Email is not valid");
		}
		else {
			setSuccessFor(email);
		}
}

//mobile
if (mobilenumberValue == "") {

		setErrorFor(mobilenumber, "mobile number can't be blank");


	}
	else{
		if (!mobilenumberverification(mobilenumberValue)) {
			setErrorFor(mobilenumber, "mobile number is not valid");
		}
		else {
			setSuccessFor(mobilenumber);
		}
}




	if (passwordValue == "") {

		setErrorFor(password, "Password can't be blank");


	}
	else
	{
		if (passwordValue.length < 7) {
			setErrorFor(password, "Password must contain atleast 8 characters");
	
	
		}
		else {
			setSuccessFor(password);
		}
	}


	if (passwordCheckValue == "") {

		setErrorFor(passwordCheck, "Password Check can't be blank");


	} else if (passwordCheckValue !== passwordValue) {
		setErrorFor(passwordCheck, "Password does not match!");


	} else {
		setSuccessFor(passwordCheck);

	}

	
	if (firstnameValue === ""||lastnameValue === "" || emailValue === "" || mobilenumberValue === "" || passwordValue === "" || passwordCheckValue === "" || passwordCheckValue !== passwordValue || passwordValue.length < 7 || (!emailverification(emailValue))||(!mobilenumberverification(mobilenumberValue))) 
	{
		//display error
		//add error class
		isValid = false;
	} 
	else 
	{
	//add success class
		isValid = true;
	}

	if (isValid)
	 {
		form.submit();
	}
}



function setErrorFor(input, message) {
	const formControl = input.parentElement //.form-control
	const small = formControl.querySelector("small");



	//add error message inside small 
	small.innerText = message;

	//add error class

	formControl.className = "form-group error";


}

function setSuccessFor(input, message) {

	const formControl = input.parentElement //.form-control

	formControl.className = "form-group success";

}


function emailverification(emailValue) {
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(emailValue);
}
function mobilenumberverification(mobilenumberValue)
{
	return /^[1-9]\d{9}$/.test(mobilenumberValue);
}



