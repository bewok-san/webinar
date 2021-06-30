<jsp:include page="header.jsp" />
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Participant</h1>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Event
			</div>
			<div class="card-body">
				<table id="pTable" class="table">
					<tr>
						<th>#ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>City</th>
						<th>Profession</th>
						<th>Institution</th>
						<th>Event</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</main>
<jsp:include page="footer.jsp" />
<script>
	var pTable = document.getElementById('pTable');
	var databaseRef = firebase.database().ref('participant/');
	var rowIndex = 1;
	databaseRef.once('value', function(snapshot) {
		snapshot.forEach(function(childSnapshot) {
			var childKey = childSnapshot.key;
			var childData = childSnapshot.val();
			var row = pTable.insertRow(rowIndex);
			var cellId = row.insertCell(0);
			var cellName = row.insertCell(1);
			var cellEmail = row.insertCell(2);
			var cellCity = row.insertCell(3);
			var cellProfession = row.insertCell(4);
			var cellInstitution = row.insertCell(5);
			var cellEvent = row.insertCell(6);
			cellId.appendChild(document.createTextNode(childKey));
			cellName.appendChild(document.createTextNode(childData.name));
			cellEmail.appendChild(document.createTextNode(childData.email));
			cellCity.appendChild(document.createTextNode(childData.city));
			cellProfession.appendChild(document.createTextNode(childData.profession));
			cellInstitution.appendChild(document.createTextNode(childData.institution));
			cellEvent.appendChild(document.createTextNode(childData.event));
			rowIndex = rowIndex + 1;
		});
	});
</script>
</body>
</html>
