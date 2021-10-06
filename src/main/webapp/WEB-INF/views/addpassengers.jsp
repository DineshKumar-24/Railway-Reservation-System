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
<link rel="stylesheet" href="/css/booking.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
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
		<div class="row" style="margin: 10px; padding: 10px;">
			<!--Passenger Form-->
			<c:if test="${not empty errMsg}">
				<div class="alert alert-danger text-center" role="alert">${errMsg}</div>
			</c:if>
			<div class="col-sm-4 col-12">
				<div
					class="
              d-flex
              flex-row
              justify-content-center
              align-items-center
              mt-5
            ">
					<form class="col-12"
						action="/book/${selectedTrain.getTrainNo()}/addpassenger"
						method="post">
						<div class="form-group">
							<label for="disabledTextInput">Boarding Point</label> <input
								type="text" class="form-control" id="disabledTextInput" disabled
								value="${selectedTrain.getSource()}-${selectedTrain.getDestination()}" />
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput1">Passenger Name</label> <input
								type="text" class="form-control" id="formGroupExampleInput1"
								placeholder="Full Name" name="fullName" />
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput2">Seat</label> <select
								class="custom-select custom-select-md"
								id="formGroupExampleInput2" name="seatPreference">
								<option selected>Select Seating</option>
								<option value="2S">2S - Rs.150</option>
								<option value="SL">SL - Rs.380</option>
								<option value="AC">AC - Rs.600</option>
							</select>
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput3">Age</label> <input
								type="text" class="form-control" id="formGroupExampleInput3"
								placeholder="Enter your age" name="age" />
						</div>
						<div class="form-group">
							<label for="formGroupExampleInput4">Gender</label> <select
								class="custom-select custom-select-md"
								id="formGroupExampleInput4" name="gender">
								<option selected>Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Others">Others</option>
							</select>
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info">Add Passenger
							</button>
						</div>
					</form>
				</div>
			</div>
			<!--List Of Passengers-->

			<div class="col-sm-8  col-12 p-2">
				<div id="PassengerDiv">
					<!--Card Start-->

					<c:forEach items="${sessionScope.listOfPassenger}" var="passenger"
						varStatus="loop">
						<div class="card mt-2">
							<div class="card-body">
								<div class="d-flex flex-row bd-highlight justify-content-around">
									<div class="p-2 bd-highlight">${loop.index+1}</div>
									<div class="p-2 bd-highlight">${passenger.getFullName()}</div>
									<c:if test="${passenger.getAge()<=12}">
										<div class="p-2 bd-highlight">Child</div>
									</c:if>
									<c:if test="${passenger.getAge()>12}">
										<div class="p-2 bd-highlight">Adult</div>
									</c:if>
									<div class="p-2 bd-highlight">${passenger.getSeatPreference()}</div>
									<div class="p-2 bd-highlight">Age-${passenger.getAge()}</div>
									<c:choose>

										<c:when test="${passenger.getSeatPreference() eq '2S'}">
											<div class="p-2 bd-highlight text-success font-weight-bold">Rs.150</div>
										</c:when>

										<c:when test="${passenger.getSeatPreference() eq 'SL'}">
											<div class="p-2 bd-highlight text-success font-weight-bold">Rs.380</div>
										</c:when>

										<c:otherwise>
											<div class="p-2 bd-highlight text-success font-weight-bold">Rs.600</div>
										</c:otherwise>
									</c:choose>

									<div class="p-2 bd-highlight">
										<a
											href="/book/${selectedTrain.getTrainNo()}/removepassenger/${loop.index}"><em
											class="bi bi-trash text-danger"></em></a>
									</div>
								</div>
							</div>
						</div>



					</c:forEach>
					<c:if test="${listOfPassenger.size()>0 }">
						<div style="position: relative;">
							<a class="btn mt-3 btn-success"
								style="position: absolute; right: 0;" href="">Total:
								${sessionScope.totalAmount}</a>
						</div>
						<!--Card end-->


						<div class="text-center">
							<a class="btn mt-3 btn-success"
								href="/book/${selectedTrain.getTrainNo()}/payment">Procced
								To Payment</a>
						</div>
					</c:if>
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
