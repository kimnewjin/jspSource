<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%@ page import="java.sql.*"%>
<%

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionUrl = "jdbc:sqlserver://192.168.11.219:1433;databaseName=soobakc_test;user=edui;password=qlqkr228!#%;";  
	Connection con = DriverManager.getConnection(connectionUrl);  


	String Sql =  "Select top 5 userID, context from dbSoobakc.dbo.tblEvtCommentList Where evtIDX='11008' ";
	Statement stmt  = con.createStatement();
	ResultSet rs = stmt.executeQuery(Sql);
	
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="utf-8">
  <meta name="Generator" content="EditPlus¢ç">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>JSP_TEST</title>
 </head>
 <body>
   Hello JAVA~

   <br/>

   JSP Server TEST

	<hr>

<table border="1">
<caption> DB Connection</caption>
 <%

  while(rs.next()){

   String No1 = rs.getString("userID");

   String No2 = rs.getString("context");

   

 %>

   <tr>

    <td><%=No1%></td>

    <td><%=No2%></td>

    

   </tr>

 <%

  }

 %>

</table>

 </body>
</html>
