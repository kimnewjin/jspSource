<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%
	String rUserID = request.getParameter("userID");
	String rPassWD = request.getParameter("passWD");
	String rManagerCate = request.getParameter("managerCate");


	if(rUserID == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('사용자ID가 입력되지 않았습니다.');	");
		out.println("	location.href='/';	");
		out.println("</Script>");
		return;		
	}

	
	if(rPassWD == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('비밀번호가 입력되지 않았습니다.');	");
		out.println("	location.href='/';	");
		out.println("</Script>");
		return;		
	}

	if(rManagerCate == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('관리자 형태를 선택하세요.');	");
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
		out.println("	alert('로그인 정보가 유효하지 않습니다.');	");
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
	alert('로그인되었습니다.');
	location.href='/member/index.jsp';
</Script>

<%
	/*	2019-08-30 / 김유진
		session 객체
		- 웹 브라우저의 요청에 대한 정보의 세션과 관련 정보를 저장하고 관리하는 기능

		getID() - 세션 ID리턴
		getCreationTime() - 세션이 생성된 시간 리턴
		getLastAccessedTime() - 현제 세션으로 마지막 작업 시간 리턴
		getMaxInactiveInterval() - 세션 유지시간 리턴
		setMaxInactiveInterval(time) - 세션 유효 시간을 time으로 설정된 값으로 설정
		invalidate() - 현재 세션 종료


		세션변수에 세션 생성하기
		session.setAttribute("sessionName1",sessionValue1); // sessionName1이라는 세션을 생성하여 sessionValue1 값을 매칭함
		String sessionName	= (String)session.getAttribute("sessionName1"); // sessionName이라는 변수에 세션값을 매칭시킴

		getAttribute(String name) : name에 해당하는 속성값을 리턴함
		removeAttribute(String name) : name에 해당하는 속성값을 삭제함
		setAttribute(String name, object) : name 이란 이름으로 object_형 데이터 저장
	*/
%>