<jsp:include page="header.jsp" />
<div class="container mt-5">
	<div class="row d-flex justify-content-center">
		<div class="col-lg-6">
			<article>
				<header class="mb-4">
					<!-- Post title-->
					<h1 class="fw-bolder d-flex justify-content-center">Registration
						form</h1>
				</header>
				<div class="row d-flex justify-content-center">
					<div class="col-lg"></div>
					<div class="col-lg-5" id="event"></div>
					<div class="col-lg"></div>
				</div>
				<form>
					<input type="hidden" id="room" />
					<input type="hidden" id="title" />
					<div class="form-floating mb-3">
						<input class="form-control" id="name" type="text"
							placeholder="Input Name" required /> <label for="name">Full
							Name</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="email" type="email"
							placeholder="Input Email" required /> <label for="name">Email</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="city" type="text"
							placeholder="Input City" required /> <label for="name">City</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="profession" type="text"
							placeholder="Input Profession" required /> <label for="name">Profession</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="institution" type="text"
							placeholder="Input Institution" required /> <label for="name">Institution</label>
					</div>
					<div class="d-flex justify-content-center mb-5">
						<a class="btn btn-dark" onclick="register_event();">Register</a>
					</div>
				</form>
			</article>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp" />
<script>
	$(document)
			.ready(
					function() {
						var databaseRef = firebase.database().ref('participant/');
						const queryString = window.location.search;

						const urlParams = new URLSearchParams(queryString);

						const id = urlParams.get('id');
						

						firebase
								.database()
								.ref('event/' + id)
								.on(
										'value',
										function(snapshot) {
											var childKey = snapshot.key;
											var data = snapshot.val();
											var title = data.title;
											document.getElementById("title").value = title;
											var date = data.date;
											var time = data.time;
											var url = data.url;
											var room = data.room;
											var description = data.description;
											document.getElementById('room').value = room;
											var div = document
													.getElementById('event');
											div.innerHTML += '<div class="col mb-5"><div class="card h-80"><img class="card-img-top img-fluid" src="'+url+'" style="height: 180px;" alt="..." ><div class="card-body p-4"><div class="text-center"><h5 class="fw-bolder">'
													+ title
													+ '</h5>'
													+ date
													+ ' at '
													+ time
													+ '</div></div></div></div>';
										});
						
					});
	function register_event() {
		var title = document.getElementById('title').value;
		var room = document.getElementById('room').value;
		var name = document.getElementById('name').value;
		var email = document.getElementById('email').value;
		var city = document.getElementById('city').value;
		var profession = document.getElementById('profession').value;
		var institution = document.getElementById('institution').value;
		var uid = firebase.database().ref().child('participant').push().key;
		var data = {
			name : name,
			email : email,
			city : city,
			profession : profession,
			institution : institution,
			event : title
		}
		var updates = {};
		updates['/participant/' + uid] = data;
		firebase.database().ref().update(updates);
		window.location.href = "thanks.jsp?room="+room;
	}
</script>
</body>
</html>