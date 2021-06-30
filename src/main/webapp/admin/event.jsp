<jsp:include page="header.jsp" />
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Event</h1>
		<a class="btn btn-dark text-light my-2" href="add_event.jsp">Add
			Data</a>

		<div class="card mb-4">
			<div class="card-body">
				<form>
					<div class="form-floating mb-3">
						<input class="form-control" id="uid" type="text" placeholder="uid"
							readonly />
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<img id="webinarImg" class="img-fluid">
						</div>
						<div class="col-md-6">
							<input type="hidden" id="imgUrl" readonly>
							<div class="form-floating mb-3">
								<input type="file" accept="image/*" class="form-control" id="upload"> <label
									for="upload">Upload Image</label>
							</div>
							<a class="btn btn-primary" onclick="changeImg();">Change
								Image</a>
						</div>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="title" type="text"
							placeholder="Input Title" /> <label for="description">Title</label>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input class="form-control datepicker" id="date" type="text"
									placeholder="Input Date" /> <label for="title">Date</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input class="form-control timepicker" id="time" type="text"
									placeholder="Input Time" /> <label for="date">Time</label>
							</div>
						</div>
					</div>
					<div class="form-floating mb-3">
						<select class="form-control" id="room"><option>Select
								Room</option></select> <label for="room">Room</label>
					</div>
					<div class="form-floating mb-3">
						<h6>Description</h6>
						<textarea class="form-control" id="description" type="text"
							placeholder="Input Description"></textarea>
					</div>
					<div class="d-flex align-items-center mt-4 mb-0">
						<a class="btn btn-primary" onclick="update_event();">Update</a> <a
							class="btn btn-danger" onclick="delete_event();">Delete</a>
					</div>
				</form>
			</div>
		</div>

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Event
			</div>
			<div class="card-body">
				<table id="eventTable" class="table">
					<tr>
						<th>#ID</th>
						<th>Title</th>
						<th>Date</th>
						<th>Time</th>
						<th>Room</th>
						<th>Description</th>
						<th>Image URL</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</main>
