<jsp:include page="header.jsp" />
<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-lg-8">
			<!-- Post content-->
			<article>
				<!-- Post header-->
				<header class="mb-4">
					<!-- Post title-->
					<h1 class="fw-bolder mb-1" id="title"></h1>
					<!-- Post meta content-->
					<div class="text-muted fst-italic mb-2" id="dateTime"></div>
				</header>
				<!-- Preview image figure-->
				<figure class="mb-4 d-flex justify-content-center" id="image">
					
				</figure>
				<!-- Post content-->
				<section class="mb-5" id="description"></section>
				<div class="d-flex justify-content-center" id="register">
					
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

	const id = urlParams.get('id');

	firebase.database().ref('event/'+id).on('value', function(snapshot) {
	    	var childKey = snapshot.key;
	      	var data = snapshot.val();
	      	var title = data.title;
	      	var date = data.date;
	      	var time = data.time;
	      	var url = data.url;
	      	var description = data.description;
	      	document.getElementById("title").append(title);
	      	document.getElementById("dateTime").append(date+' at '+time);
	      	document.getElementById("image").innerHTML += '<img class="img-fluid rounded" src="'+url+'" id="image" alt="..." />';
	      	document.getElementById("description").innerHTML += description;
	      	document.getElementById("register").innerHTML += '<a href="register.jsp?id='+childKey+'" class="mb-5 btn btn-dark">Join Event!</a>';
	 });
});


</script>
</body>
</html>