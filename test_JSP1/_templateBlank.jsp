<%@ page language="java" contentType="text/html; charset=euc-kr"%>
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

				<!-- �˻��� -->
			* �˻���
		<form name="frmSearch" class="form-inline" role="form" method="get" >
			<input type="hidden" name="isPostback" value="0">		
			<table class="table table-bordered table-condensed table-form">
				<tbody>
				<tr class="hiddenTR">
					<th width="100">���</th>
					<td class="aLeft" >
						<label class="radio-inline"><input type="radio" name="siteType" value=""  checked> ��ü</label>
						<label class="radio-inline"><input type="radio" name="siteType" value="M" > ���ھ�</label>
						<label class="radio-inline"><input type="radio" name="siteType" value="E" > i���ھ�</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th width="100">�ڵ尡������</th>
					<td class="aLeft" >
						-- getCodeValueList(ByVal refCode, ByVal selectedValue , ByVal inputType, ByVal inputName)<br />
						-- refCode�� �����ڵ�/ selectedValue�� ���õȰ�/ inputType�� select, checkbox, radio���ϳ� / inputName�� radio�� checkbox���� name��(�̸�)<br />
						<select name="l_item" onchange="xhrGetTeacherList('l_t_mem_id', document.theForm.l_gb.value, this.value, '');" class="form-control input-sm" style="width:100px;">
							
						</select>
					</td>
				</tr>

				<tr class="hiddenTR">
					<th width="100">�ڵ尡������</th>
					<td class="aLeft" >
						-- getCodeValueList(ByVal refCode, ByVal selectedValue , ByVal inputType, ByVal inputName)<br />
						-- refCode�� �����ڵ�/ selectedValue�� ���õȰ�/ inputType�� select, checkbox, radio���ϳ� / inputName�� radio�� checkbox���� name��(�̸�)<br />
						
					</td>
				</tr>

				<tr class="hiddenTR">
					<th>���� ���</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="checkAll" value="" onclick="toggleCheckbox(this.checked, 'payType', 'Ư�����̸��� �ʿ��Ҷ�');//setAllCheck(this, 'payType');"> ��ü</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="CARD"	> �ſ�ī��</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="VBANK"	> �������</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="DBANK"	> ������ü</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="ARS"		> ARS</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="HPP"		> �ڵ���</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="SCASH"	> ����ĳ�����</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>���μ���</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="checkAll" onclick="toggleCheckbox(this.checked, 'discountType'); //setAllCheck(this, 'discountType');" > ��ü</label>
						<label class="checkbox-inline"><input type="checkbox" name="discountType" value="POINT" > ����Ʈ</label>
						<label class="checkbox-inline"><input type="checkbox" name="discountType" value="COUPON" > ����</label>
						<label class="checkbox-inline"><input type="checkbox" name="discountType" value="BCASH" > ���ʽ�ĳ��</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>������Ȳ</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="checkAll" onclick="toggleCheckbox(this.checked, 'payStatus'); //setAllCheck(this, 'payStatus');"> ��ü</label>
						<label class="checkbox-inline"><input type="checkbox" name="payStatus" value="0" > �������</label>
						<label class="checkbox-inline"><input type="checkbox" name="payStatus" value="1" > �����Ϸ�</label>
						<label class="checkbox-inline"><input type="checkbox" name="payStatus" value="2" > �ֹ����</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>�����Ȳ</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="check" onclick="toggleCheckbox(this.checked, 'deliveryStatus'); //setAllCheck(this, 'deliveryStatus');"> ��ü</label>
						<label class="checkbox-inline"><input type="checkbox" name="deliveryStatus" value="0" > ����غ�</label>
						<label class="checkbox-inline"><input type="checkbox" name="deliveryStatus" value="1" > �����</label>
						<label class="checkbox-inline"><input type="checkbox" name="deliveryStatus" value="2" > ��ۿϷ�</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>��¥</th>
					<td class="aLeft" >
						<select name="searchDate"  class="form-control input-sm "  style="width:200px;">
							<option value="authDate" >�ԱݿϷ�/�ֹ������</option>
							<option value="regDate" >��ǰ�ֹ���</option>
						</select>
						<!-- <div class="form-group" style="width:300px;"> form Ŭ������ form-inline�̸� ���׷����� ��� ���η� ���´�. -->
							<div class="input-group input-group-sm" style="width:180px;">
								<input type="text" class="form-control jQueryCalendar" name="beginDate" value="" placeholder="������" value="" />
								<span class="input-group-addon"><span class="fa fa-arrow-right"></span></span>
								<input type="text" class="form-control jQueryCalendar" name="endDate" value="" placeholder="������" value="" />
							</div>
						<!-- </div> -->
					</td>
				</tr>
				<tr>
					<th>��ư�׷�1</th>
					<td class="aLeft">
						<div class="input-group input-group-sm pull-left" style="width:240px;">
							<input type="text" class="form-control"  name="BookdisCount" value=""  placeholder="����" >
							<span class="input-group-addon"><i class="fa fa-asterisk"></i></span>
							<input type="text" class="form-control"  name="BookdisCount" value=""  placeholder="������" >
							<span class="input-group-addon" style="font-weight:bold;">=</span>
							<input type="text" class="form-control"  name="BookdisCount" value=""  placeholder="���ǸŰ�" >
						</div> ����*������=���ΰ�(���ǸŰ�)
					</td>
				</tr>
				<tr>
					<th>��ư�׷�2</th>
					<td class="aLeft">

						<div class="input-group input-group-sm " style="width:140px;">
							<span class="input-group-addon">����</span>
							<input type="text" class="form-control"  name="BookdisCountP" value=""  placeholder="�ݾ��Է�" >
							<span class="input-group-addon">��</span>
						</div>
						<span class="fa fa-asterisk"></span>
						<div class="input-group input-group-sm " style="width:140px;">
							<span class="input-group-addon">������</span>
							<input type="text" class="form-control"  name="BookdisCountP" value=""  placeholder="�������Է�" >
							<span class="input-group-addon">%</span>
						</div>

						<button type="button" class="btn btn-primary btn-sm" onclick="discount();">���������� <span class="fa fa-arrow-right"></span></button>

						<div class="input-group input-group-sm" style="width:140px;">
							<span class="input-group-addon">���ΰ�</span>
							<input type="text" name="BookRealPrice" value="" class="form-control input-sm" placeholder="�����Ǹűݾ�" style="text-align:right;border:1px solid red;" ReadOnly>
							<span class="input-group-addon">��</span>
						</div>

					</td>
				</tr>
				<tr>
					<th width="100">�˻� [<a href="#none" onclick="javascript:$('.hiddenTR').toggle('fast');">��</a>]</th>
					<td class="aLeft" >
						<select name="pageSize" class="form-control input-sm" style="width:100px;">
							<option value="20" selected>20�Ǿ�</option>
							<option value="30" >30�Ǿ�</option>
							<option value="50" >50�Ǿ�</option>
						</select>
						<select name="searchType" class="form-control input-sm" style="width:100px;">
							<option value="ord.orderID" >�ֹ���ȣ</option>
							<option value="mem.m_name" >�̸�</option>
							<option value="ord.userID" >���̵�</option>
						</select>
						<input type="text" name="searchString" class="form-control input-sm "  value="" style="width:200px;vetical-align:bottom;">

						<button type="button" class="btn btn-primary btn-sm"  style="display:inline;" onclick="searchAction();"><span class="fa fa-search"></span> �˻�</button>
						<button type="button" class="btn btn-primary btn-sm"  style="display:inline;" onclick="location.href='?';"><span class="fa fa-list-ul"></span> ��κ���</button>

					</td>
				</tr>
				</tbody>
			</table>
			</form>


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