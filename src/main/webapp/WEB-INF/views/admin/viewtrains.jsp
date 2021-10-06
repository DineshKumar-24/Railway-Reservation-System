<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<title>Document</title>
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('.toast').toast("show");

	});
</script>
</head>
<style>
body {
	font-family: 'Poppins';
}
</style>
<body>
	<div class="container" style="padding: 0; position: relative;">

		<!--NAVBAR-->
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
		<!--View Train -->

		<div class="table-responsive mt-5">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row text-center justify-content-center">
						<div class="col-sm-5 ">
							<h5>
								<strong>view available trains</strong>
							</h5>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover" aria-describedby="trains">
					<thead class="">
						<tr>
							<th scope="row">Train No</th>
							<th scope="row">Train Name</th>
							<th scope="row">2S seats</th>
							<th scope="row">SL seats</th>
							<th scope="row">AC seats</th>
							<th scope="row">From</th>
							<th scope="row">To</th>
							<th scope="row">Arrival Time</th>
							<th scope="row">Depature Time</th>
							<th scope="row">Date</th>
							<th scope="row">Actions</th>
						</tr>
					</thead>

					<tbody>

						<c:if test="${listOfTrains.size() <= 0}">
							<p class="text-danger text-center">Trains not found</p>
						</c:if>

						<c:forEach var="train" items="${listOfTrains}">
							<tr>
								<td>${train.getTrainNo()}</td>
								<td><a
									href="/getfulldetails?trainName=${train.getTrainName()}">${train.getTrainName()}</a></td>
								<td>${train.getSeat2S()}</td>
								<td>${train.getSeatSL()}</td>
								<td>${train.getSeatAC() }</td>
								<td>${train.getSource() }</td>
								<td>${train.getDestination()}</td>
								<td>${train.getArrivalTime() }</td>
								<td>${train.getDepatureTime() }</td>
								<td>${train.getDate() }</td>
								<td><a href="/updateTrainModal/${train.getTrainNo()}"><em
										class="bi text-info bi-pencil-square"></em></a> &nbsp <a
									href="/deletetrain/${train.getTrainNo()}"><em
										class="bi text-danger bi-trash"></em></a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
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
