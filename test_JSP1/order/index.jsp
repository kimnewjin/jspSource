<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%
	String pageCode = "order";
	String lnbTitle = "결제현황";
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
			<br />
			<div class="alert alert-danger " role="alert">
				<ol>
					<li>
						<button type="button" class="btn btn-sm btn-primary" onclick="window.open('http://getbootstrap.com/css/#tables');"><span class="glyphicon glyphicon-link"></span> 부트스트랩가기</button> 자세한건 <span class="glyphicon glyphicon-hand-left"></span>요기서 확인하면데~<br />css탭도 있고 컴퍼넌트도 있고 스크립트 관련된것도 있으니 여기저기 확인해바~
					</li>
					<li><button type="button" class="btn btn-sm btn-danger" onclick="window.open('http://fortawesome.github.io/Font-Awesome/icons/');"> 아이콘2 (font awesome)  *- 가능한 요기 이용 </button></li>
					<li><button type="button" class="btn btn-sm btn-primary btn-sm" onclick="window.open('http://getbootstrap.com/components/');"> 아이콘(GLYPHICONS )</button></li>
					<li>스크립트는 가능하면 젤 끝부분에 몰아 넣고~</li>
					<li>
						템플릿 링크 :
						<a href="_templateBlank.asp?pageCode=1I12I3"  class="btn btn-warning btn-sm">껍데기</a>
						<a href="_templateTable.asp?pageCode=1I12I3" class="btn btn-primary btn-sm">게시판 템플릿</a>
					</li>
					<li>그외 템플릿 :
						<a href="_templateComment.asp?pageCode=1I12I3" class="btn btn-default btn-sm">댓글 템플릿</a>
						<a href="_templateEditor.asp?pageCode=1I12I3" class="btn btn-success btn-sm">에디터 </a>
						<a href="_template.asp?pageCode=1I12I3"  class="btn btn-danger btn-sm">기본 템플릿들</a>
						<a href="_templatePopup.asp?pageCode=1I12I3" target="_blank" class="btn btn-info btn-sm">팝업</a>
						<a href="#1" target="_blank" class="btn btn-info btn-sm"  data-toggle="modal" data-target="#modalID1" title="폼이 있는 모달창을 띄울때"><span class="fa fa-share-square-o"></span> 모달창 띄우기</a>
					</li>
				</ol>
			</div><br />

			내용

		</div>
		<%@include file="/_common/layoutFiles/incFooter.jsp"%>
	</div>
</div>
<%@include file="/_common/layoutFiles/incLastScript.jsp"%>
<script type="text/javascript">
<!--

//-->
</script>

</body>
</html>
<!--#include virtual="/_common/systemFiles/eof.asp"-->