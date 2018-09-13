<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id"
	content="873903954784-b4l0nkj0vpth4u4qjlaeirt03904jcoo.apps.googleusercontent.com">
<title>Hibernate Test</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src='https://www.google.com/recaptcha/api.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function statusChangeCallback(response) {
		if (response.status === 'connected') {
			testAPI();
		} else {
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.';
		}
	}

	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
	window.fbAsyncInit = function() {
		FB.init({
			appId : '1057987294370936',
			cookie : true,
			xfbml : true,
			version : 'v3.1'
		});

		FB.AppEvents.logPageView();

	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	function testAPI() {
		FB.api('/me', function(response) {
			document.getElementById('status').innerHTML = JSON
					.stringify(response);

		});
	}
</script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
	function onSignIn(googleUser) {
		var a = document.getElementById('status');
		var profile = googleUser.getBasicProfile();
		a.innerHTML = "";
		a.innerHTML += '<br>ID: ' + profile.getId() + '<br>Name: '
				+ profile.getName();
		a.innerHTML += '<br>\nImage URL: ' + profile.getImageUrl();
		a.innerHTML += '<br>\nEmail: ' + profile.getEmail(); // This is null if the 'email' scope is not present.
	}
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			var a = document.getElementById('status');
			a.innerHTML = "Signed Out";
		});
	}
</script>
</head>
<body>
	<form method="post" action="/storeData" id="form1">
		<input type="text" name="name" placeholder="Enter name here"><br>
		<input type="text" name="course" placeholder="Enter course here"><br>
		<div class="g-recaptcha"
			data-sitekey="6Le89m0UAAAAADtfQvhWNSyNAu7wxcJkkxkDHAfO"></div>
		<input type="submit" value="Insert">
		<fb:login-button scope="public_profile,email"
			onlogin="checkLoginState();">
		</fb:login-button>
		<div class="g-signin2" data-onsuccess="onSignIn"></div>
		<a href="#" onclick="signOut();">Sign out</a>

	</form>
	<br>
	<label><span class="badge badge-pill badge-success" id="status"><%=request.getAttribute("status")%></span></label>
	<br>

</body>
</html>