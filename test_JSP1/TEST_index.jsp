<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.Connection"%>

<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>
<%
	DataSource ds;
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	ds = (DataSource) envCtx.lookup("jdbc/mssql");
	Connection conn = ds.getConnection();
	String Sql =  "Select top 5 userID, context from dbSoobakc.dbo.tblEvtCommentList Where evtIDX='11008' ";
	Statement stmt  = conn.createStatement();
	ResultSet rs = stmt.executeQuery(Sql);
%>
<%
	out.println("Hello JSP World!!!");
	out.println("<hr>");
	out.println("Welcome JSP!<br/>");
	out.println("Welcome JAVA!!!!!ㅋㅋㅋ");

	out.println("<hr>");
%>
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
<HR>
<%//펑션정의할때는 무조건 스크립트 블록 여는 퍼센테이지에 ! 붙히고 시작%>
<%!
	public String getTest(int a, String b){
		return "AA";
	}
	public int getIntValue(int a, int v){

		int b = a+1;
		return b;
	
	}	
	public String getStringValue(String a){

		String b = a + "|문자열합치기";
		return b;	
	}	

	public String getSwitchValue(int a){
		String returnValue;
		switch (a){
			case 1 :
				returnValue = "메롱";	
				break;
			case 2 :
				returnValue = "똥꼬~";			
				break;
			default :
				returnValue = "긴뉴~";
		}

		return returnValue;
	}
%>
<%
	int DD = getIntValue(3,4);
	out.println(DD);
	out.println("<BR>");
	String AA = getStringValue("메롱메롱");
	out.println(AA);

	String CC = getSwitchValue(1);
	out.println(CC);

%>
	