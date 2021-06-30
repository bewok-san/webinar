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
<title>Login - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<!-- firebase -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-firestore.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-auth.js"></script>

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
</script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">

									<div class="form-floating mb-3">
										<input class="form-control" id="inputEmail" type="email"
											placeholder="name@example.com" /> <label for="inputEmail">Email
											address</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="inputPassword" type="password"
											placeholder="Password" /> <label for="inputPassword">Password</label>
									</div>
									<div
										class="d-flex align-items-center justify-content-between mt-4 mb-0">
										<a class="btn btn-primary" onclick="login();">Login</a>
									</div>

								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="register.jsp">Need an account? Sign up!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script>
        	function login() {
        		var email = document.getElementById("inputEmail").value;
        		var password = document.getElementById("inputPassword").value;
        		
        		firebase.auth().signInWithEmailAndPassword(email, password).then(function(){
        			window.location.href = "index.jsp";
        		}).catch(function(error) {
        			var errorMessage = error.message;
        			alert(errorMessage);
        		});
        	}
        </script>
</body>
</html>
