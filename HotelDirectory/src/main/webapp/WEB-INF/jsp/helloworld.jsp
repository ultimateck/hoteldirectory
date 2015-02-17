<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring 4 MVC -HelloWorld</title>
<base href="${pageContext.request.contextPath}/">

</head>
<body>
	<div style="width:700px; margin:0px auto;">
		<h2>Hello World</h2>
		<h2>
			${message} ${name}
		</h2>
		<h3><a href="list">List</a></h3>
		<h3><a href="saveHotel">Add New Hotel</a></h3>
	</div>
</body>
</html>