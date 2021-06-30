<jsp:include page="header.jsp" />
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Dashboard</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">Dashboard</li>
		</ol>
		<div class="row">
			<div class="col-xl-3 col-md-6">
				<div class="card bg-dark text-white mb-4">
					<div class="card-body">
						Total Event
						<div class="text-center">
							<h2 class="fw-bolder" id="eventTotal"></h2>
						</div>
					</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="event.jsp">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-primary text-white mb-4">
					<div class="card-body">
						Total Participant
						<div class="text-center">
							<h2 class="fw-bolder" id="participantTotal"></h2>
						</div>
					</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="participant.jsp">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6">
				<div class="card bg-success text-white mb-4">
					<div class="card-body">
						Total Room
						<div class="text-center">
							<h2 class="fw-bolder" id="roomTotal"></h2>
						</div>
					</div>
					<div
						class="card-footer d-flex align-items-center justify-content-between">
						<a class="small text-white stretched-link" href="room.jsp">View
							Details</a>
						<div class="small text-white">
							<i class="fas fa-angle-right"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<jsp:include page="footer.jsp" />
<script>
	var refE = firebase.database().ref("event");
	refE.once("value").then(function(snapshot) {
		document.getElementById("eventTotal").append(snapshot.numChildren());
	});
	var refP = firebase.database().ref("participant");
	refP.once("value").then(
			function(snapshot) {
				document.getElementById("participantTotal").append(
						snapshot.numChildren());
			});
	var refR = firebase.database().ref("room");
	refR.once("value").then(function(snapshot) {
		document.getElementById("roomTotal").append(snapshot.numChildren());
	});
</script>
</body>
</html>