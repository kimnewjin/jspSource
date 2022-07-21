<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%
	String memIDX = request.getParameter("memIDX");

	if(memIDX == "" || memIDX == null){
		out.println("<Script language='javascript'>");
		out.println("	alert('���ٹ���� �ùٸ��� �ʽ��ϴ�.');	");
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
		out.println("	alert('������ �ùٸ��� �ʽ��ϴ�.');	");
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
				alert('ID�� �Է��ϼ���.');
				$("input[name='subProfID']").focus();
				return;
			}
			var subProfName		= $("input[name='subProfName']").val();

			if (subProfName == ""){
				alert('�̸��� �Է��ϼ���.');
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
		<!-- content : ���� -->
	
			<!-- ������ -->
			<form class="form-inline" role="form" style="display:inline;" name="theForm" method="post">
				<input type="hidden" name="memIDX" value="<%=memIDX%>">
				<table class="table table-condensed ">	
					<caption> �� <%=familySiteMemName%>���� ��õ���� ���� ����</caption>
					<tbody>
					<tr >
						<th>ID</th>
						<td>
							<input type="text" class="form-control input-sm " name="subProfID" value="<%=subProfID%>" placeholder="ID�Է�">
						</td>
					</tr>
					<tr >
						<th>�̸�</th>
						<td>
							<input type="text" class="form-control input-sm " name="subProfName" value="<%=subProfName%>" placeholder="�̸��Է�">
						</td>
					</tr>
				
					</tbody>
				</table>
			</form>
			<div class="center-block">
				<div class="btn-group pull-left" role="group" aria-label="�Խ��ǹ�ư" style="margin:0.7em 1em;">
					<button type="button" class="btn btn-default" onclick="goClose();"><span class="fa fa-close"></span>�ݱ�</button>					
				</div>
				<div class="btn-group pull-right" role="group" aria-label="�Խ��ǹ�ư" style="margin:0.7em 1em;">
					<button type="button" class="btn btn-primary" onclick="goAction();"><span class="fa fa-save"></span> ����</button>
				</div>
			</div>


			<br /><br /><br />









		<!-- //content : �� -->
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