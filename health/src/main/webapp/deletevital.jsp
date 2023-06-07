<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html lang="en">
<body>
<%
int s=Integer.parseInt(request.getParameter("ser"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM vital WHERE sr="+s);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
 	<jsp:forward page="vitaldata.jsp"></jsp:forward>
</body>
</html>
 	

 	