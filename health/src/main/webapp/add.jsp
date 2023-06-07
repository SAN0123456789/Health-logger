<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<form action="" method="post"> 
	<h3>Add Patient</h3>
<h3>Enter name : <input type="text" name="n"/></h3>
<h3>Enter Phone   : <input type="number" name="p"/></h3>
<h3>Enter Age   : <input type="number" name="a"/></h3>
<h3>Enter Diagnosis : <input type="text" name="d"/></h3>
<h3>Enter Remark   : <input type="text" name="r"/></h3>
<h3>Enter Gender   : <input type="radio" name="g" value="Male">Male
					<input type="radio" name="g" value="Female">Female
					<input type="submit" name= "pro" value="ADD"/>
 	</form> 
<body>
<%
String name=request.getParameter("n");
String  phone=request.getParameter("p");
String age =request.getParameter("a");
String diag=request.getParameter("d");
String remark=request.getParameter("r");
String gender=request.getParameter("g");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into student values ('"+name+"','"+phone+"','"+age+"','"+diag+"','"+remark+"','"+gender+"') ");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
 	 	<% if(request.getParameter("pro")!=null){%>
 	 	 	<jsp:include page="patients.jsp"></jsp:include>
<%out.println("Record Added Successfully !");%>
<%}%>
</body>
</html>


