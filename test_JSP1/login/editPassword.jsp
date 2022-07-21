<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@include file="/_common/systemFiles/config.jsp"%>
<%@include file="/_common/systemFiles/incPrivateInformation.jsp"%>
<%request.setCharacterEncoding("euc-kr");%>
<%
	//2019-09-16 / ������

	if (sessionMemberName == "" || sessionMemberID == ""){
		out.println("<Script language='javascript'>");
		out.println("	alert('������ ����Ǿ����ϴ�.');	");
		out.println("	window.close();	");
		out.println("</Script>");
		return;		
	}	

	String Query = "";
	String	memberPWD = "";
	Query = "	Select Top 1 m_PWD From dbB2B.dbo.tblSoobakcB2BMadnager with(Nolock)	";
	Query = Query + " Where mem_ID = '"+sessionMemberID+"' And companyID='"+companyID+"'	";

	rs		= stmt.executeQuery(Query);

	if (!rs.next()){
		out.println("<Script language='javascript'>");
		out.println("	alert('������ ��ȿ���� �ʽ��ϴ�.');	");
		out.println("	window.close();	");
		out.println("</Script>");
		return;		
	}else{		
		memberPWD		=	rs.getString(1);	
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
				<input type="text" name="hiddenPassword" value="<%=memberPWD%>">
				<table class="table table-condensed ">	
					<caption> �� <%=sessionMemberName%>���� ��й�ȣ ���� ����</caption>
					<tbody>
					<tr >
						<th style="width:120px;">���� ��й�ȣ</th>
						<td>
							<input type="text" class="form-control" name="oldPassword" value="" placeholder="���� ��й�ȣ �Է�">
						</td>
					</tr>
					<tr >
						<th>���ο� ��й�ȣ</th>
						<td>
							<input type="text" class="form-control" name="newPassword" value="" placeholder="���ο� ��й�ȣ �Է�">
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
					<button type="button" class="btn btn-primary" onclick="goAction();"><span class="fa fa-save"></span> �����ϱ�</button>
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