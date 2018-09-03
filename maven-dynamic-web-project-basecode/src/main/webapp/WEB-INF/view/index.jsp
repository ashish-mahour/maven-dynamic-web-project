<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hibernate Test</title>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
<form method="post" action="/storeData" id="form1">
<input type="text" name="name" placeholder="Enter name here"><br>
<input type="text" name="course" placeholder="Enter course here"><br>
<div class="g-recaptcha" data-sitekey="6Le89m0UAAAAADtfQvhWNSyNAu7wxcJkkxkDHAfO"></div>
<input type="submit" value="Insert">
</form>
<p><%=request.getAttribute("status") %></p>
</body>
</html>