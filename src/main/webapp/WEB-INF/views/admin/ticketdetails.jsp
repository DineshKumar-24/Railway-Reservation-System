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
<script>
	function tabchange1() {

		document.getElementById("nav-ticket-tab").classList.remove("bg-dark",
				"text-light");
		document.getElementById("nav-passenger-tab").classList.add("bg-dark",
				"text-light");
	}
	function tabchange0() {
		document.getElementById("nav-passenger-tab").classList.remove(
				"bg-dark", "text-light");
		document.getElementById("nav-ticket-tab").classList.add("bg-dark",
				"text-light");
	}
</script>
<style>
body {
	font-family: 'Poppins';
}
</style>
</head>
<body>
	<div class="container" style="padding: 0;">
		<!--NAVBAR-->
		<nav class="navbar navbar-expand-lg navbar-light" role="navigation" aria-label="Main">
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
		<div class="row justify-content-center">
			<div class="col-md-8 mt-3">

				<form class="" action="/getfulldetails" method="get">
					<div class="form-row  justify-content-center">
						<div class="col-sm-5 my-1">
							<label class="sr-only" for="inlineFormInputGroupUsername">TrainName</label>
							<div class="input-group">
								<input type="text" class="form-control"
									id="inlineFormInputGroupUsername" placeholder="TrainName"
									name="trainName">
							</div>
						</div>
						<div class="col-sm-3 my-1 text-center">
							<button type="submit" class="btn btn-primary">Search</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-10 mt-3">
				<c:if test="${not empty noTrainFound}">
					<div class="alert alert-danger text-center" role="alert">${noTrainFound}</div>
				</c:if>

				<nav aria-label="navigation">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-link bg-dark" onclick="tabchange0()"
							id="nav-ticket-tab" data-toggle="tab" href="#nav-ticket"
							role="tab" aria-controls="nav-ticket" aria-selected="true">Total
							Tickets</a> <a class="nav-link" id="nav-passenger-tab"
							data-toggle="tab" onclick="tabchange1()" href="#nav-passenger"
							role="tab" aria-controls="nav-passenger" aria-selected="false">Total
							Passengers</a>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<!-- TICKET DETAILS -->

					<div class="tab-pane fade show active" id="nav-ticket"
						role="tabpanel" aria-labelledby="nav-ticket-tab">
						<div class="table-responsive mt-2">
							<div class="table-wrapper">
								<table class="table table-striped table-hover text-center" aria-describedby="tickets">
									<thead class="">
										<tr>
											<th scope="row">TicketId</th>
											<th scope="row">Email</th>
											<th scope="row">NoOfTickets</th>
											<th scope="row">Amount</th>

										</tr>
									</thead>

									<tbody class="">
										<c:forEach var="ticket" items="${ticketDetails}">
											<tr>
												<td>${ticket.getTicketID()}</td>
												<td>${ticket.getUserId().getEmail()}</td>
												<td>${ticket.getNoOfTickets()}</td>
												<td>${ticket.getAmountPaid()}</td>
												<td><a href="/cancelticket/${ticket.getTicketID()}"><em
														class="bi text-danger bi-trash"></em></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="tab-pane fade show" id="nav-passenger" role="tabpanel"
						aria-labelledby="nav-passenger-tab">

						<div class="tab-pane fade show active" id="nav-passenger"
							role="tabpanel" aria-labelledby="nav-passenger-tab">
							<div class="table-responsive mt-2">
								<div class="table-wrapper">
									<table class="table table-striped table-hover text-center" aria-describedby="passengers">
										<thead class="">
											<tr>

												<th scope="row">Passenger Name</th>
												<th scope="row">SeatPreference</th>
												<th scope="row">Age</th>
												<th scope="row">TicketID</th>

											</tr>
										</thead>

										<tbody class="">
											<c:forEach var="ticket" items="${ticketDetails}">
												<c:forEach var="passenger"
													items="${ticket.getListOfPassenger()}">
													<tr>
														<td>${passenger.getFullName() }</td>
														<td>${passenger.getSeatPreference() }</td>
														<td>${passenger.getAge() }</td>
														<td>${passenger.getTicketId().getTicketID()}</td>
													</tr>
												</c:forEach>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
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
