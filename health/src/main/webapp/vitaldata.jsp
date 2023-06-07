<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<h4><a href = vitals.jsp>Add Vitals </a>&nbsp;&nbsp
<a href = alert.jsp>Vital Alerts</a>&nbsp;&nbsp
<a href = patients.jsp>Manage Patients </a></h4>
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
				<td><c:out value="${row.bplow}" /></td>
				<td><c:out value="${row.bphigh}" /></td>
				<td><c:out value="${row.spo}" /></td>
				<td><c:out value="${row.record}" /></td>
				<td><a href="deletevital.jsp?ser=${row.sr}" /><button type="button"  >Delete</button>
				</a></td>
</tr>	
		</c:forEach>
	</table>
</body>
</html>


