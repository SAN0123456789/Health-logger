<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
<jsp:include page="patients.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var="abc" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/abc" user="root" password="1234" />
<sql:query dataSource="${abc}"  var="result" >
SELECT * FROM student
</sql:query>
<table border=1>

		<tr>		
			<th>Name</th>
			<th>Phone</th>
			<th>Age</th>
			<th>Diagnosis</th>
			<th>Remark</th>
			<th>Gender</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.phone}" /></td>
				<td><c:out value="${row.age}" /></td>
				<td><c:out value="${row.diag}" /></td>
				<td><c:out value="${row.remark}" /></td>
				<td><c:out value="${row.gender}" /></td>
				<td><a href="delete.jsp?ph=${row.phone}" /><button type="button"  >Delete</button>
				</a></td>
</tr>
		</c:forEach>
	</table>
			
<form action="" method="post">
<h3> Search <input type=text name=search /> </h3>
<input type="submit" name=searching />
</form>
 	<% if(request.getParameter("searching")!=null){%>

<sql:query dataSource="${abc}"  var="result" >
SELECT * FROM student where name like "%${param.search}%"
</sql:query>
<table border=1>

		<tr>		
			<th>Name</th>
			<th>Phone</th>
			<th>Age</th>
			<th>Diagnosis</th>
			<th>Remark</th>
			<th>Gender</th>
		</tr>
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.name}" /></td>
				<td><c:out value="${row.phone}" /></td>
				<td><c:out value="${row.age}" /></td>
				<td><c:out value="${row.diag}" /></td>
				<td><c:out value="${row.remark}" /></td>
				<td><c:out value="${row.gender}" /></td>
				<td><a href="delete.jsp?ph=${row.phone}" /><button type="button"  >Delete</button>
				</a></td>
</tr>
		</c:forEach>
	</table>
 	<%}%>	

</body>
</html>


	
