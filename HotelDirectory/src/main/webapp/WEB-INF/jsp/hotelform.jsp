<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Hotel Details</title>
<base href="${pageContext.request.contextPath}/">
<style>
td {padding: 10px;}
</style>
</head>
<body>
    <div align="center" class="item-container-detail">
    <c:choose>
        <c:when test="${empty msg}">
        <h2>Add New Hotel</h2>
        <c:choose>
        <c:when test="${!empty error}"><h3>${error}</h3>
        </c:when></c:choose>
        <form:form action="saveHotel" method="post" modelAttribute="hotel">
        <% request.setAttribute("type", "0"); %>
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Name*:</td>
                <td><form:input path="name" required="required"/></td>
            </tr>
            <tr>
                <td>Address*:</td>
                <td><form:input path="address" required="required"/></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><form:select path="city">
    				<form:options items="${cityList}" itemValue="id" itemLabel="name"/>
					</form:select></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><form:input type="number" path="status" value="1"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save">
                <input type="hidden" id="type" name="type" value ="0"/></td>
            </tr>
        </table>
        </form:form>
        <div><h3><a href="home">Back</a></h3></div>
        </c:when>
        
        <c:otherwise>
        	<div><h3>${msg}</h3><h3><a href="list">View List</a></h3>
        	</div>
        </c:otherwise>
        </c:choose>
    </div>
</body>
</html>