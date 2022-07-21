<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.Connection"%>

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

	DataSource ds;
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	ds = (DataSource) envCtx.lookup("jdbc/mssql");
	Connection conn = ds.getConnection();
	Statement stmt  = conn.createStatement();

%>
<%@include file="/_common/systemFiles/function.jsp"%>