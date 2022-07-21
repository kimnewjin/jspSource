<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/_common/layoutFiles/incMeta.jsp"%>
	
	<style type="text/css">
		body{
			height:100%;
		}
		.container{
			/*border:1px solid;*/
			margin: 10% 12% 10% 12%;
			width:auto;
			height:100%;
		}
		.titleImg{
			/*border:1px solid;*/
			height:auto;
			vertical-align:middle;
			margin: 1% 1% 1% 1%;
			padding: 1% 1% 1% 1%;
		}
		.loginArea{
			/*border:1px solid;*/
			border-radius:10px;
			margin: 0 1% 1% 1%;
			padding: 3% 3% 3% 12%;
			background-color:#79ABFF;
			position:relative;
		}
		.innerLoginArea{
			/*border:1px solid;*/
			position:relative;
			width:45%;
			display:inline-block;
			vertical-align:middle;
		}

		.loginArea0{
			background-color:#79ABFF;
			padding: 3% 10% 10% 3%;
			border-radius:15px;
		}

		.loginArea1{
			background-color:#A0BAED;
			border:4px solid;
			border-color:#5586EB;
			padding: 1% 5% 5% 5%;
			border-radius:15px;
			vertical-align:middle;
		}

		.departTitle{
			/*border:1px solid;*/
			color:white;
			font-size:3em;
		}
		.departTitle1{
			/*border:1px solid;*/
			position:relative;
			display:block;
			color:white;
			padding-top:5%;
			font-size:5em;
			font-weight:bold;
		}

		.loginAreaText{
			/*border:1px solid;*/
			font-weight:bold;
			font-size:1.5em;
		}
		#loginForm{
			/*border:1px solid;*/
			margin :3% 3% 3% 3%;
			padding:4% 2% 2% 2%;
			display:inline-block;
		}
	</style>
	<script language="javascript">
		$(document).ready(function(){
			$(".form-control").keypress(function(){

				var keyCode = event.keyCode;
				if (keyCode == "13"){
					$("button").click();
				}
			});

			$("button").click(function(){
				var frm = document.theForm;

				var userID = $("input[name='userID']").val();
				var passWD = $("input[name='passWD']").val();
				var managerCate = $("input[name='managerCate']").is(":checked");

				if (managerCate == false){
					alert('관리자 범주를 선택하세요.');
					$("input[name='managerCate']").eq(0).focus();
					return;
				}


				if (userID == ""){
					alert('아이디를 입력하세요');
					$("input[name='userID']").focus();
					return;
				}
				if (passWD == ""){
					alert('비밀번호를 입력하세요');
					$("input[name='passWD']").focus();
					return;
				}

				
				frm.action = "/login/loginAction.jsp";
				frm.submit();
			});


		});
	</script>
</head>

<body>
	<div id="wrapper" class="container">
		<div class="titleImg">
			<img src="/images/logo.gif" alt="">
			<img src="/images/top_text.gif" alt="" style="float:right;height:15px;">
		</div>
		<div id="loginArea" class="loginArea">
			<div class="innerLoginArea loginArea0">
				<span class="departTitle">
					와이즈캠프
				</span>
				<span class="departTitle1">
					LOGIN
				</span>
			</div>
			<div class="innerLoginArea loginArea1" >
				<div id="loginForm">
					<form name="theForm" method="post">
						<input type="radio" name="managerCate" value="1000"> <label style="color:white;">관리자</label>&nbsp;					
						<input type="radio" name="managerCate" value="1001"> <label style="color:white;">관리교사</label>&nbsp;					
						<input type="radio" name="managerCate" value="1030"> <label style="color:white;">수박씨관리자</label>
					  <label for="inputPassword" class="sr-only">아이디</label>
					  <input type="text" id="userID" name="userID" class="form-control" placeholder="아이디를 입력하세요" value="">
					  <label for="inputPassword" class="sr-only">비밀번호</label>
					  <input type="password" name="passWD" id="inputPassword" class="form-control" placeholder="비밀번호를 입력하세요">
					   <br/><br/>
					
						<button class="btn btn-lg btn-primary btn-block" type="button">
						 <span class="fa fa-key"></span>&nbsp;로&nbsp;그&nbsp;인
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>

