<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<!-- CSS only -->
<link rel="stylesheet" href="/css/home.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
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

html {
	scroll-behavior: smooth;
}

#contact .card:hover i, #contact .card:hover h4 {
	color: #87d37c;
}

@media only screen and (max-width: 600px) {
}

#section1, #section2, #section3 {
	height: 100vh;
	background-color: steelblue;
}

}
.card {
	cursor: pointer
}

.card.hover, .card:hover {
	box-shadow: 0 20px 40px rgba(0, 0, 0, .2)
}

.img {
	margin-bottom: 35px;
	-webkit-filter: drop-shadow(5px 5px 5px #222);
	filter: drop-shadow(5px 5px 5px #222)
}

.card-title {
	font-weight: 600
}

button.focus, button:focus {
	outline: 0;
	box-shadow: none !important
}
</style>
</head>
<body>
	<div class="container" style="padding: 0; position: relative;">
		<!-- Toasts Messages -->
		<c:if test="${not empty successfulmsg}">
			<div class="toast show bg-success"
				style="position: absolute; top: 0; right: 0;z-index:10000;" data-delay="2000">
				<div class="toast-body text-white">
					${successfulmsg}<span><button type="button"
							class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button></span>
				</div>
			</div>
		</c:if>
		<!--NAVBAR-->

		<nav class="navbar w-100 navbar-expand-lg sticky-top navbar-light"
			style="margin: 0px;">
			<a class="navbar-brand" href="#">Welcome
				${sessionScope.currentUser.getFirstName()}</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav w-100 d-flex d-flex justify-content-end">
					<li class="nav-item active"><a class="nav-link" href="/home">Home
							<span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#section2">Services</a>
					<li class="nav-item"><a class="nav-link " href="#section3">Contacts
					</a></li>


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Profile </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/visitprofile">${sessionScope.currentUser.getFirstName()}</a>
							<a class="dropdown-item" href="/viewtickets">Your Tickets</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/logoutSuccess">Logout</a>
						</div></li>
				</ul>

			</div>
		</nav>

		<div class="main" id="section1">
			<c:if test="${noTrains!=null}">
				<div class="alert alert-danger text-center" role="alert">${noTrains}</div>
			</c:if>
			<c:if test="${not empty errMsg}">
				<div class="alert alert-danger text-center" role="alert">${errMsg}</div>
			</c:if>
			<div
				class="d-flex flex-row justify-content-center align-items-center mt-5">

				<div
					class="p-2 text-white d-flex flex-row justify-content-center align-items-center">
					<form class="col-12" action="/available/trains" method="post">
						<div class="form-group">
							<label for="formGroupExampleInput">From</label> <input
								type="text" class="form-control" id="formGroupExampleInput"
								placeholder="search source" name="source">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">To</label> <input type="text"
								class="form-control" id="formGroupExampleInput2"
								placeholder="search destination" name="destination">
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput3">Date</label> <input
								type="date" class="form-control" id="formGroupExampleInput3"
								placeholder="journey date" name="date">
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info">Search Trains</button>
						</div>
					</form>


				</div>

			</div>

		</div>

		<div class="main" id="section2">

			<div class="row justify-content-center align-content-center"
				style="height: 100vh;">
				<div class="col-sm-12 text-white">

					<h3 class="text-center text-uppercase ">Services</h3>
					<p class="text-center w-50 m-auto">This platform provides a
						service of user friendly with high range maintenance.Provides
						security for the user effectively.</p>

				</div>
				<div class="card col-md-3 col-12 my-5">
					<div class="card-content">
						<div class="card-body text-center">
							<img class="img" src="https://i.imgur.com/S7FJza5.png" / alt="card-1">
							<div class="shadow"></div>
							<div class="card-title">We're Free</div>
							<div class="card-subtitle">
								<p>
									<small class="text-muted">No reservation fees We do not
										charge you any booking fees or add any administrative charges.
										And in many cases, your booking can be cancelled free of
										charge.</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card col-md-3 col-12 ml-2 my-5">
					<div class="card-content">
						<div class="card-body text-center">
							<img class="img" src="https://i.imgur.com/xUWJuHB.png" / alt="card-3">
							<div class="card-title">Secure booking</div>
							<div class="card-subtitle">
								<p>
									<small class="text-muted"> We facilitate hundreds of
										thousands of transactions every day through our secure
										platform, and work to the highest standards to guarantee your
										privacy.</small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card col-md-3 col-12 ml-2 my-5">
					<div class="card-content">
						<div class="card-body text-center">
							<img class="img mt-3" src="https://i.imgur.com/rG3CGn3.png" / alt="card-2">
							<div class="card-title mt-3">24/7 support</div>
							<div class="card-subtitle">
								<p>
									<small class="text-muted">Whether you have just booked
										or are already enjoying your trip, our customer experience
										team are on hand around the clock to answer your questions and
										advocate on your behalf in more than 40 languages.</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="main" id="section3">


			<div class="row justify-content-center align-content-center"
				style="height: 100vh;" id="contact">
				<div class="col-sm-12 text-white">

					<h3 class="text-center text-uppercase ">contact us</h3>
					<p class="text-center w-50 m-auto">Contact us, we would love to
						hear from you! If you have a question, call us or send us an email
						that we pleasure to service you.We will answer you within 24
						hours.</p>

				</div>
				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">call us</h4>
							<p>04342-432234</p>
						</div>
					</div>
				</div>

				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">office location</h4>
							<address>Virtusa,Hyderabad.</address>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 col-lg-3 my-5">
					<div class="card border-0">
						<div class="card-body text-center">
							<i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
							<h4 class="text-uppercase mb-5">email</h4>
							<p>railways@virtusa.com</p>
						</div>
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
</body>
</html>