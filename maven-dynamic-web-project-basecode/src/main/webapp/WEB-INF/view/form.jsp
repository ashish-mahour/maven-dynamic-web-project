<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<form id="form1">
		<input type="text" name="name" placeholder="Enter name here" id="name"><br>
		<input type="text" name="course" placeholder="Enter course here"
			id="course"><br>
		<button id="button">Submit</button>
	</form>
	<script>
		$(document).ready(function() {
			$("#button").click(function() {
				var json = {
					"name" : $("#name").val(),
					"course" : $("#course").val()
				};
				$.ajax({
					url : "/getJson",
					method : "post",
					contentType : "application/json",
					dataType : "json",
					data : JSON.stringify(json),
					success : function(result) {
						console.log(JSON.stringify(result));
					},
					error : function(error) {
						console.log(JSON.stringify(error));
					}
				});
			});
		});
	</script>
</body>
</html>