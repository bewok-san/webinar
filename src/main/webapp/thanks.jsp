<jsp:include page="header.jsp" />
<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-lg-8">
			<!-- Post content-->
			<article>
				<!-- Post header-->
				<header class="mb-4">
					<h1 class="fw-bolder mb-1">Thank you for registering!</h1>
				</header>
				<!-- Post content-->
				<section class="mb-2">Click below to join the event!</section>
				<div class="d-flex justify-content-center" id="link">
				</div>
			</article>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />
<script>
$( document ).ready(function() {
	const queryString = window.location.search;

	const urlParams = new URLSearchParams(queryString);

	const room = urlParams.get('room');

	firebase.database().ref('room').orderByChild("kode").equalTo(room).on('child_added', function(snapshot) {
	      	var id = snapshot.key;
	      	firebase.database().ref('room/'+id).on('value', function(snapshot) {
	      		var data = snapshot.val();
	      		var link = data.link;
	      		document.getElementById('link').innerHTML += '<a href="'+link+'" class="mb-5 btn btn-dark">Link</a>';
	      	});
	      	
	 });
});
</script>
</body>
</html>