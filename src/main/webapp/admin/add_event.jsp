<jsp:include page="header.jsp" />
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Add Event</h1>
		<a class="btn btn-dark text-light my-2" href="event.jsp">Back</a>

		<div class="card mb-4">
			<div class="card-body">
				<form>
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
					<div class="row mb-3">
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<select class="form-control" id="room"><option>Select
										Room</option></select> <label for="room">Room</label>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-floating mb-3">
								<input type="file" accept="image/*" class="form-control" id="upload"> <label
									for="upload">Upload Image</label>
							</div>
						</div>
					</div>
					<div class="form-floating mb-3">
						<h6>Description</h6>
						<textarea class="form-control" id="description" type="text"
							placeholder="Input Description"></textarea>
					</div>
					<div
						class="d-flex align-items-center justify-content-between mt-4 mb-0">
						<a class="btn btn-primary" onclick="add_event();">Add</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</main>
<jsp:include page="footer.jsp" />
<script>
	
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

		var databaseRef = firebase.database().ref('event/');

		function add_event() {
			  //upload image to firebase
			  var storage = firebase.storage();
			  var file = document.getElementById("upload").files[0];
			  var storageref = storage.ref();
			  var thisref = storageref.child("img").child(file.name).put(file);
			  
			  thisref.on('state_changed',function(snapshot) {
			 
			  }, function(error) {
			  
			 }, function() {
			  // Uploaded completed successfully, now we can get the download URL
			  thisref.snapshot.ref.getDownloadURL().then(function(downloadURL) {
			    //getting url of image
			    saveData(downloadURL);
			   });
			  });

			function saveData(url){
			var title = document.getElementById('title').value;
			var date = document.getElementById('date').value;
			var time = document.getElementById('time').value;
			var room = document.getElementById('room').value;
			var description = document.getElementById('description').value;
			var uid = firebase.database().ref().child('event').push().key;
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
			alert('Event created successfully!');
			reload_page();
			}
		}
		function reload_page() {
			window.location.reload();
		}
		
		$(function() {
			$(".datepicker").datepicker({
				format: 'dd MM',
				autoclose: true,
				todayHighlight: true,
			});
		});

		$(function() {
			$('.timepicker').timepicker({
				showInputs: false,
				showMeridian: false
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
