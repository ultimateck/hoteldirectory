<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<base href="${pageContext.request.contextPath}/"> 
<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
<div class="header">
	<div class="wrap">
		<div class="hcontent">
			<div class="logo">
				<img src="resources/images/logo.png"></img>
				<span>Hotel Directory</span>
			</div>
			<div class="headmenu">
				<ul>
					<li><a href=""><span class="icon-home-w"></span>Home</a></li>
					<li><a href=""><span class="icon-help-w"></span>Help</a></li>
					<li><a href=""><span class="icon-about-w"></span>About</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</html>