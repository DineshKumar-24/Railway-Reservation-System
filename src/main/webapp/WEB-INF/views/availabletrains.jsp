<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href='https://fonts.googleapis.com/css?family=Poppins'
	rel='stylesheet'>
<!-- CSS only -->
<link rel="stylesheet" href="/css/traincard.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous" />
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

		<nav class="navbar w-100 navbar-expand-lg  navbar-light"
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

		<!--Train Card Component-->
		<!--CARD1-->

		<div class="d-flex flex-column  align-items-center mt-3">
			<c:forEach var="train" items="${listOfAvailTrains}">
				<div class="card mb-3"  id="traincard">
					<div class="card-header text-dark">
						<span>${train.getSource()} - ${train.getDestination()}</span> <span
							class="float-right">Depature Time:
							${train.getDepatureTime()}</span>
					</div>
					<div class="card-body text-white">
						<div class="row">
							<div class="col-sm-4 col-4 bg-danger text-center">
								<h6 class="mt-1 text-center card-title">${train.getTrainName()}</h6>
								<h6>${train.getTrainNo()}</h6>
							</div>
							<div class="col-sm-4 col-4 bg-info  table-responsive">
								<table class="mt-1" aria-describedby="available">
									<thead>
										<tr>

											<th scope="row">2S</th>
											<th scope="row">SL</th>
											<th scope="row">AC</th>
										</tr>
									</thead>
									<tbody>
										<tr>

											<td>${train.getSeat2S()}</td>
											<td>${train.getSeatSL()}</td>
											<td>${train.getSeatAC()}</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div
								class="col-sm-4 col-4 bg-success d-flex  align-items-center justify-content-center">


								<fmt:formatDate var="currentDate" pattern="yyyy-MM-dd"
									value="<%=new java.util.Date()%>" />




								<c:choose>
									<c:when
										test="${train.getSeat2S() eq 0 and (train.getSeatSL() eq 0) and (train.getSeatAC() eq 0)}">
										<a class="btn text-white" href="#">Not Available</a>
									</c:when>

									<c:otherwise>
										<a class="btn text-white" href="/book/${train.getTrainNo()}/">Book
											Now</a>
									</c:otherwise>
								</c:choose>


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
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>
</body>
</html>
