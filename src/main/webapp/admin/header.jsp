<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Euforia Event Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css"
	integrity="sha512-E4kKreeYBpruCG4YNe4A/jIj3ZoPdpWhWgj9qwrr19ui84pU5gvNafQZKyghqpFIHHE4ELK7L9bqAv7wfIXULQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- firebase -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-firestore.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-storage.js"></script>	

<script>
	var firebaseConfig = {
		apiKey : "AIzaSyAMG3sUx6lyGEuyoHr9TcZ06zvcf3bQsxo",
		authDomain : "aryagp-e7e83.firebaseapp.com",
		databaseURL : "https://aryagp-e7e83-default-rtdb.asia-southeast1.firebasedatabase.app",
		projectId : "aryagp-e7e83",
		storageBucket : "aryagp-e7e83.appspot.com",
		messagingSenderId : "490831883822",
		appId : "1:490831883822:web:3bb1c3650792c97b0439bf",
		measurementId : "G-DNQBRLTEWJ"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
	firebase.analytics();
	const auth = firebase.auth();
	const user = firebase.auth().currentUser;
	
	firebase.auth().onAuthStateChanged(user => {
		  if (user) {
		   
		  }
		  else {
			  alert("Logged out!");
			  window.location.href = "login.jsp";
		  }
		});
</script>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Euforia Event Admin</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" onclick="logout();">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Event</div>
						<a class="nav-link" href="event.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> List Event
						</a>
						<div class="sb-sidenav-menu-heading">Room</div>
						<a class="nav-link" href="room.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Room
						</a>
						<div class="sb-sidenav-menu-heading">Participant</div>
						<a class="nav-link" href="participant.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Participant
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Admin
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">