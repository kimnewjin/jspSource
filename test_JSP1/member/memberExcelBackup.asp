<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%@include file="/_common/systemFiles/incPrivateInformation.jsp"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCellStyle"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFFont"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFColor"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFFont"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>








<%
	String pageCode = "member";
	String lnbTitle = "가입현황";

	String searchTeacherType = request.getParameter("searchTeacherType");

	if(searchTeacherType == null){
		searchTeacherType = "";
	}

	String searchTeacherName = request.getParameter("searchTeacherName");

	if(searchTeacherName == null){
		searchTeacherName = "";
	}

	String searchMemberType = request.getParameter("searchMemberType");

	if(searchMemberType == null){
		searchMemberType = "";
	}

	String searchMemberString = request.getParameter("searchMemberString");

	if(searchMemberString == null){
		searchMemberString = "";
	}

	String searchMemberStatus = request.getParameter("searchMemberStatus");

	if(searchMemberStatus == null){
		searchMemberStatus = "";
	}
	String searchMemberRoot = request.getParameter("searchMemberRoot");

	if(searchMemberRoot == null){
		searchMemberRoot = "";
	}

	String searchBeginDate = request.getParameter("searchBeginDate");

	if(searchBeginDate == null){
		searchBeginDate = "";
	}

	String searchEndDate = request.getParameter("searchEndDate");

	if(searchEndDate == null){
		searchEndDate = "";
	}

	String sortingFlag = request.getParameter("sortingFlag");
	if(sortingFlag == null){
		sortingFlag = "N";
	}

	String pageParam = "";
	pageParam = pageParam + "searchTeacherType="+searchTeacherType+"&searchTeacherName="+searchTeacherName+"&searchMemberType="+searchMemberType;
	pageParam = pageParam + "&searchMemberString="+searchMemberString+"&searchMemberStatus="+searchMemberStatus+"&searchMemberRoot="+searchMemberRoot;
	pageParam = pageParam + "&searchBeginDate="+searchBeginDate+"&searchEndDate="+searchEndDate;
	pageParam = pageParam + "&sortingFlag="+sortingFlag;


	


	int gotoPage = 1;
	String gotoPage1  = request.getParameter("gotoPage");

	if (gotoPage1 == null){
		gotoPage1 = "1";
	}
	
	if( Integer.parseInt(gotoPage1) > 1){
		gotoPage = Integer.parseInt(gotoPage1);
	}

	String subSql = "";

	if (adminAuth != "super"){
		searchTeacherType	= "total.subProfID";
		searchTeacherName	= sessionMemberID;
	}
	

	if(searchTeacherType != "" && searchTeacherName != ""){
		subSql = subSql + " And "+searchTeacherType+" = '"+searchTeacherName+"'	";
	}

	if(searchMemberType != "" && searchMemberString != ""){
		subSql = subSql + " And "+searchMemberType+" like  '%"+searchMemberString+"%'	";
	}

	if (searchMemberStatus != "") {
		switch (searchMemberStatus) {
			case "B" :/*가입이전*/
				subSql = subSql + " And total.mem_ID is null	";
			break;
			case "F" :/*가입완료*/
				subSql = subSql + "	And total.mem_ID is Not null";
				subSql = subSql	+ " And (Select Count(1) From dbB2b.dbo.ViewLectureHistorySoobakc Where mem_Id = total.Mem_Id) = 0		"	;
				subSql = subSql + "	And total.orderCount = 0 And total.CancelCount = 0	";
			break;
			case "N" :/*구매불가*/
				subSql = subSql + " And total.mem_ID is Not null";
				subSql = subSql + "	And total.buyYnflag = 'N'	";
				subSql = subSql + " And total.orderCount ='0'	";
			break;
			case "BV" :/*구매완료*/
				subSql = subSql + " And total.orderCount > '0'	";
				subSql = subSql + " And total.CancelCount = '0'	";
			break;
			case "BC" :	/*구매취소*/
				subSql = subSql  + " And total.CancelCount > 0 ";
			break;

		}
	}

	if (searchMemberRoot != ""){
		subSql = subSql + "And total.enterSiteGB = '"+searchMemberRoot+"'	";
	}

	if(searchBeginDate != "" && searchEndDate !=""){
		subSql = subSql + "	And datediff(day,total.regDate, getDate()) Between datediff(day,'"+searchEndDate+"' ,getdate()) And datediff(day,'"+searchBeginDate+"' ,getdate())		";
	}

	String sortingQuery = "";
	

	switch(sortingFlag){
		case "N":
			sortingQuery = "Order by IDX Desc";
			break;
		case "A":
			sortingQuery = "Order by Mem_Id Asc, Idx Desc";
			break;
		case "B":
			sortingQuery = "Order by M_NAME Asc, Idx Desc";
			break;
		case "C":
			sortingQuery = "Order by M_HP Asc, Idx Desc";
			break;
		case "D":
			sortingQuery = "Order by MainProfId Asc, Idx Desc";
			break;
		case "E":
			sortingQuery = "Order by MainProfName Asc, Idx Desc";
			break;
		case "F":
			sortingQuery = "Order by SubProfId Asc, Idx Desc";
			break;
		case "G":
			sortingQuery = "Order by SubProfName Asc, Idx Desc";
			break;
		case "H":
			sortingQuery = "Order by FamilySiteMemID Asc, Idx Desc";
			break;
		case "I":
			sortingQuery = "Order by FamilySiteMemName Asc, Idx Desc";
			break;
		case "J":
			sortingQuery = "Order by reg_Date Asc, Idx Desc";
			break;
		default :
			sortingQuery = "Order by IDX Desc";
			break;
	}



	


	ResultSet listRSExcel;
	String listQuery = "";

	listQuery =	"	Select top 10 * From (	"	;
	listQuery = listQuery +	"		Select isNull(mb.mem_Id,'') As mem_ID , isnull(mb.m_Name,'') As m_Name, isNull(mb.m_HP,'') As m_HP	";
	listQuery = listQuery +	"			, Bm.mainProfID, Bm.mainProfName, BM.subProfID, BM.subProfName, BM.familysiteMemID 	"	;
	listQuery = listQuery +	"			,	bm.familysiteMemName, (Select tName From dbb2b.dbo.tblSoobakcb2bCode with(Nolock) where tCode =entersiteGB) As SiteGbName	" ;
	listQuery = listQuery +	"			,	isNull(convert(Varchar(10),mb.reg_date,120),'') As regDate		" ;
	listQuery = listQuery +	"			, (	Select Count(1) From  dbSoobakc.dbo.tblOrderDetailLevel1 As A	with(Nolock) ";
	listQuery = listQuery +	"					Inner Join dbB2B.dbo.tblSoobakcB2BSalesItemList  As B with(Nolock) on A.LP_Idx = B.lp_idx	";
	listQuery = listQuery +	"				Where B.isDel='N' And B.companyID='" + companyID + "'	";
	listQuery = listQuery +	"					and status='1' And isRefund='0'  And userID = bm.mem_ID)	As orderCount	";
	listQuery = listQuery +	"			, (	Select Count(1) From  dbSoobakc.dbo.tblOrderDetailLevel1 As A	with(Nolock) ";
	listQuery = listQuery +	"					Inner Join dbB2B.dbo.tblSoobakcB2BSalesItemList  As B with(Nolock) on A.LP_Idx = B.lp_idx	";
	listQuery = listQuery +	"				Where B.isDel='N' And B.companyID='" + companyID + "'	";
	listQuery = listQuery +	"					and status='2' And isRefund='1'  And userID = bm.mem_ID)	As CancelCount, bm.Idx	"		;
	listQuery = listQuery +	"					, isnull(bm.buyYnFlag,'') as buyYnFlag, bm.EnterSiteGb	" ;
	listQuery = listQuery +	"			"	;
	listQuery = listQuery +	"		From dbb2b.dbo.tblSoobakcb2bMemInfo As Bm	with(Nolock) "	;
	listQuery = listQuery +	"			Left Outer Join soobakc_Test.dbo.tbl_Member_basic As MB with(Nolock) on Bm.mem_Id = Mb.mem_ID	"	;
	listQuery = listQuery +	"		Where Bm.isDel='N' 	And bm.companyID	= '" + companyID + "'		";
	listQuery = listQuery +	"	)	As total	"	;
	listQuery = listQuery +	"	Where 1 = 1	"	+ subSql +sortingQuery ; 	
	
	//out.println(listQuery);
	
	listRSExcel = stmt.executeQuery(listQuery);
	
	//String filename  = "와이즈캠프가입현황";
	/*response.setHeader("Content-Type", "application/vnd.ms-excel");
	response.setHeader("Content-Disposition","attachment;filename=WISECAMPE_MEMBERLIST.xls");    //디폴트 파일명 지정
	response.setHeader("Content-Description", "JSP Generated Data"); */

	out.println(new XSSFWorkbook());
