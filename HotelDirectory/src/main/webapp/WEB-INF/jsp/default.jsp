<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title> Home </title>
<link href="<c:url value="/resources/css/reset.css" />" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/head.jsp" />

	
	<div class="body">
	<div class="wrap">
		<div class="content">
			<div class="btn-top-container">
			<div id ="new" class="btn-top color-green"><span class="icon-more-w icon"></span><span class="text">New</span></div>
			<div id="join" class="btn-top color-gray"><span class="icon-join-w icon"></span><span class="text">Search</span></div>
			<div class="btn-top color-green"><span class="icon-leave-w icon"></span><span class="text">Hotel List</span></div>
			<div class="btn-top color-gray"><span class="icon-help-w icon"></span><span class="text">Help</span></div>
			</div>
			
			<div class="item-container">
				<c:import url="${page}"></c:import>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jsp/foot.jsp" />
</body>
</html>