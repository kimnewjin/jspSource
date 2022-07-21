<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%@include file="/_common/systemFiles/incPrivateInformation.jsp"%>
<%request.setCharacterEncoding("euc-kr");%>
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

	String CountQuery = "";
	int totCnt = 0;
	int pageSize = 20;
	int pageCount = 0;

	

		CountQuery =	"	Select Count(1)	As ListCount ";
		CountQuery = CountQuery	+	"	From (		" ;
		CountQuery = CountQuery	+	"		Select mb.mem_Id, mb.m_Name, mb.m_HP, Bm.mainProfID, Bm.mainProfNAme, BM.subProfID, BM.subProfName, BM.familysiteMemID 	";
		CountQuery = CountQuery	+	"			,	bm.FamilysiteMemName, (Select tName From dbb2b.dbo.tblSoobakcb2bCode with(Nolock)  where tCode =entersiteGB) As SiteGbName	" ;
		CountQuery = CountQuery	+	"			,	isNull(mb.reg_date,'') As regDate		";
		CountQuery = CountQuery	+	"			, (	Select Count(1) From  dbSoobakc.dbo.tblOrderDetailLevel1 As A	with(Nolock) ";
		CountQuery = CountQuery	+	"					Inner Join dbB2B.dbo.tblSoobakcB2BSalesItemList  As B with(Nolock)  on A.LP_Idx = B.lp_idx	";
		CountQuery = CountQuery	+	"				Where B.isDel='N' And B.companyID='"+companyID+"'	";
		CountQuery = CountQuery	+	"					and status='1' And isRefund='0'  And userId = bm.mem_ID)	As orderCount	";
		CountQuery = CountQuery	+	"			, (	Select Count(1) From  dbSoobakc.dbo.tblOrderDetailLevel1 As A	with(Nolock) ";
		CountQuery = CountQuery	+	"					Inner Join dbB2B.dbo.tblSoobakcB2BSalesItemList  As B with(Nolock)  on A.LP_Idx = B.lp_idx	";
		CountQuery = CountQuery	+	"				Where B.isDel='N' And B.companyID='"+companyID+"'	";
		CountQuery = CountQuery	+	"					and status='2' And isRefund='1' And userId = bm.mem_ID)	As CancelCount, bm.buyYnFlag, bm.EnterSiteGb	"	;	
		CountQuery = CountQuery	+	"		From dbb2b.dbo.tblSoobakcb2bMemInfo As Bm	with(Nolock) ";
		CountQuery = CountQuery	+	"			Left Outer Join soobakc_Test.dbo.tbl_Member_basic As MB with(Nolock)  on Bm.mem_Id = Mb.mem_ID	";
		CountQuery = CountQuery	+	"		Where Bm.isDel='N'	And bm.companyID	= '"+companyID+"'	 	";
		CountQuery = CountQuery	+	"	)	As total	";
		CountQuery = CountQuery	+	"	Where 1 = 1	" + subSql ;

		
		
		
		rs = stmt.executeQuery(CountQuery);
		
		int ListCount = 0;
		if (rs.next()){
			ListCount = rs.getInt(1);
		}


		rs.close();


		if (ListCount % pageSize == 0){
			pageCount = ListCount / pageSize;
		}else{
			pageCount = ListCount / pageSize + 1;
		}	
	
	int startRowNo = ((gotoPage-1)*pageSize)+1;

	int lastRowNo = gotoPage*pageSize;
	

	ResultSet listRs;
	String listQuery = "";

	listQuery = "	Select top 100 * from (	" ;
	listQuery = listQuery +	"	Select * , row_Number() over("+sortingQuery+")	As rowNum	 From (	"	;
	listQuery = listQuery +	"		Select isNull(mb.mem_Id,'') As mem_ID , isnull(mb.m_Name,'') As m_Name, isNull(mb.m_HP,'') As m_HP	";
	listQuery = listQuery +	"			, Bm.mainProfID, Bm.mainProfName, BM.subProfID, BM.subProfName, BM.familysiteMemID 	"	;
	listQuery = listQuery +	"			,	bm.familysiteMemName, (Select tName From dbb2b.dbo.tblSoobakcb2bCode with(Nolock) where tCode =entersiteGB) As SiteGbName	" ;
	listQuery = listQuery +	"			,	isNull(mb.reg_date,'') As regDate		" ;
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
	listQuery = listQuery +	"		Where Bm.isDel='N' 	And bm.companyID	= '" + companyID + "'			";
	listQuery = listQuery +	"	)	As total	"	;
	listQuery = listQuery +	"	Where 1 = 1	"	+ subSql ; 
	listQuery = listQuery +	") as totalList		";
	listQuery = listQuery +	"Where 1 = 1	" ;
	listQuery = listQuery +	"	And rowNum between '" + startRowNo + "' and '" +lastRowNo+ "' order by rowNum ASC	";
	
	//out.println(listQuery);
	listRs = stmt.executeQuery(listQuery);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/_common/layoutFiles/incMeta.jsp"%>
