<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%
	String pageCode = "order";
	String lnbTitle = "������Ȳ";
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
						<button type="button" class="btn btn-sm btn-primary" onclick="window.open('http://getbootstrap.com/css/#tables');"><span class="glyphicon glyphicon-link"></span> ��Ʈ��Ʈ������</button> �ڼ��Ѱ� <span class="glyphicon glyphicon-hand-left"></span>��⼭ Ȯ���ϸ鵥~<br />css�ǵ� �ְ� ���۳�Ʈ�� �ְ� ��ũ��Ʈ ���õȰ͵� ������ �������� Ȯ���ع�~
					</li>
					<li><button type="button" class="btn btn-sm btn-danger" onclick="window.open('http://fortawesome.github.io/Font-Awesome/icons/');"> ������2 (font awesome)  *- ������ ��� �̿� </button></li>
					<li><button type="button" class="btn btn-sm btn-primary btn-sm" onclick="window.open('http://getbootstrap.com/components/');"> ������(GLYPHICONS )</button></li>
					<li>��ũ��Ʈ�� �����ϸ� �� ���κп� ���� �ְ�~</li>
					<li>
						���ø� ��ũ :
						<a href="_templateBlank.asp?pageCode=1I12I3"  class="btn btn-warning btn-sm">������</a>
						<a href="_templateTable.asp?pageCode=1I12I3" class="btn btn-primary btn-sm">�Խ��� ���ø�</a>
					</li>
					<li>�׿� ���ø� :
						<a href="_templateComment.asp?pageCode=1I12I3" class="btn btn-default btn-sm">��� ���ø�</a>
						<a href="_templateEditor.asp?pageCode=1I12I3" class="btn btn-success btn-sm">������ </a>
						<a href="_template.asp?pageCode=1I12I3"  class="btn btn-danger btn-sm">�⺻ ���ø���</a>
						<a href="_templatePopup.asp?pageCode=1I12I3" target="_blank" class="btn btn-info btn-sm">�˾�</a>
						<a href="#1" target="_blank" class="btn btn-info btn-sm"  data-toggle="modal" data-target="#modalID1" title="���� �ִ� ���â�� ��ﶧ"><span class="fa fa-share-square-o"></span> ���â ����</a>
					</li>
				</ol>
			</div><br />

			����

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