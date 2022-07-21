<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%
		String sessionManagerCate	= (String)session.getAttribute("managerCate");
		String sessionMemberID		= (String)session.getAttribute("mem_ID");
		String sessionMemberName	= (String)session.getAttribute("m_Name");


		Cookie cookieManagerCate	= new Cookie("managerCate",sessionManagerCate);
		Cookie cookieMemberID		= new Cookie("mem_ID",sessionMemberID);
		Cookie cookieMemberName		= new Cookie("m_Name",sessionMemberName);


		response.addCookie(cookieManagerCate);
		response.addCookie(cookieMemberID);
		response.addCookie(cookieMemberName);

		String cValueCookieManagerCate	= cookieManagerCate.getValue();
		String cValueCookieMemberID		= cookieMemberID.getValue();
		String cValueCookieMemberName	= cookieMemberName.getValue();


		if(sessionManagerCate == "" || sessionManagerCate == null) {
			sessionManagerCate = (String)cValueCookieManagerCate;
		}

		if(sessionMemberID == "" || sessionMemberID == null) {
			sessionMemberID = (String)cValueCookieMemberID;
		}

		if(sessionMemberName == "" || sessionMemberName == null) {
			sessionMemberName = (String)cValueCookieMemberName;
		}

		if (sessionManagerCate == null || sessionMemberID == null || sessionMemberName == null ){
				out.println("<Script language='javascript'>");
				out.println("	alert('세션이 종료되었습니다.다시 로그인 하세요.');	");
				out.println("	location.href='/index.jsp';	");
				out.println("</Script>");
				return;		
		}

		String adminAuth = "";
		if (sessionManagerCate.equals("1000")){			
			adminAuth = "super";
		}

		if( sessionManagerCate.equals("1030") ){
			adminAuth = "super";
		}

		
		
%>