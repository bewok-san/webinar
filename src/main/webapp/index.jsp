<jsp:include page="header.jsp" />
<!-- Header-->
<header class="bg-dark py-2">
	<div class="container px-4 px-lg-5 my-5">
		<div class="text-center text-white">
			<h1 class="display-4 fw-bolder">Event List</h1>
		</div>
	</div>
</header>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="eventList">
			
		</div>
</section>
<jsp:include page="footer.jsp" />
<script>
		var databaseRef = firebase.database().ref('event/');
		databaseRef.once('value', function(snapshot) {
			snapshot
					.forEach(function(childSnapshot) {
						var childKey = childSnapshot.key;
						var childData = childSnapshot.val();
						var id = childKey;
						var title = childData.title;
						var date = childData.date;
						var time = childData.time;
						var description = childData.description;
						var url = childData.url;
						var div = document.getElementById('eventList');
						div.innerHTML += '<div class="col mb-5"><div class="card h-100"><img class="card-img-top img-fluid" src="'+url+'" style="height: 180px;" alt="..." ><div class="card-body p-4"><div class="text-center"><h5 class="fw-bolder">'+title+'</h5>'+date+' at '+time+'</div></div><div class="card-footer p-4 pt-0 border-top-0 bg-transparent"><div class="text-center"><a class="btn btn-outline-dark mt-auto" href="event.jsp?id='+id+'">More Detail</a></div></div></div></div>';
					});
		});
	</script>
</body>
</html>
