<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html lang="en">
<body>
<%
String no=request.getParameter("ph");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM student WHERE phone="+no);

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
 	<jsp:forward page="search.jsp"></jsp:forward>

</body>
</html>
 	

 	