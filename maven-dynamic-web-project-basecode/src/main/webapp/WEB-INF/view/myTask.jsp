<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Task</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/res/main.css">
</head>
<body>

	<nav class="navbar navbar-inverse ">
		<div class="container-fluid">
			<div class="navbar-header">
				<img src="/res/images/logo.png" alt="Logo"
					style="width: 40px; float: left;"> <a class="navbar-brand"
					href="#" style="margin-left: 20px;">My Web site</a>
			</div>
			<ul class="nav navbar-nav" id="custom-nav">
				<li class="active"><a href="#"
					onclick="document.getElementById('id01').style.display='block'"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<li><a href="#" onclick="document.getElementById('id02').style.display='block'"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			id="cutomImg">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"
					id="cutomImg"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">

				<div class="item active">
					<img src="/res/images/ash.jpg" alt="Chania">
					<div class="carousel-caption">
						<h3>Alphabet</h3>
					</div>
				</div>

				<div class="item">
					<img src="/res/images/Cover.jpg" alt="Chania">
					<div class="carousel-caption">
						<h3>Love</h3>
					</div>
				</div>

				<div class="item">
					<img src="/res/images/b.jpg" alt="Flower">
					<div class="carousel-caption">
						<h3>Music</h3>
					</div>
				</div>

				<div class="item">
					<img src="/res/images/d.jpg" alt="Flower">
					<div class="carousel-caption">
						<h3>Flowers</h3>
					</div>
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<script>
		$(".nav li").on("click", function() {
			$(".nav li").removeClass("active");
			$(this).addClass("active");
		});
	</script>

	<div id="id01" class="modal">

		<form class="modal-content animate" action="/action_page.php">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="/res/images/loginImg.png" alt="Avatar" class="avatar" width=100px
					height=200px>
			</div>

			<div class="container">
				<label for="uname"><b>Username</b></label><br> <input
					type="text" placeholder="Enter Username" name="uname" required>
				<br> <label for="psw"><b>Password</b></label> <br> <input
					type="password" placeholder="Enter Password" name="psw" required>
				<br>
				<button type="submit">Login</button>
				<br> <label> <input type="checkbox" checked="checked"
					name="remember"> Remember me
				</label>
			</div>
			<br>
			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div>

	<div id="id02" class="modal">
		<span onclick="document.getElementById('id02').style.display='none'"
			class="close" title="Close Modal">times;</span>
		<form class="modal-content" action="/action_page.php">
			<div class="container">
				<h1>Sign Up</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>
				<label for="email"><b>Email</b></label> <input type="text"
					placeholder="Enter Email" name="email" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="psw" required> <label
					for="psw-repeat"><b>Repeat Password</b></label> <input
					type="password" placeholder="Repeat Password" name="psw-repeat"
					required> <label> <input type="checkbox"
					checked="checked" name="remember" style="margin-bottom: 15px">
					Remember me
				</label>

				<p>
					By creating an account you agree to our <a href="#"
						style="color: dodgerblue">Terms & Privacy</a>.
				</p>

				<div class="clearfix">
					<button type="button"
						onclick="document.getElementById('id02').style.display='none'"
						class="cancelbtn">Cancel</button>
					<button type="submit" class="signup">Sign Up</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id02');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<br>
	<div class="container-fluid"  style="">
	<div class="row" style = "background-color: gray;margin-left: auto;margin-right: auto; padding: 10px" >
		<div class = "col-sm-4 col-xs-4 col-md-4 col-lg-4"><img src="/res/images/love.jpeg" alt="Flower" id = "customImg" ></div>
		<div class = "col-sm-4 col-xs-4 col-md-4 col-lg-4"><img src="/res/images/love.jpeg" alt="Flower" id = "customImg" ></div>
		<div class = "col-sm-4 col-xs-4 col-md-4 col-lg-4"><img src="/res/images/love.jpeg" alt="Flower" id = "customImg" ></div>
	</div>
	<div class="row" style = "background-color: #00aaff;margin-left: auto;margin-right: auto; padding: 10px" >
		<div class = "col-sm-6 col-xs-6 col-md-6 col-lg-6"><img src="/res/images/location.png" alt="Flower" id = "customLocation" ></div>
		<div class = "col-sm-6 col-xs-6 col-md-6 col-lg-6" id = "contactDiv">
			<h3>Contact Us</h3>
		</div>
	</div>
	</div>
	<div class="container-fluid"  style="background-color: black; height: 100px ; color: white;">
		<p style="text-align: center;">&copy;This is the copyright bar or bottom bar</p>
	</div>
	
	

</body>
</html>