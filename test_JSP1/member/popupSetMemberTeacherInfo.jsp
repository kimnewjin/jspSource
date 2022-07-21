<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%
	String memIDX = request.getParameter("memIDX");

	if(memIDX == "" || memIDX == null){
		out.println("<Script language='javascript'>");
		out.println("	alert('접근방식이 올바르지 않습니다.');	");
		out.println("	window.close();	");
		out.println("</Script>");
		return;		
	}

	String Query ;
	String familySiteMemName;
	String subProfID;
	String subProfName;

	Query	= "	Select familySiteMemName, subProfID, subProfName	";
	Query	=	Query + "	From dbB2B.dbo.tblSoobakcB2BMemInfo with(Nolock)	";
	Query	=	Query +	"	Where IDX = '"+memIDX+"'	";

	rs		= stmt.executeQuery(Query);

	if (!rs.next()){
		out.println("<Script language='javascript'>");
		out.println("	alert('정보가 올바르지 않습니다.');	");
		out.println("	window.close();	");
		out.println("</Script>");
		return;		
	}else{		
		familySiteMemName	=	rs.getString(1);
		subProfID			=	rs.getString(2);
		subProfName			=	rs.getString(3);
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/_common/layoutFiles/incMeta.jsp"%>
	<style>
		.form-control {width:auto !important;}
	</style>
	<Script language="javascript">
		function goAction(){
			var frm = document.theForm;
			var subProfID		= $("input[name='subProfID']").val();
			if (subProfID == ""){
				alert('ID를 입력하세요.');
				$("input[name='subProfID']").focus();
				return;
			}
			var subProfName		= $("input[name='subProfName']").val();

			if (subProfName == ""){
				alert('이름을 입력하세요.');
				$("input[name='subProfName']").focus();
				return;
			}

			frm.action = "ActionTeacherInfo.jsp";
			frm.submit();
		}

		function goClose(){
			window.close();
			opener.location.reload();
		}
	</Script>
</head>

<body>
<div class="container-fluid" style="margin:10px;">
	<div class="row ">
		<div class="col-md-12 col-lg-12" id="divMain" >
		<!-- content : 시작 -->
	
			<!-- 쓰기폼 -->
			<form class="form-inline" role="form" style="display:inline;" name="theForm" method="post">
				<input type="hidden" name="memIDX" value="<%=memIDX%>">
				<table class="table table-condensed ">	
					<caption> □ <%=familySiteMemName%>님의 추천교사 정보 변경</caption>
					<tbody>
					<tr >
						<th>ID</th>
						<td>
							<input type="text" class="form-control input-sm " name="subProfID" value="<%=subProfID%>" placeholder="ID입력">
						</td>
					</tr>
					<tr >
						<th>이름</th>
						<td>
							<input type="text" class="form-control input-sm " name="subProfName" value="<%=subProfName%>" placeholder="이름입력">
						</td>
					</tr>
				
					</tbody>
				</table>
			</form>
			<div class="center-block">
				<div class="btn-group pull-left" role="group" aria-label="게시판버튼" style="margin:0.7em 1em;">
					<button type="button" class="btn btn-default" onclick="goClose();"><span class="fa fa-close"></span>닫기</button>					
				</div>
				<div class="btn-group pull-right" role="group" aria-label="게시판버튼" style="margin:0.7em 1em;">
					<button type="button" class="btn btn-primary" onclick="goAction();"><span class="fa fa-save"></span> 저장</button>
				</div>
			</div>


			<br /><br /><br />









		<!-- //content : 끝 -->
		</div>
	</div>




</div>

<%@include file="/_common/layoutFiles/incLastScript.jsp"%>

<script type="text/javascript">
<!--

//-->
</script>

</body>
</html>
<%@include file="/_common/systemFiles/eof.jsp"%>