<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/_common/layoutFiles/incMeta.jsp"%>
	<Script language="javascript">
		function goAction(){
			var frm = document.theForm;
			frm.action = "https://cowork.soobakc.com/API/jspUploadTest.asp";
			frm.submit();
		}
	</Script>
 </head>
 <body>
	<form name="theForm" method="Post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>Ǫ�� ������</td>
			<td><textarea name="pushmsg" style="width:500px;height:100px;"></textarea></td>
		</tr>
		<tr>
			<td>÷������</td>
			<td><input type="file" name="attachfile" value=""></td>
		</tr>
	</table>
	</form>
	<input type="button" value="Ǫ�ð����!" onclick="goAction();">
 </body>
</html>
