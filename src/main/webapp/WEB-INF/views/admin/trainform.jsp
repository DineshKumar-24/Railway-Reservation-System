<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<!-- CSS only -->
<link rel="stylesheet" href="/css/admincss/admin.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
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
	<div class="container" style="padding: 0; position: relative;">

		<!--NAVBAR-->
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="#"> Welcome
				${sessionScope.currentUser.getFirstName()}</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav ml-auto">


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Train Manager </a>
						<div class="dropdown-menu" id="drop-down"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/trainform">Add Trains</a> <a
								class="dropdown-item" href="/viewtrains">View Trains</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> User Manager </a>
						<div class="dropdown-menu" id="drop-down1"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/viewusers">View User</a>
						</div></li>
					<li class="nav-item active"><a class="nav-link"
						href="/ticketdetails">Ticket Details<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Profile </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/visitprofile">${sessionScope.currentUser.getFirstName()}</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/logoutSuccess">Logout</a>
						</div></li>
				</ul>
			</div>
		</nav>
		<c:if test="${not empty successfulmsg}">
			<div class="toast bg-success"
				style="position: absolute; top: 0; right: 0;" data-delay="2000">
				<div class="toast-body text-white">
					${successfulmsg}<span><button type="button"
							class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button></span>
				</div>
			</div>
		</c:if>
		<!--Add Train component-->
		<form action="/addtrain" style="padding: 20px;" method="post">
			<div class="row justify-content-md-center mt-5">
				<div class="col-12">
					<c:if test="${not empty errMsg}">
						<div class="alert alert-danger text-center" role="alert">${errMsg}</div>
					</c:if>
				</div>
				<div class="col-12 col-sm-4">
					<div class="form-group">
						<label for="formGroupExampleInput0">Train No</label> <input
							type="text" class="form-control" id="formGroupExampleInput0"
							placeholder="Train No" name="trainNo" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput1">Train Name</label> <input
							type="text" class="form-control" id="formGroupExampleInput1"
							placeholder="Train Name" name="trainName" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">2S Seats</label> <input
							type="text" class="form-control" id="formGroupExampleInput2"
							placeholder="Enter seats available" name="seat2S" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput3">SL Seats</label> <input
							type="text" class="form-control" id="formGroupExampleInput3"
							placeholder="Enter seats available" name="seatSL" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput4">AC Seats</label> <input
							type="text" class="form-control" id="formGroupExampleInput4"
							placeholder="Enter seats available" name="seatAC" />
					</div>
				</div>

				<div class="col-12 col-sm-4">
					<!--Location part-->

					<div class="form-group">
						<label for="formGroupExampleInput5">From</label> <input
							type="text" class="form-control" id="formGroupExampleInput5"
							placeholder="search source" name="source" />
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput6">To</label> <input type="text"
							class="form-control" id="formGroupExampleInput6"
							placeholder="search destination" name="destination" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput7">Arrival Time</label> <input
							type="time" class="form-control" id="formGroupExampleInput7"
							placeholder="Arrival Time" name="arrivalTime" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput8">Depature Time</label> <input
							type="time" class="form-control" id="formGroupExampleInput8"
							placeholder="Depature Time" name="depatureTime" />
					</div>

					<div class="form-group">
						<label for="formGroupExampleInput3">Date</label> <input
							type="date" class="form-control" id="formGroupExampleInput3"
							placeholder="journey date" name="date" />
					</div>
				</div>
			</div>
			<div class="form-group text-center mt-2">
				<button type="submit" class="btn btn-success">Add Train</button>
			</div>
		</form>
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
