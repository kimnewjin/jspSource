<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%@include file="/_common/systemFiles/incPrivateInformation.jsp"%>
<%request.setCharacterEncoding("euc-kr");%>
<%
	
	String memIDX		= request.getParameter("memIDX");
	String subProfID	= request.getParameter("subProfID");
	String subProfName	= request.getParameter("subProfName");
	
	if(memIDX == "" || subProfID == "" || subProfName == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('���ٹ���� �ùٸ��� �ʽ��ϴ�.');	");
		out.println("	window.close();	");
		out.println("</Script>");
		return;		
	}



	String Query = "";


	Query = " Update dbB2B.dbo.tblSoobakcB2BMemInfo Set	";
	Query = Query + "	subProfID = '"+subProfID+"'	";
	Query = Query + "	,	subProfName = '"+subProfName+"'	";
	Query = Query + "	,	editer = '"+sessionMemberID+"'	";
	Query = Query + "	,	editDate =  getDate()	";
	Query = Query + "	,	editIP = '"+userIP+"'	";
	Query = Query + "Where IDX = '"+memIDX+"'	";

	

	stmt.executeUpdate(Query);

	stmt.close();
	conn.close();


%>
<Script language="javascript">
	alert('�����Ǿ����ϴ�..');
	location.href="popupSetMemberTeacherInfo.jsp?memIDX=<%=memIDX%>";
</Script>