<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >

<html>
<script>
$(function() {
$( "input[type=submit],button" )
.button()
.click(function( event ) {
	location.href = "${pageContext.request.contextPath}/search?city="+ $("#citys").val();
	return false;
});
});

$(document).ready(function() {
	  $(function() {
		 $( "#citys" ).autocomplete({
		 source: function (request, response) {
			 
	            $.getJSON("${pageContext.request.contextPath}/getCity", request, function(result) {
	                response($.map(result, function(item) { 
	                    return {
	                        data: item.name ,                        
	                        value: item.name,
	                        
	                    };
	                }));
	            });
	        }
		 });
		 }); 
	/* $(function() {      
        $("#citys").autocomplete({
            source: function (request, response) {
                $.getJSON("${pageContext.request.contextPath}/getCity", {
                    term: request.term
                }, response);
            }
        });
    }); */
		 });
</script>


	<div class="item-container-head" align="center">
		<div class="ui-widget">
			<label for="citys">Enter City: </label>
			<input id="citys">
			<input type="submit" value="Search">
		</div>
	</div>

    <div align="center" class="item-container-detail">
            <h1>Hotel List ${city}</h1><br>
            <div class="tablecss">
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
        </div>
</html>