<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Directory</title>
    </head>
    <body>
        <div align="center">
            <h1>Hotel List</h1>
            <h3><a href="">New Hotel</a></h3>
            <table border="1">
            	<tr>
	                <th>No</th>
	                <th>Name</th>
	                <th>Address</th>
	                <th>City</th>
	                <th>Status</th>
	                <th>Action</th>
                </tr>
                 <c:choose>
                 	<c:when test="${empty error}">
	                <c:forEach var="hotel" items="${hotelList}" varStatus="status">
	                <tr>
	                    <td>${status.index + 1}</td>
	                    <td>${hotel.name}</td>
	                    <td>${hotel.address}</td>
	                    <td>${hotel.cityName}</td>
	                    <td>${hotel.status}</td>
	                    <td>
	                        <a href="">Edit</a>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                        <a href="">Delete</a>
	                    </td>
	                             
	                </tr>
	                </c:forEach>       
	                </c:when>
	                <c:otherwise>
                		<tr><td colspan="0">${error}</td></tr>
            		</c:otherwise>
                </c:choose>      
            </table>
        </div>
    </body>
</html>