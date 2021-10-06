<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<!-- CSS only -->
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>Document</title>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('.toast').toast("show");

	});
</script>
<style>
body {
	font-family: 'Poppins';
}
</style>
</head>
<body>
	<%-- <div class="container">

		<!--Header-->
		<div class="row">
			<div class="col-md-12  mt-4">
				<div class="page-header text-center" style="height: 50px;">
					<h3 class="text-white">Welcome to Railway Reservation System</h3>
				</div>
			</div>
		</div>

		<div class="row">

			<!--Left Carousel-->
			<div class="col-md-6">
				<div class="carousel slide" id="carousel-281405">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-281405"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-281405"></li>
						<li data-slide-to="2" data-target="#carousel-281405"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="/images/train1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="/images/train2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="https://dq1eylutsoz4u.cloudfront.net/2019/02/21170759/cute-texts-for-him.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-281405"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-281405"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
			</div>


			<!--Form component-->
			<div class="col-md-6">
				<!--TAB-->
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-link" id="nav-home-tab" data-toggle="tab"
							href="#nav-home" role="tab" aria-controls="nav-home"
							aria-selected="true">Signin</a> <a class="nav-link"
							id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
							role="tab" aria-controls="nav-profile" aria-selected="false">Signup</a>
					</div>
				</nav>

				<!--Tab-->
				<div class="tab-content" id="nav-tabContent">


					<!--SIGN IN-->

					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<form role="form" action="/login" method="post">
							<div class="form-group text-center">
								<div class="avatar">
									<!-- Avatar image -->
									<img class="avatar__image" src="/images/img_avatar.png" />
								</div>
							</div>
							<c:if test="${param.error!=null}">
								<div class="alert alert-danger" role="alert">You entered
									wrong credentials!</div>
							</c:if>
							<c:if test="${not empty success}">
								<div class="alert alert-success" role="alert">${success}</div>
							</c:if>
							<div class="form-group">

								<label for="exampleInputEmail1"> Email address </label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="username" />
							</div>
							<div class="form-group">

								<label for="exampleInputPassword1"> Password </label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" />
							</div>
							<sec:csrfInput />
							<div class="form-group text-center">
								<button type="submit" class="btn btn-primary">Signin</button>
							</div>
							<div class="text-center">
								<p>
									Don't have account? <a href="" class=""> signup</a>
								</p>
							</div>
						</form>
					</div>


					<!--SIGN UP-->
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">

						<form role="form" action="/signup" method="post"
							onsubmit="return formValidation()">
							<div class="row">
								<div class="col-6">
									<div class="form-group">

										<label for="exampleInputFirstName"> First Name </label> <input
											type="text" class="form-control" id="FirstName"
											name="firstName" />
										<div id="firstNameError" class="text-danger"></div>
									</div>

								</div>
								<div class="col-6">
									<div class="form-group">

										<label for="exampleInputLastName"> Last Name </label> <input
											type="text" class="form-control" id="LastName"
											name="lastName" />
										<div id="lastNameError" class="text-danger"></div>
									</div>

								</div>
								<div class="col-md-12">
									<div class="form-group">

										<label for="exampleInputEmail1"> Email address </label> <input
											type="email" class="form-control" id="Email" name="email" />
										<div id="emailError" class="text-danger"></div>
									</div>

								</div>
								<div class="col-md-12">
									<div class="form-group">

										<label for="exampleInputPassword1"> Password </label> <input
											type="password" class="form-control" id="Password1"
											name="password" />
										<div id="passwordError" class="text-danger"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">

										<label for="Password2"> Confirm Password </label> <input
											type="password" class="form-control" id="Password2"
											name="confirmPassword" />
										<div id="confirmPasswordError" class="text-danger"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">

										<label for="exampleInputNumber"> Mobile Number </label> <input
											type="text" class="form-control" id="Number"
											name="mobileNumber" />
										<div id="mobileError" class="text-danger"></div>
									</div>

								</div>
								<div class="form-group col-md-12 text-center">
									<button type="submit" class="btn-sm btn-primary">Signup</button>
									<p>
										Already register? <a href="" class=""> signin</a>
									</p>
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>




		</div>

	</div>










	<!-- <script>
			function formValidation() {
				var firstName = document.getElementById("FirstName").value;
				var lastName = document.getElementById("LastName").value;
				var email = document.getElementById("Email").value;
				var password1 = document.getElementById("Password1").value;
				var password2 = document.getElementById("Password2").value;
				var mobNumber = document.getElementById("Number").value;

				var firstNameError = document.getElementById("firstNameError");
				var lastNameError = document.getElementById("lastNameError");
				var emailError = document.getElementById("emailError");
				var passwordError = document.getElementById("passwordError");
				var confirmPasswordError = document
						.getElementById("confirmPasswordError");
				var mobileError = document.getElementById("mobileError");
				var result = true;
				
				
				if (firstName === "") {
					firstNameError.innerHTML = "FirstName is required";
					result = false;
				}
				if (lastName ==="") {
					lastNameError.innerHTML = "LastName is required";
					result = false;
				}
				if (email === "") {
					emailError.innerHTML = "Valid email is required";
					result = false;
				}
				if (password1 === "") {
					passwordError.innerHTML = "Password is required";
					result = false;
				}
				if (password2 === "") {
					confirmPasswordError.innerHTML = "Confirm password is required";
					result = false;
				}
				if (password1 !== "" && password !== ""
						&& password1 !== password2) {
					confirmPasswordError.innerHTML = "Password match not found";

				}
				if (mobNumber === "") {
					mobileError.innerHTML = "Mobile Number is required";
					result = false;
				}
				if (mobNumber !== "" && mobileNumber.length() !== 10) {
					mobileError.innerHTML = "Mobile Number should contain 10 numbers";
					result = false;
				}
				return result;
			}
		</script> -->





	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
 --%>





	<div class="container" style="position: relative;">
		<!-- Toast Message -->
		<c:if test="${not empty successfulmsg}">
			<div class="toast show bg-success"
				style="position: absolute; top: 0; right: 0; z-index: 1;"
				data-delay="2000">
				<div class="toast-body text-white">
					${successfulmsg}<span><button type="button"
							class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button></span>
				</div>
			</div>
		</c:if>
		<!--Header-->
		<div class="row">
			<div class="col-md-12 mt-4">
				<div class="page-header text-center" style="height: 50px">
					<h3 class="text-white">Welcome to Railway Reservation System</h3>
				</div>
			</div>
		</div>
		<c:if test="${not empty errMsg}">
			<div class="alert alert-danger text-center" role="alert">${errMsg}</div>
		</c:if>
		<div class="row mt-5">

			<!--Left Carousel-->
			<div class="col-md-6">
				<div class="carousel slide" id="carousel-281405">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-281405"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-281405"></li>
						<li data-slide-to="2" data-target="#carousel-281405"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="/images/train1.jpg" />
							<div class="carousel-caption">
								<h4>Online Booking</h4>
								<p>Welcome ladies and gentlemen,Visiting your favourite
									holiday destination has just got smoother by booking your
									tickets easily.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="/images/train2.jpg" />
							<div class="carousel-caption">
								<h4>Smoother Experience</h4>
								<p>There's no better way to enjoy India's outback in one
									easy places in comfort.Let's enjoy the journey through
									track!...</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="https://dq1eylutsoz4u.cloudfront.net/2019/02/21170759/cute-texts-for-him.jpg" />
							<div class="carousel-caption">
								<h4>Ticket in Hand</h4>
								<p>No more long queue.Book online and You will enjoy your
									journey and we look forward to your next Hassle-Free journey
									with us! ...</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-281405"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-281405"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
			</div>

			<!--Form component-->
			<div class="col-md-6">
				<!--TAB-->
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-link" id="nav-home-tab" data-toggle="tab"
							href="#nav-home" role="tab" aria-controls="nav-home"
							aria-selected="true">Signin</a> <a class="nav-link"
							id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
							role="tab" aria-controls="nav-profile" aria-selected="false">Signup</a>
					</div>
				</nav>

				<!--Tab-->
				<div class="tab-content" id="nav-tabContent">
					<!--SIGN IN-->

					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<form role="form" action="/login" method="post">
							<div class="form-group text-center">
								<div class="avatar">
									<!-- Avatar image -->
									<img class="avatar__image" src="/images/img_avatar.png" / alt="avatar">
								</div>
							</div>
							<c:if test="${param.error!=null}">
								<div class="alert alert-danger" role="alert">You entered
									wrong credentials!</div>
							</c:if>
							<c:if test="${not empty success}">
								<div class="alert alert-success" role="alert">${success}</div>
							</c:if>
							<div class="form-group">
								<label for="exampleInputEmail1"> Email address </label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									placeholder="name@domain.com" name="username" required />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1"> Password </label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" placeholder="Enter your password" required />
							</div>
							<sec:csrfInput />
							<div class="form-group text-center">
								<button type="submit" class="btn btn-primary">Signin</button>
							</div>
							<div class="text-center">
								<p>
									Don't have account? <a href="" class=""> signup</a>
								</p>
							</div>
						</form>
					</div>

					<!--SIGN UP-->
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<form name="form" id="form" method="post" action="/signup">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label for="exampleInputFirstName">Firstname</label> <input
											type="text" class="form-control" id="firstname"
											placeholder="Enter Your Firstname" name="firstName" /> <em
											class="fas fa-check-circle"></em> <em
											class="fas fa-exclamation-circle"></em> <small
											id="firstNameError" class="text-danger">Error message</small>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label for="exampleInputLastName">Lastname</label> <input
											type="text" class="form-control" id="lastname"
											placeholder="Enter Your Lastname" name="lastName" /> <em
											class="fas fa-check-circle"></em> <em
											class="fas fa-exclamation-circle"></em> <small
											id="lastNameError" class="text-danger">Error message</small>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputEmail1">Email</label> <input
											type="email" class="form-control" id="email"
											placeholder="name@domain.com" name="email" /> <em
											class="fas fa-check-circle"></em> <em
											class="fas fa-exclamation-circle"></em> <small id="emailError"
											class="text-danger">Error message</small>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputPassword1">Password</label> <input
											type="password" class="form-control" id="password"
											placeholder="Enter Password" name="password" /> <em
											class="fas fa-check-circle"></em> <em
											class="fas fa-exclamation-circle"></em> <small
											class="text-danger">Error message</small>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="Password2">Password Check</label> <input
											type="password" class="form-control" id="passwordCheck"
											placeholder="Retype your Password" name="confirmPassword" />
										<em class="fas fa-check-circle"></em> <em
											class="fas fa-exclamation-circle"></em> <small
											id="confirmPasswordError" class="text-danger">Error
											message</small>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="exampleInputNumber">Mobile Number</label> <input
											type="text" class="form-control" id="mobilenumer"
											placeholder="enter your mobile number" name="mobileNumber" />
										<em class="fas fa-check-circle"></em> <em
											class="fas fa-exclamation-circle"></em> <small
											class="text-danger">Error message</small>
									</div>
								</div>
								<div class="form-group col-md-12 text-center">
									<button type="submit" class="btn-sm btn-primary">Signup</button>
									<p>
										Already register? <a href="" class=""> signin</a>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script src="/js/myscript.js"></script>
</body>
</html>