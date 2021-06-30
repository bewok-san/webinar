<jsp:include page="header.jsp" />
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Add Room</h1>
		<a class="btn btn-dark text-light my-2" href="room.jsp">Back</a>

		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="form-floating mb-3">
						<input class="form-control" id="kode" type="text"
							placeholder="Input Kode" /> <label for="kode">Kode</label>
					</div>

					<div class="row mb-3">
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input class="form-control" id="name" type="text"
									placeholder="Input Title" /> <label for="title">Name</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input class="form-control" id="link" type="text"
									placeholder="Input Date" /> <label for="date">Link</label>
							</div>
						</div>
					</div>
					<div
						class="d-flex align-items-center justify-content-between mt-4 mb-0">
						<a class="btn btn-primary" onclick="add_room();">Add</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</main>
<jsp:include page="footer.jsp" />
<script>
		var databaseRef = firebase.database().ref('room/');

		function add_room() {
			var kode = document.getElementById('kode').value;
			var name = document.getElementById('name').value;
			var link = document.getElementById('link').value;
			var uid = firebase.database().ref().child('event').push().key;
			var data = {
				kode : kode,
				name : name,
				link : link
			}
			var updates = {};
			updates['/room/' + uid] = data;
			firebase.database().ref().update(updates);
			alert('Room created successfully!');
			reload_page();
		}
		function reload_page() {
			window.location.reload();
		}
	</script>
</body>
</html>
