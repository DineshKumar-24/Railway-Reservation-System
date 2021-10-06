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
<link rel="stylesheet" href="/css/ticketcard.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<title>Document</title>
<style>
body {
	font-family: 'Poppins';
}
</style>

</head>
<body>
	<div class="container" style="padding: 0;">

		<!--NAVBAR-->

		<nav class="navbar w-100 navbar-expand-lg navbar-light"
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


		<!-- Ticket Card Components-->
		<div class="row justify-content-center" style="margin: 5px;">




			<c:forEach items="${ listOfTickets}" var="ticket" varStatus="loop">

				<div class=" card col-12 col-md-7 mt-2">
					<h6 class="card-title mt-2">
						${ticket.getTrainId().getSource()}-
						${ticket.getTrainId().getDestination()}<span class="float-right">${ticket.getTrainId().getTrainNo()}</span>
					</h6>

					<div
						class="d-flex flex-row text-center bd-highlight justify-content-around">
						<div class="p-2 bd-highlight">
							<p>Date</p>
							<p>${ticket.getTrainId().getDate()}</p>


						</div>
						<div class="p-2 bd-highlight">
							<p>No.Of.Tickets</p>
							<p>${ticket.getNoOfTickets()}</p>


						</div>
						<div class="p-2 bd-highlight">
							<p>Departure time</p>
							<p>${ticket.getTrainId().getDepatureTime()}</p>


						</div>
						<div class="p-2 bd-highlight">
							<p>Amount</p>
							<p>
								${ticket.getAmountPaid()} <em class="bi text-success bi-check-lg"></em>
							</p>

						</div>
						<div class="p-1  bd-highlight align-self-center">
							<a type="button" data-toggle="modal"
								data-target="#staticBackdrop${loop.index}"
								style="font-size: 20px;" class="btn text-danger"><em
								class="bi bi-x-circle-fill"></em> </a>



						</div>
					</div>
					<a data-toggle="collapse" href="#collapseExample${loop.index}"
						role="button" aria-expanded="false"
						aria-controls="collapseExample"> view passengers </a>

					<div class="collapse" id="collapseExample${loop.index}">
						<div class="table-responsive">
							<div class="table-wrapper">
								<table class="table table-striped table-hover" aria-describedby="passengers">
									<thead>
										<tr>
											<th scope="row">Full Name</th>
											<th scope="row">Seat Preference</th>
											<th scope="row">Age</th>

										</tr>
									</thead>
									<c:forEach items="${ticket.getListOfPassenger()}"
										var="passenger">
										<tr>
											<td>${passenger.getFullName()}</td>
											<td>${passenger.getSeatPreference()}</td>
											<td>${passenger.getAge()}</td>
										</tr>

									</c:forEach>
								</table>
							</div>
						</div>

					</div>
				</div>
				<!--Confirmation Modal -->
				<div class="modal  fade" id="staticBackdrop${loop.index}"
					data-backdrop="static" data-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">Ticket
									Canceling Confirmation</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">Are you sure want to cancel the
								ticket?</div>
							<div class="modal-footer">
								<a type="button" href="/cancelticket/${ticket.getTicketID()}"
									class="btn text-white bg-danger">Yes</a>
								<button type="button" class="btn btn-info" data-dismiss="modal">No</button>

							</div>
						</div>
					</div>
				</div>
			</c:forEach>
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