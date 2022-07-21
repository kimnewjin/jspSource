<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/_common/layoutFiles/incMeta.jsp"%>
	<Script language="javascript">
		function goAction(){
			var frm = document.theForm;
			var msg = frm.pushmsg.value;

			if (msg == ""){
				alert('푸시메시지를 입력하세요.');
				frm.pushmsg.focus();
				return;
			}
			frm.action = "pushAction.jsp";
			frm.submit();
		}

		function goPlayer(){


			$.ajax({    
				type : 'get',   // get , post
				url : 'pushAction.jsp',
				//async : false,
				data : {title : 'TTT', msg :"TT1"},//{받을변수명 : 던질데이터},
				dataType : 'json', // html, xml 등등 데이터 형태
				success : function(tval){
					alert(tval);
				},
				error:function(request,status,error){
				alert(request+"|"+status+"|"+error);
				return;
				},
				complete:function(){     
				}
			});
		}
	</Script>
 </head>
 <body>
	<form name="theForm" method="Post">
	<table border="1">
		<tr>
			<td>푸시 보내기</td>
			<td><textarea name="pushmsg" style="width:500px;height:100px;"></textarea></td>
		</tr>
	</table>
	</form>
	<input type="button" value="푸시가즈아!" onclick="goAction();">
 </body>
</html>
