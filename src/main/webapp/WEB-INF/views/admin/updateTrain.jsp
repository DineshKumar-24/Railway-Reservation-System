<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type='text/javascript'
	src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#staticBackdrop').modal('show')

	});
</script>
<!-- CSS only -->
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<link rel="stylesheet" href="/css/admincss/admin.css" />
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

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Update Train</h5>
						<a onclick="javascript:window.location='/viewtrains'"
							class="close" data-dismiss="modal" aria-label="Close"> <span
							aria-hidden="true">&times;</span>
						</a>
					</div>
					<div class="modal-body">
						<form action="/updatetrain" style="padding: 20px;" method="post">
							<div class="row justify-content-md-center mt-2">
								<div class="col-12">
									<div class="form-group">
										<label for="formGroupExampleInput0">Train No</label> <input
											type="text" class="form-control" id="formGroupExampleInput0"
											name="trainNo" value="${updateTrainObj.getTrainNo()}"
											hidden=true />
									</div>
									<div class="form-group">
										<label for="formGroupExampleInput1">Train Name</label> <input
											type="text" class="form-control" id="formGroupExampleInput1"
											name="trainName" value="${updateTrainObj.getTrainName()}" />
									</div>
									<div class="row">
										<div class="col-4">
											<div class="form-group">
												<label for="formGroupExampleInput2">2S Seats</label> <input
													type="text" class="form-control"
													id="formGroupExampleInput2"
													value="${updateTrainObj.getSeat2S()}" name="seat2S" />
											</div>
										</div>
										<div class="col-4">
											<div class="form-group">
												<label for="formGroupExampleInput3">SL Seats</label> <input
													type="text" class="form-control"
													id="formGroupExampleInput3"
													value="${updateTrainObj.getSeatSL()}" name="seatSL" />
											</div>
										</div>
										<div class="col-4">
											<div class="form-group">
												<label for="formGroupExampleInput4">AC Seats</label> <input
													type="text" class="form-control"
													id="formGroupExampleInput4"
													value="${updateTrainObj.getSeatAC()}" name="seatAC" />
											</div>
										</div>
									</div>



								</div>
								</hr>
								<div class=""></div>
								<div class="col-12 mt-3">
									<!--Location part-->
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<label for="formGroupExampleInput5">From</label> <input
													type="text" class="form-control"
													id="formGroupExampleInput5"
													value="${updateTrainObj.getSource()}" name="source" />
											</div>

										</div>
										<div class="col-6">
											<div class="form-group">
												<label for="formGroupExampleInput6">To</label> <input
													type="text" class="form-control"
													id="formGroupExampleInput6"
													value="${updateTrainObj.getDestination()}"
													name="destination" />
											</div>

										</div>
									</div>
									<div class="row">
										<div class="col-6">
											<div class="form-group">
												<label for="formGroupExampleInput7">Arrival Time</label> <input
													type="time" class="form-control"
													id="formGroupExampleInput7"
													value="${updateTrainObj.getArrivalTime()}"
													name="arrivalTime" />
											</div>
										</div>
										<div class="col-6">
											<div class="form-group">
												<label for="formGroupExampleInput8">Depature Time</label> <input
													type="time" class="form-control"
													id="formGroupExampleInput8"
													value="${updateTrainObj.getDepatureTime()}"
													name="depatureTime" />
											</div>

										</div>
									</div>






									<div class="form-group">
										<label for="formGroupExampleInput3">Date</label> <input
											type="date" class="form-control" id="formGroupExampleInput3"
											value="${updateTrainObj.getDate()}" name="date" />
									</div>
								</div>
							</div>
							<div class="form-group text-center mt-2">
								<button type="submit" class="btn btn-success">Update
									Train</button>
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
</body>
</html>
