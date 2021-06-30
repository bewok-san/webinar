<jsp:include page="header.jsp" />
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Room</h1>
		<a class="btn btn-dark text-light my-2" href="add_room.jsp">Add
			Data</a>

		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="form-floating mb-3">
						<input class="form-control" id="uid" type="text" placeholder="uid"
							readonly />
					</div>

					<div class="form-floating mb-3">
						<input class="form-control" id="kode" type="text"
							placeholder="Input Kode" /> <label for="kode">Kode</label>

					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input class="form-control" id="name" type="text"
									placeholder="Input Name" /> <label for="title">Name</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input class="form-control" id="link" type="text"
									placeholder="Input Link" /> <label for="date">Link</label>
							</div>
						</div>
					</div>
					<div class="d-flex align-items-center mt-4 mb-0">
						<a class="btn btn-primary" onclick="update_room();">Update</a> <a
							class="btn btn-danger" onclick="delete_room();">Delete</a>
					</div>
				</form>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Event
			</div>
			<div class="card-body">
				<table id="roomTable" class="table">
					<tr>
						<th>#ID</th>
						<th>Kode</th>
						<th>Name</th>
						<th>Link</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</main>
<jsp:include page="footer.jsp" />
<script>
		var tbRoom = document.getElementById('roomTable');
		var databaseRef = firebase.database().ref('room/');
		var rowIndex = 1;
		databaseRef
				.once(
						'value',
						function(snapshot) {
							snapshot
									.forEach(function(childSnapshot) {
										var childKey = childSnapshot.key;
										var childData = childSnapshot.val();
										var row = tbRoom.insertRow(rowIndex);
										var cellId = row.insertCell(0);
										var cellKode = row.insertCell(1);
										var cellName = row.insertCell(2);
										var cellLink = row.insertCell(3);
										cellId.appendChild(document
												.createTextNode(childKey));
										cellKode
										.appendChild(document
												.createTextNode(childData.kode));
										cellName
												.appendChild(document
														.createTextNode(childData.name));
										cellLink
												.appendChild(document
														.createTextNode(childData.link));
										rowIndex = rowIndex + 1;
									});
							var table = document.getElementById("roomTable");
							var rows = table.getElementsByTagName("tr");
							for (i = 0; i < rows.length; i++) {
								var currentRow = table.rows[i];
								var createClickHandler = function(row) {
									return function() {
										var cell1 = row
												.getElementsByTagName("td")[0];
										var cell2 = row
												.getElementsByTagName("td")[1];
										var cell3 = row
												.getElementsByTagName("td")[2];
										var cell4 = row
												.getElementsByTagName("td")[3];
										var id = cell1.innerHTML;
										var kode = cell2.innerHTML;
										var name = cell3.innerHTML;
										var link = cell4.innerHTML;
										document.getElementById('uid').value = id;
										document.getElementById('kode').value = kode;
										document.getElementById('name').value = name;
										document.getElementById('link').value = link;
									};
								};
								currentRow.onclick = createClickHandler(currentRow);
							}
						});
		function update_room() {
			var kode = document.getElementById('kode').value;
			var name = document.getElementById('name').value;
			var link = document.getElementById('link').value;
			var uid = document.getElementById('uid').value;
			var data = {
				kode : kode,
				name : name,
				link : link
			}
			var updates = {};
			updates['/room/' + uid] = data;
			firebase.database().ref().update(updates);
			alert('Room updated successfully!');
			reload_page();
		}
		function delete_room() {
			var uid = document.getElementById('uid').value;
			firebase.database().ref().child('/room/' + uid).remove();
			alert('Room deleted successfully!');
			reload_page();
		}
		function reload_page() {
			window.location.reload();
		}
	</script>
</body>
</html>