</head>
<body>
<div class="container" style="padding-right:0;">
	<div id="divLNB" class="sidebar">
		<%@include file="/_common/layoutFiles/incLNB.jsp"%>
	</div>
	<div  id="divMainContainer">
		<%@include file="/_common/layoutFiles/incGNB.jsp"%>
		<div class="contentsMain">
			<!-- 검색폼 -->
			
			<form name="frmSearch" class="form-inline" role="form" method="get" >
				<input type="hidden" name="isPostback" value="0">		
				<input type="hidden" name="sortingFlag" value="<%=sortingFlag%>">		
				<table class="table table-bordered table-condensed table-form">
					<tbody>
					<tr class="hiddenTR">
						<th width="100">교사정보</th>
						<td class="aLeft" >
							<Select name="searchTeacherType" class="form-control">
								<option value=''>전체보기</option>
								<option value='total.mainProfID' <% if(searchTeacherType.equals("total.mainProfID")){ out.println("selected");}%>>담임교사ID</option>
								<option value='total.subProfID'	 <% if(searchTeacherType.equals("total.subProfID")){ out.println("selected");}	%>>추천교사ID</option>
							</Select>
							<input type="text" class="form-control" name="searchTeacherName" value="<%=searchTeacherName%>">
						</td>
					</tr>
					<tr class="hiddenTR">
						<th width="100">회원정보</th>
						<td class="aLeft" >
							<Select name="searchMemberType" class="form-control">
								<option value=''>전체보기</option>
								<option value='total.mem_ID' <% if(searchMemberType.equals("total.mem_ID")){ out.println("selected");}%>>
									수박씨닷컴 ID
								</option>
								<option value='total.m_Name' <% if(searchMemberType.equals("total.m_Name")){ out.println("selected");}%>>
									수박씨 닷컴 회원명
								</option>
								<option value='total.m_HP' <% if(searchMemberType.equals("total.m_HP")){ out.println("selected");}%>>
									수박씨닷컴 휴대폰번호
								</option>
								<option value='total.familySitememID' <% if(searchMemberType.equals("total.familySitememID")){ out.println("selected");}%>>
									와이즈캠프ID
								</option>
								<option value='total.familySitemName' <% if(searchMemberType.equals("total.familySitemName")){ out.println("selected");}%>>
									와이즈캠프 회원명
								</option>
								
							</Select>
							<input type="text" class="form-control" name="searchMemberString" value="<%=searchMemberString%>">
						</td>
					</tr>

				<tr class="hiddenTR">
						<th width="100">회원상태</th>
						<td class="aLeft" >
							<Select name="searchMemberStatus" class="form-control">
								<option value=''>전체보기</option>
								<option value='B' <% if(searchMemberStatus.equals("B")){ out.println("selected");}%>>
									가입이전
								</option>
								<option value='F' <% if(searchMemberStatus.equals("F")){ out.println("selected");}%>>
									가입완료
								</option>
								<option value='N' <% if(searchMemberStatus.equals("N")){ out.println("selected");}%>>
									구매불가
								</option>
								<option value='BV' <% if(searchMemberStatus.equals("BV")){ out.println("selected");}%>>
									구매완료
								</option>
								<option value='BC' <% if(searchMemberStatus.equals("BC")){ out.println("selected");}%>>
									구매취소
								</option>								
							</Select>
						</td>
					</tr>

					<tr class="hiddenTR">
						<th>가입경로</th>
						<td class="aLeft" >
							<Select name="searchMemberRoot" class="form-control">
								<option value=''>전체보기</option>
								<option value='0000' <% if(searchMemberRoot.equals("0000")){ out.println("selected");}%>>
									수박씨닷컴
								</option>
								<option value='1002' <% if(searchMemberRoot.equals("1002")){ out.println("selected");}%>>
									와이즈캠프
								</option>
								<option value='1003' <% if(searchMemberRoot.equals("1003")){ out.println("selected");}%>>
									100UP수학
								</option>
								<option value='1029' <% if(searchMemberRoot.equals("1029")){ out.println("selected");}%>>
									관리자등록
								</option>								
							</Select>
						</td>
					</tr>				
					<tr class="hiddenTR">
						<th>수박씨 닷컴<br/>가입일자</th>
						<td class="aLeft" >
								<div class="input-group" style="width:280px;">
									<input type="text" class="form-control jQueryCalendar" name="searchBeginDate" value="<%=searchBeginDate%>" placeholder="시작일"/>
									<span class="input-group-addon"><span class="fa fa-arrow-right"></span></span>
									<input type="text" class="form-control jQueryCalendar" name="searchEndDate" value="<%=searchEndDate%>" placeholder="종료일" />
								</div>

							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="searchAction();"><span class="fa fa-search"></span> 검색</button>
							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="location.href='index.jsp';"><span class="fa fa-list-ul"></span> 모두보기</button>
							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="javascript: goExcel();"><span class="fa fa-file-excel-o"></span> 엑셀다운</button>

						</td>
					</tr>
					</tbody>
				</table>
			</form>
			<table class="table table-bordered table-condensed table-list">
				<tr>
					<th>번호</th>
					<th><a href="#Maintable" onclick="setSortingChk('A');">수박씨ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('B');">수박씨회원명</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('C');">수박씨연락처</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('D');">담임교사ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('E');">담임교사명</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('F');">추천교사ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('G');">추천교사명</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('H');">와이즈캠프ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('I');">와이즈캠프회원명</A></th>
					<th>가입경로</th>
					<th><a href="#Maintable" onclick="setSortingChk('J');">수박씨가입일</a></th>
					<th>회원상태</th>
					<%
						// 추천수정은 수박씨 관리자만 보게끔 / 2018-12-14/ 김유진 - 마케팅 신다래CP요청 - 송민정IP 확인
						if( sessionManagerCate.equals("1030") ){
					%>
						<th>추천수정</th>
					<%
						}
					%>
				</tr>
				<%
					int listNo = ListCount;
					if (gotoPage!= 1) {
						listNo = listNo - ((gotoPage-1)*pageSize);
					}
					listNo = listNo + 1;
					//out.println(listRs.next());
					while(listRs.next()){
					//out.println(listRs.next());
						listNo = listNo - 1;
						String memID				= listRs.getString("mem_ID");						
						String memberName			= listRs.getString("m_Name");
						String memberHP				= listRs.getString("m_HP");
						String mainprofID			= listRs.getString("mainProfID");
						String mainProfName			= listRs.getString("mainProfName");
						String subProfID			= listRs.getString("subProfID");
						String subProfName			= listRs.getString("subProfName");
						String familysitememID		= listRs.getString("familysiteMemID");
						String familysitememName	= listRs.getString("familysiteMemName");
						String siteGBName			= listRs.getString("SiteGbName");
						String regDate				= listRs.getString("regDate");
						String orderCount			= listRs.getString("orderCount");
						String cancelCount			= listRs.getString("CancelCount");
						String memIdx				= listRs.getString("Idx");
						String buyYNFlag1			= listRs.getString("buyYnFlag");
						String enterSiteGB			= listRs.getString("EnterSiteGb");
						String rowNum				= listRs.getString("rowNum");

						if (memberHP == null){
							memberHP = "";
						}
						String memberHP1 = memberHP.substring(4,8);
						memberHP = memberHP.replace(memberHP1,"####");
	
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
						<td><%=memID%>[<%=rowNum%>]</td>
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
						<%
						// 추천수정은 수박씨 관리자만 보게끔 / 2018-12-14/ 김유진 - 마케팅 신다래CP요청 - 송민정IP 확인
							if( sessionManagerCate.equals("1030") ){
						%>
						<td>
							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="goMemberEdit('<%=memIdx%>');">
								<span class="fa fa-save"></span> 추천수정
							</button>
						</td>
						<%
							}
						%>
					</tr>
				 <%
						
					}

					listRs.close();
				 %>

			</table>

			<div class="center-block pagenation-block">
				<%=getPaging(pageParam , gotoPage, pageCount, thisPage)%>
				



			</div>


	

		</div>
		<%@include file="/_common/layoutFiles/incFooter.jsp"%>
	</div>
</div>
<%@include file="/_common/layoutFiles/incLastScript.jsp"%>
<script type="text/javascript">
<!--
	function goMemberEdit(memIDX){
		openPopup('popupSetMemberTeacherInfo.jsp?memIDX='+memIDX,'ps'+memIDX, 600, 300, 1);
	}
	function searchAction(){
		var frm = document.frmSearch;
		frm.action = "index.jsp";
		frm.submit();
	}

	function setSortingChk(sorting){
		$("input[name='sortingFlag']").val(sorting);
		searchAction();
	}

	function goExcel(){
		var frm = document.frmSearch;
		alert("hll");
		frm.action = "memberExcel.jsp";
		frm.submit();
	}

//-->
</script>

</body>
</html>
<%@include file="/_common/systemFiles/eof.jsp"%>
