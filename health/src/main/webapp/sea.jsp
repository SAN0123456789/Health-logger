<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 
<h3>SQL JSTL Demo</h3>

<sql:setDataSource var="abc" driver="com.mysql.cj.jdbc.Driver"

		url="jdbc:mysql://localhost:3306/abc" user="root" password="1234" />

 	<% if(request.getParameter("searching")!=null){%>

<sql:query dataSource="${abc}"  var="result" >
SELECT * FROM student where name like "%${param.search}%"
</sql:query>
<table border=1>

		<tr>
		
			<th>ID</th>

			<th>Name</th>

			<th>Price</th>

			<th>Date Added</th>

		</tr>

		<c:forEach var="row" items="${result.rows}">

			<tr>

				<td><c:out value="${row.id}" /></td>

				<td><c:out value="${row.name}" /></td>

				<td><c:out value="${row.age}" /></td>

				<td><c:out value="${row.teach}" /></td>

				<td><a href="product-details?id=${row.id}" />Clicker for product details</a></td>

			</tr>

		</c:forEach>
	</table>
 	<%}%>	

</body>
</html>