<jsp:include page="footer.jsp" />
<script>
		function changeImg(){
			var storage = firebase.storage();
			var file = document.getElementById("upload").files[0];
			var storageref = storage.ref();
			var thisref = storageref.child("img").child(file.name).put(file);
			
			var oldUrl = document.getElementById("imgUrl").value;
			var oldImage = storage.refFromURL(oldUrl);
			oldImage.delete().then(function () {
				  
			    // File deleted successfully
			    console.log("File Deleted");
			}).catch(function (error) {
			    // Some Error occurred
			});
			  
			thisref.on('state_changed',function(snapshot) {
			 
			}, function(error) {
				
			}, function() {
			  // Uploaded completed successfully, now we can get the download URL
			  thisref.snapshot.ref.getDownloadURL().then(function(downloadURL) {
			    //getting url of image
			    alert("Image changed!");
			    document.getElementById("imgUrl").value = downloadURL;
			    document.getElementById("webinarImg").src = downloadURL;
				document.getElementById("webinarImg").style.height = '210px';
			   });
			});
		}
		
		
		var databaseRefRoom = firebase.database().ref('room/');
		var rowIndexRoom = 1;
		databaseRefRoom.once('value', function(snapshot) {
			snapshot.forEach(function(childSnapshot) {
				var childKey = childSnapshot.key;
				var childData = childSnapshot.val();
				var x = document.getElementById("room");
				var option = document.createElement("option");
				option.text = childData.kode + ' - ' + childData.name;
				option.value = childData.kode;
				x.add(option);

				rowIndexRoom = rowIndexRoom + 1;
			});
		});

		var tbEvent = document.getElementById('eventTable');
		var databaseRef = firebase.database().ref('event/');
		var rowIndex = 1;
		databaseRef.once('value', function(snapshot) {
			snapshot
					.forEach(function(childSnapshot) {
						var childKey = childSnapshot.key;
						var childData = childSnapshot.val();
						var row = tbEvent.insertRow(rowIndex);
						var cellId = row.insertCell(0);
						var cellTitle = row.insertCell(1);
						var cellDate = row.insertCell(2);
						var cellTime = row.insertCell(3);
						var cellRoom = row.insertCell(4);
						var cellDescription = row.insertCell(5);
						var cellURL = row.insertCell(6);
						cellId.appendChild(document.createTextNode(childKey));
						cellTitle.appendChild(document
								.createTextNode(childData.title));
						cellDate.appendChild(document
								.createTextNode(childData.date));
						cellTime.appendChild(document
								.createTextNode(childData.time));
						cellRoom.appendChild(document
								.createTextNode(childData.room));
						cellDescription.appendChild(document
								.createTextNode(childData.description));
						cellURL.appendChild(document
								.createTextNode(childData.url));
						rowIndex = rowIndex + 1;
					});
			var table = document.getElementById("eventTable");
			var rows = table.getElementsByTagName("tr");
			for (i = 0; i < rows.length; i++) {
				var currentRow = table.rows[i];
				var createClickHandler = function(row) {
					return function() {
						var cell1 = row.getElementsByTagName("td")[0];
						var cell2 = row.getElementsByTagName("td")[1];
						var cell3 = row.getElementsByTagName("td")[2];
						var cell4 = row.getElementsByTagName("td")[3];
						var cell5 = row.getElementsByTagName("td")[4];
						var cell6 = row.getElementsByTagName("td")[5];
						var cell7 = row.getElementsByTagName("td")[6];
						var id = cell1.innerHTML;
						var title = cell2.innerHTML;
						var date = cell3.innerHTML;
						var time = cell4.innerHTML;
						var room = cell5.innerHTML;
						var description = cell6.innerHTML;
						var url = cell7.innerHTML;
						document.getElementById('uid').value = id;
						document.getElementById('title').value = title;
						document.getElementById('date').value = date;
						document.getElementById('time').value = time;
						document.getElementById('room').value = room;
						document.getElementById('imgUrl').value = url;
						document.getElementById("webinarImg").src = url;
						document.getElementById("webinarImg").style.height = '210px';
						$("#description").summernote('reset');
						var description2 = description.replace(/&lt;/g, '<')
								.replace(/&gt;/g, '>')
						$("#description").summernote('code', description2);
					};
				};
				currentRow.onclick = createClickHandler(currentRow);
			}
		});

		function update_event() {
			var title = document.getElementById('title').value;
			var date = document.getElementById('date').value;
			var time = document.getElementById('time').value;
			var room = document.getElementById('room').value;
			var description = document.getElementById('description').value;
			var url = document.getElementById('imgUrl').value;
			var uid = document.getElementById('uid').value;
			var data = {
				title : title,
				date : date,
				time : time,
				room : room,
				description : description,
				url : url
			}
			var updates = {};
			updates['/event/' + uid] = data;
			firebase.database().ref().update(updates);
			alert('Event updated successfully!');
			reload_page();
		}

		function delete_event() {
			var storage = firebase.storage();
			var oldUrl = document.getElementById("imgUrl").value;
			var oldImage = storage.refFromURL(oldUrl);
			oldImage.delete().then(function () {
				  
			    // File deleted successfully
			    console.log("File Deleted");
			    var uid = document.getElementById('uid').value;
				firebase.database().ref().child('/event/' + uid).remove();
				alert('Event deleted successfully!');
				reload_page();
			}).catch(function (error) {
			    // Some Error occurred
			});
			
			
		}
		function reload_page() {
			window.location.reload();
		}
		
		$(function() {
			$(".datepicker").datepicker({
				format : 'dd MM',
				autoclose : true,
				todayHighlight : true,
			});
		});

		$(function() {
			$('.timepicker').timepicker({
				showInputs : false,
				showMeridian : false
			});
		});

		$('#description').summernote({
	        placeholder: 'Input Description',
	        tabsize: 2,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']]
	        ]
	      });
	</script>
</body>
</html>
