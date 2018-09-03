<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hibernate Test</title>
</head>
<body>
<form method="post" action="/storeData" id="form1">
<input type="text" name="name" placeholder="Enter name here"><br>
<input type="text" name="course" placeholder="Enter course here"><br>
<input type="submit" value="Insert">
</form>
<p><%=request.getAttribute("status") %></p>
</body>
</html>