<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>


    <div align="center" class="item-container-detail">
            <h1>Hotel List ${city}</h1>
            <table border="">
            	<tr>
	                <th>No</th>
	                <th>Name</th>
	                <th>Address</th>
	                <th>City</th>
	                <th>Status</th>
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
	                    
	                             
	                </tr>
	                </c:forEach>       
	                </c:when>
	                <c:otherwise>
                		<tr><td colspan="0">${error}</td></tr>
            		</c:otherwise>
                </c:choose>      
            </table>
        </div>
</html>