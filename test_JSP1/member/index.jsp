<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%@include file="/_common/systemFiles/incPrivateInformation.jsp"%>
<%request.setCharacterEncoding("euc-kr");%>
<%
	String pageCode = "member";
	String lnbTitle = "������Ȳ";

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
			case "B" :/*��������*/
				subSql = subSql + " And total.mem_ID is null	";
			break;
			case "F" :/*���ԿϷ�*/
				subSql = subSql + "	And total.mem_ID is Not null";
				subSql = subSql	+ " And (Select Count(1) From dbB2b.dbo.ViewLectureHistorySoobakc Where mem_Id = total.Mem_Id) = 0		"	;
				subSql = subSql + "	And total.orderCount = 0 And total.CancelCount = 0	";
			break;
			case "N" :/*���źҰ�*/
				subSql = subSql + " And total.mem_ID is Not null";
				subSql = subSql + "	And total.buyYnflag = 'N'	";
				subSql = subSql + " And total.orderCount ='0'	";
			break;
			case "BV" :/*���ſϷ�*/
				subSql = subSql + " And total.orderCount > '0'	";
				subSql = subSql + " And total.CancelCount = '0'	";
			break;
			case "BC" :	/*�������*/
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
			<!-- �˻��� -->
			
			<form name="frmSearch" class="form-inline" role="form" method="get" >
				<input type="hidden" name="isPostback" value="0">		
				<input type="hidden" name="sortingFlag" value="<%=sortingFlag%>">		
				<table class="table table-bordered table-condensed table-form">
					<tbody>
					<tr class="hiddenTR">
						<th width="100">��������</th>
						<td class="aLeft" >
							<Select name="searchTeacherType" class="form-control">
								<option value=''>��ü����</option>
								<option value='total.mainProfID' <% if(searchTeacherType.equals("total.mainProfID")){ out.println("selected");}%>>���ӱ���ID</option>
								<option value='total.subProfID'	 <% if(searchTeacherType.equals("total.subProfID")){ out.println("selected");}	%>>��õ����ID</option>
							</Select>
							<input type="text" class="form-control" name="searchTeacherName" value="<%=searchTeacherName%>">
						</td>
					</tr>
					<tr class="hiddenTR">
						<th width="100">ȸ������</th>
						<td class="aLeft" >
							<Select name="searchMemberType" class="form-control">
								<option value=''>��ü����</option>
								<option value='total.mem_ID' <% if(searchMemberType.equals("total.mem_ID")){ out.println("selected");}%>>
									���ھ����� ID
								</option>
								<option value='total.m_Name' <% if(searchMemberType.equals("total.m_Name")){ out.println("selected");}%>>
									���ھ� ���� ȸ����
								</option>
								<option value='total.m_HP' <% if(searchMemberType.equals("total.m_HP")){ out.println("selected");}%>>
									���ھ����� �޴�����ȣ
								</option>
								<option value='total.familySitememID' <% if(searchMemberType.equals("total.familySitememID")){ out.println("selected");}%>>
									������ķ��ID
								</option>
								<option value='total.familySitemName' <% if(searchMemberType.equals("total.familySitemName")){ out.println("selected");}%>>
									������ķ�� ȸ����
								</option>
								
							</Select>
							<input type="text" class="form-control" name="searchMemberString" value="<%=searchMemberString%>">
						</td>
					</tr>

				<tr class="hiddenTR">
						<th width="100">ȸ������</th>
						<td class="aLeft" >
							<Select name="searchMemberStatus" class="form-control">
								<option value=''>��ü����</option>
								<option value='B' <% if(searchMemberStatus.equals("B")){ out.println("selected");}%>>
									��������
								</option>
								<option value='F' <% if(searchMemberStatus.equals("F")){ out.println("selected");}%>>
									���ԿϷ�
								</option>
								<option value='N' <% if(searchMemberStatus.equals("N")){ out.println("selected");}%>>
									���źҰ�
								</option>
								<option value='BV' <% if(searchMemberStatus.equals("BV")){ out.println("selected");}%>>
									���ſϷ�
								</option>
								<option value='BC' <% if(searchMemberStatus.equals("BC")){ out.println("selected");}%>>
									�������
								</option>								
							</Select>
						</td>
					</tr>

					<tr class="hiddenTR">
						<th>���԰��</th>
						<td class="aLeft" >
							<Select name="searchMemberRoot" class="form-control">
								<option value=''>��ü����</option>
								<option value='0000' <% if(searchMemberRoot.equals("0000")){ out.println("selected");}%>>
									���ھ�����
								</option>
								<option value='1002' <% if(searchMemberRoot.equals("1002")){ out.println("selected");}%>>
									������ķ��
								</option>
								<option value='1003' <% if(searchMemberRoot.equals("1003")){ out.println("selected");}%>>
									100UP����
								</option>
								<option value='1029' <% if(searchMemberRoot.equals("1029")){ out.println("selected");}%>>
									�����ڵ��
								</option>								
							</Select>
						</td>
					</tr>				
					<tr class="hiddenTR">
						<th>���ھ� ����<br/>��������</th>
						<td class="aLeft" >
								<div class="input-group" style="width:280px;">
									<input type="text" class="form-control jQueryCalendar" name="searchBeginDate" value="<%=searchBeginDate%>" placeholder="������"/>
									<span class="input-group-addon"><span class="fa fa-arrow-right"></span></span>
									<input type="text" class="form-control jQueryCalendar" name="searchEndDate" value="<%=searchEndDate%>" placeholder="������" />
								</div>

							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="searchAction();"><span class="fa fa-search"></span> �˻�</button>
							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="location.href='index.jsp';"><span class="fa fa-list-ul"></span> ��κ���</button>
							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="javascript: goExcel();"><span class="fa fa-file-excel-o"></span> �����ٿ�</button>

						</td>
					</tr>
					</tbody>
				</table>
			</form>
			<table class="table table-bordered table-condensed table-list">
				<tr>
					<th>��ȣ</th>
					<th><a href="#Maintable" onclick="setSortingChk('A');">���ھ�ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('B');">���ھ�ȸ����</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('C');">���ھ�����ó</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('D');">���ӱ���ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('E');">���ӱ����</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('F');">��õ����ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('G');">��õ�����</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('H');">������ķ��ID</a></th>
					<th><a href="#Maintable" onclick="setSortingChk('I');">������ķ��ȸ����</A></th>
					<th>���԰��</th>
					<th><a href="#Maintable" onclick="setSortingChk('J');">���ھ�������</a></th>
					<th>ȸ������</th>
					<%
						// ��õ������ ���ھ� �����ڸ� ���Բ� / 2018-12-14/ ������ - ������ �Ŵٷ�CP��û - �۹���IP Ȯ��
						if( sessionManagerCate.equals("1030") ){
					%>
						<th>��õ����</th>
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
								memberStatus = "<font style='color:red'>�������</font>";
							}else{
								if (Integer.parseInt(orderCount) > 0 ){
									memberStatus = "<font style='color:blue'>���ſϷ�</font>";
								}else{
									if (buyYNFlag1 != "" ) {
										memberStatus = "���źҰ�";
									}else{
										if(memID == "" || memID == null){
											memberStatus = "��������";
										}else{
											memberStatus = "���ԿϷ�";
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
						// ��õ������ ���ھ� �����ڸ� ���Բ� / 2018-12-14/ ������ - ������ �Ŵٷ�CP��û - �۹���IP Ȯ��
							if( sessionManagerCate.equals("1030") ){
						%>
						<td>
							<button type="button" class="btn btn-primary"  style="display:inline;" onclick="goMemberEdit('<%=memIdx%>');">
								<span class="fa fa-save"></span> ��õ����
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
