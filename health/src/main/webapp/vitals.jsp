<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.Date,java.util.*"%>
<!DOCTYPE html>
<html>
<body>
<a href = alert.jsp>Vital Alerts</a>&nbsp;&nbsp
<a href = patients.jsp>Manage Patients </a></h4>
<form action="">
<%
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "1234");
String sql = "SELECT * FROM student";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>
<form action="" method="post">
<h3>Select Patient : <select name="op">
<%
while(rs.next()) { String name = rs.getString("name");  %>
<option value="<%=name %>"><%=name %></option>
<% } %>
</select></h3>
<%
} catch(SQLException sqe) { 
out.println(sqe);} %>
<h3>BP LOW : <input type="number" name="l"/></h3>
<h3>BP HIGH : <input type="number" name="h"/></h3>
<h3>SPO2 : <input type="number" name="s"/></h3>
<input type="submit" name=searching />
</form>
<%
String name=request.getParameter("op");
String high=request.getParameter("l");
String low=request.getParameter("h");
String sp=request.getParameter("s");
Date date = new Date();
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abc", "root", "1234");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into vital(name,bplow,bphigh,spo,record) values ('"+name+"','"+high+"','"+low+"','"+sp+"','"+date+"') ");
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

	
