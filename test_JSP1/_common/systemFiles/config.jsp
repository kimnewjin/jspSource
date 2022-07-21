<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>




<%
	int companyID = 10001;
	String userIP = request.getRemoteAddr();
	StringBuffer thisPage = request.getRequestURL();
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try{
		DataSource ds;
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		ds = (DataSource) envCtx.lookup("jdbc/mssql");
		conn	= ds.getConnection();
		stmt	= conn.createStatement();
	
	}catch(SQLException e){
	%>
		<Script language='javascript'>
			alert("DB연결 실패[<%=e%>].");
			location.href='/';	
		</Script>
	<%
		return;		
	
	}

%>
<%@include file="/_common/systemFiles/function.jsp"%>