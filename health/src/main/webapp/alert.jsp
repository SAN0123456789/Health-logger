<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
<h4><a href = vitals.jsp>Add Vitals </a>&nbsp;&nbsp
<a href = patients.jsp>Manage Patients </a></h4>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="abc" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/abc" user="root" password="1234" />
<sql:query dataSource="${abc}"  var="result" >
SELECT * FROM vital
</sql:query>
<table border=1>
		<tr>
			<th>Sr.No</th>
			<th>Name</th>
			<th>BP LOW</th>
			<th>BP HIGH</th>
			<th>SPO2</th>
			<th>Recorded on</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.sr}" /></td>
				<td><c:out value="${row.name}" /></td>
				
			<c:if test="${row.bplow <= 50}">  
				<td style="color: red"> ${row.bplow}  </td>
			</c:if>  
			<c:if test="${row.bplow > 50}">  
				<td>${row.bplow}</td>
			</c:if> 
			
			<c:if test="${row.bphigh >= 160}">  
				<td style="color: blue"> ${row.bphigh}  </td>
			</c:if>  
			<c:if test="${row.bphigh < 160}">  
				<td>${row.bphigh}</td>
			</c:if> 

			<c:if test="${row.spo <= 90}">  
				<td style="color: violet"> ${row.spo}  </td>
			</c:if>  
			<c:if test="${row.spo > 90}">  
				<td>${row.spo}</td>
			</c:if> 
			
				<td><c:out value="${row.record}" /></td>
				<td><a href="deletevital.jsp?ser=${row.sr}" /><button type="button"  >Delete</button>
				</a></td>
</tr>
			</tr>
		</c:forEach>
	</table>
</body>
</html>