//	return;


%>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="euc-kr">
	
</head>

<body>
		<table width="100%" border="2">
				<tr>	
					<th>번호</th>
					<th>수박씨ID</th>
					<th>수박씨회원명</th>
					<th>수박씨연락처</th>
					<th>담임교사ID</th>
					<th>담임교사명</th>
					<th>추천교사ID</th>
					<th>추천교사명</th>
					<th>와이즈캠프ID</th>
					<th>와이즈캠프회원명</th>
					<th>가입경로</th>
					<th>수박씨가입일</th>
					<th>회원상태</th>					
				</tr>
				<%
					int listNo = 1;
					//out.println(listRSExcel.next());
					while(listRSExcel.next()){					
				
						String memID				= listRSExcel.getString("mem_ID");						
						String memberName			= listRSExcel.getString("m_Name");
						String memberHP				= listRSExcel.getString("m_HP");
						String mainprofID			= listRSExcel.getString("mainProfID");
						String mainProfName			= listRSExcel.getString("mainProfName");
						String subProfID			= listRSExcel.getString("subProfID");
						String subProfName			= listRSExcel.getString("subProfName");
						String familysitememID		= listRSExcel.getString("familysiteMemID");
						String familysitememName	= listRSExcel.getString("familysiteMemName");
						String siteGBName			= listRSExcel.getString("SiteGbName");
						String regDate				= listRSExcel.getString("regDate");
						String orderCount			= listRSExcel.getString("orderCount");
						String cancelCount			= listRSExcel.getString("CancelCount");
						String memIdx				= listRSExcel.getString("Idx");
						String buyYNFlag1			= listRSExcel.getString("buyYnFlag");
						String enterSiteGB			= listRSExcel.getString("EnterSiteGb");

						if (memberHP == null){
							memberHP = "";
						}
					
	
							if(buyYNFlag1 == null){
								buyYNFlag1 = "";
							}
	
							String memberRegDate	= setSwitchDateValue(regDate, 1);
	
							String memberStatus = "";
	
							if (Integer.parseInt(cancelCount) > 0 ){
								memberStatus = "<font style='color:red'>구매취소</font>";
							}else{
								if (Integer.parseInt(orderCount) > 0 ){
									memberStatus = "<font style='color:blue'>구매완료</font>";
								}else{
									if (buyYNFlag1 != "" ) {
										memberStatus = "구매불가";
									}else{
										if(memID == "" || memID == null){
											memberStatus = "가입이전";
										}else{
											memberStatus = "가입완료";
										}
									}
								}
							}
						
				 %>
					<tr>
						<td><%=listNo%></td>
						<td><%=memID%></td>
						<td><%=memberName%></td>
						<td><%=memberHP%></td>
						<td><%=mainprofID%></td> 
						<td><%=mainProfName%></td> 
						<td><%=subProfID%></td>			
						<td><%=subProfName%></td>		
						<td><%=familysitememID%></td> 
						<td><%=familysitememName%></td> 
						<td><%=siteGBName%></td> 
						<td><%=memberRegDate%></td> 
						<td><%=memberStatus%></td> 							
					</tr>
				 <%
						listNo =  listNo + 1;
						//out.println(listRSExcel.next());	
					}

					
				 %>

			</table>

			<%
				listRSExcel.close();
			%>









</body>
</html>