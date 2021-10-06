<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<!-- CSS only -->
<link rel="stylesheet" href="/css/profile.css">
<link rel="stylesheet" href="/css/admincss/admin.css">
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
</style>
</head>
<body>
	<div class="container" style="padding: 0; position: relative;">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="#">Welcome
				${sessionScope.currentUser.getFirstName()}</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav ml-auto">

					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
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


		<!-- Toasts Messages -->
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
		<form action="/updateuser" onsubmit="return disableinputs()"
			id="colorred" method="post">
			<div class="row user_box">
				<div class="col-md-12 col-xs-12 mt-4 follow line  text-center">
					<h3 class="mt-2">Hi,${sessionScope.currentUser.getFirstName()}</h3>
				</div>
				<div class="col-md-6 col-xs-6  follow line text-center">

					<button type="button" class="btn btn-primary mt-3"
						onclick="enableinputs()">Edit</button>

				</div>
				<div class="col-md-6 col-xs-6 follow line text-center">

					<button class="btn btn-success mt-3">Save</button>

				</div>

				<div class="col-md-12 col-xs-12 user_control handle" id="formFields">

					<div class="control">
						<div class="label">
							FirstName <span><input type="text" name="firstName"
								value="${currentUser.getFirstName() }"></span>
						</div>
						<p class="text-white"></p>
					</div>

					<div class="control">
						<div class="label">
							LastName <span><input type="text" name="lastName"
								value="${currentUser.getLastName()}"></span>
						</div>

					</div>
					<div class="control">
						<div class="label">
							Email Address <span><input type="text"
								data-toggle="tooltip" data-placement="right"
								title="Restricted to edit" name="email"
								value="${currentUser.getEmail() }" readonly></span>
						</div>
						<p class="text-white"></p>
					</div>
					<input type="text" name="password" hidden=true
						value="${currentUser.getPassword() }">
					<div class="control">
						<div class="label">
							Mobile Number <span><input type="text" name="mobileNumber"
								value="${currentUser.getMobileNumber() }"></span>
						</div>
						<p class="text-white"></p>
					</div>


				</div>
			</div>


		</form>
	</div>
	<script>
		function enableinputs() {
			console.log("hi printing");
			document.getElementById("formFields").classList.remove("handle");
		}
		function disableinputs() {
			document.getElementById("formFields").classList.remove("handle");
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>
</html>