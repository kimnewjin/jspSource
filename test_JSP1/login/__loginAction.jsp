<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%
	String rUserID = request.getParameter("userID");
	String rPassWD = request.getParameter("passWD");
	String rManagerCate = request.getParameter("managerCate");


	if(rUserID == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('�����ID�� �Էµ��� �ʾҽ��ϴ�.');	");
		out.println("	location.href='/';	");
		out.println("</Script>");
		return;		
	}

	
	if(rPassWD == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('��й�ȣ�� �Էµ��� �ʾҽ��ϴ�.');	");
		out.println("	location.href='/';	");
		out.println("</Script>");
		return;		
	}

	if(rManagerCate == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('������ ���¸� �����ϼ���.');	");
		out.println("	location.href='/';	");
		out.println("</Script>");
		return;		
	}



	String Sql;
	String managerCate;
	String mem_ID;
	String m_Name;


	Sql =	"	Select top 1 Bm.managerCate, Bm.mem_ID, Bm.m_Name From dbB2B.dbo.tblSoobakcB2bCompany	 as bc	";
	Sql	= Sql +	"		Inner join dbB2B.dbo.tblSoobakcB2bManager as Bm	"	;
	Sql	= Sql +	"		On Bc.CompanyId = Bm.CompanyId	"	;
	Sql	= Sql +	"	Where Bc.CompanyStatus = 'Y'  And Bm.MDel = 'N' "	;
	Sql	= Sql +	"			And Bm.CompanyId = '"+companyID+ "' ";
	Sql	= Sql +	"			And Bm.Mem_Id = '"+ rUserID +"' "	;
	Sql	= Sql +	"			And Bm.M_Pwd = '" +rPassWD +"' "	;
	Sql	= Sql +	"			And Bm.ManagerCate = '" +rManagerCate +"' "	;

	ResultSet rs = stmt.executeQuery(Sql);

	if (!rs.next()){
		out.println("<Script language='javascript'>");
		out.println("	alert('�α��� ������ ��ȿ���� �ʽ��ϴ�.');	");
		out.println("	location.href='/';	");
		out.println("</Script>");
		return;		
	}else{		
		managerCate		=	rs.getString(1);
		mem_ID			=	rs.getString(2);
		m_Name			=	rs.getString(3);
	}
		session.setAttribute("managerCate",managerCate);
		session.setAttribute("mem_ID",mem_ID);
		session.setAttribute("m_Name",m_Name);

		
		String sessionManagerCate	= (String)session.getAttribute("managerCate");
		String sessionMemberID		= (String)session.getAttribute("mem_ID");
		String sessionMemberName	= (String)session.getAttribute("m_Name");

	
		

		Cookie cookieManagerCate	= new Cookie("managerCate",managerCate);
		Cookie cookieMemberID		= new Cookie("mem_ID",mem_ID);
		Cookie cookieMemberName		= new Cookie("m_Name",m_Name);


		response.addCookie(cookieManagerCate);
		response.addCookie(cookieMemberID);
		response.addCookie(cookieMemberName);

		String cValueCookieManagerCate	= cookieManagerCate.getValue();
		String cValueCookieMemberID		= cookieMemberID.getValue();
		String cValueCookieMemberName	= cookieMemberName.getValue();

		String InsertQuery ;

		InsertQuery = " Insert Into dbB2B.dbo.tblSoobakcB2BAdminLoginHistory	(	";
		InsertQuery = InsertQuery + "	memID, mName, mCate, mCompanyID, userIP, regDate	"	;
		InsertQuery = InsertQuery + "	) Values	(	"	;
		InsertQuery = InsertQuery + "		'" +mem_ID +"','" +m_Name +"','" +managerCate +"','" +companyID +"','" +userIP +"', getDate()	"	;
		InsertQuery = InsertQuery + "	) "	;

		stmt.executeUpdate(InsertQuery);

		rs.close();
		stmt.close();
		conn.close();


%>
<Script language="javascript">
	alert('�α��εǾ����ϴ�.');
	location.href='/member/index.jsp';
</Script>

<%
	/*	2019-08-30 / ������
		session ��ü
		- �� �������� ��û�� ���� ������ ���ǰ� ���� ������ �����ϰ� �����ϴ� ���

		getID() - ���� ID����
		getCreationTime() - ������ ������ �ð� ����
		getLastAccessedTime() - ���� �������� ������ �۾� �ð� ����
		getMaxInactiveInterval() - ���� �����ð� ����
		setMaxInactiveInterval(time) - ���� ��ȿ �ð��� time���� ������ ������ ����
		invalidate() - ���� ���� ����


		���Ǻ����� ���� �����ϱ�
		session.setAttribute("sessionName1",sessionValue1); // sessionName1�̶�� ������ �����Ͽ� sessionValue1 ���� ��Ī��
		String sessionName	= (String)session.getAttribute("sessionName1"); // sessionName�̶�� ������ ���ǰ��� ��Ī��Ŵ

		getAttribute(String name) : name�� �ش��ϴ� �Ӽ����� ������
		removeAttribute(String name) : name�� �ش��ϴ� �Ӽ����� ������
		setAttribute(String name, object) : name �̶� �̸����� object_�� ������ ����
	*/
%>