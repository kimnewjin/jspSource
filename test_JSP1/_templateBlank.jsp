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

				<!-- 검색폼 -->
			* 검색폼
		<form name="frmSearch" class="form-inline" role="form" method="get" >
			<input type="hidden" name="isPostback" value="0">		
			<table class="table table-bordered table-condensed table-form">
				<tbody>
				<tr class="hiddenTR">
					<th width="100">대상</th>
					<td class="aLeft" >
						<label class="radio-inline"><input type="radio" name="siteType" value=""  checked> 전체</label>
						<label class="radio-inline"><input type="radio" name="siteType" value="M" > 수박씨</label>
						<label class="radio-inline"><input type="radio" name="siteType" value="E" > i수박씨</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th width="100">코드가져오기</th>
					<td class="aLeft" >
						-- getCodeValueList(ByVal refCode, ByVal selectedValue , ByVal inputType, ByVal inputName)<br />
						-- refCode는 기준코드/ selectedValue는 선택된값/ inputType는 select, checkbox, radio중하나 / inputName는 radio나 checkbox에서 name값(이름)<br />
						<select name="l_item" onchange="xhrGetTeacherList('l_t_mem_id', document.theForm.l_gb.value, this.value, '');" class="form-control input-sm" style="width:100px;">
							
						</select>
					</td>
				</tr>

				<tr class="hiddenTR">
					<th width="100">코드가져오기</th>
					<td class="aLeft" >
						-- getCodeValueList(ByVal refCode, ByVal selectedValue , ByVal inputType, ByVal inputName)<br />
						-- refCode는 기준코드/ selectedValue는 선택된값/ inputType는 select, checkbox, radio중하나 / inputName는 radio나 checkbox에서 name값(이름)<br />
						
					</td>
				</tr>

				<tr class="hiddenTR">
					<th>결제 방법</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="checkAll" value="" onclick="toggleCheckbox(this.checked, 'payType', '특정폼이름이 필요할때');//setAllCheck(this, 'payType');"> 전체</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="CARD"	> 신용카드</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="VBANK"	> 가상계좌</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="DBANK"	> 계좌이체</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="ARS"		> ARS</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="HPP"		> 핸드폰</label>
						<label class="checkbox-inline"><input type="checkbox" name="payType" value="SCASH"	> 충전캐쉬사용</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>할인수단</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="checkAll" onclick="toggleCheckbox(this.checked, 'discountType'); //setAllCheck(this, 'discountType');" > 전체</label>
						<label class="checkbox-inline"><input type="checkbox" name="discountType" value="POINT" > 포인트</label>
						<label class="checkbox-inline"><input type="checkbox" name="discountType" value="COUPON" > 쿠폰</label>
						<label class="checkbox-inline"><input type="checkbox" name="discountType" value="BCASH" > 보너스캐쉬</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>결제현황</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="checkAll" onclick="toggleCheckbox(this.checked, 'payStatus'); //setAllCheck(this, 'payStatus');"> 전체</label>
						<label class="checkbox-inline"><input type="checkbox" name="payStatus" value="0" > 결제대기</label>
						<label class="checkbox-inline"><input type="checkbox" name="payStatus" value="1" > 결제완료</label>
						<label class="checkbox-inline"><input type="checkbox" name="payStatus" value="2" > 주문취소</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>배송현황</th>
					<td class="aLeft" >
						<label class="checkbox-inline"><input type="checkbox" name="check" onclick="toggleCheckbox(this.checked, 'deliveryStatus'); //setAllCheck(this, 'deliveryStatus');"> 전체</label>
						<label class="checkbox-inline"><input type="checkbox" name="deliveryStatus" value="0" > 배송준비</label>
						<label class="checkbox-inline"><input type="checkbox" name="deliveryStatus" value="1" > 배송중</label>
						<label class="checkbox-inline"><input type="checkbox" name="deliveryStatus" value="2" > 배송완료</label>
					</td>
				</tr>
				<tr class="hiddenTR">
					<th>날짜</th>
					<td class="aLeft" >
						<select name="searchDate"  class="form-control input-sm "  style="width:200px;">
							<option value="authDate" >입금완료/주문취소일</option>
							<option value="regDate" >상품주문일</option>
						</select>
						<!-- <div class="form-group" style="width:300px;"> form 클래스가 form-inline이면 폼그룹으로 묶어도 가로로 나온다. -->
							<div class="input-group input-group-sm" style="width:180px;">
								<input type="text" class="form-control jQueryCalendar" name="beginDate" value="" placeholder="시작일" value="" />
								<span class="input-group-addon"><span class="fa fa-arrow-right"></span></span>
								<input type="text" class="form-control jQueryCalendar" name="endDate" value="" placeholder="종료일" value="" />
							</div>
						<!-- </div> -->
					</td>
				</tr>
				<tr>
					<th>버튼그룹1</th>
					<td class="aLeft">
						<div class="input-group input-group-sm pull-left" style="width:240px;">
							<input type="text" class="form-control"  name="BookdisCount" value=""  placeholder="정상가" >
							<span class="input-group-addon"><i class="fa fa-asterisk"></i></span>
							<input type="text" class="form-control"  name="BookdisCount" value=""  placeholder="할인율" >
							<span class="input-group-addon" style="font-weight:bold;">=</span>
							<input type="text" class="form-control"  name="BookdisCount" value=""  placeholder="실판매가" >
						</div> 정상가*할일율=할인가(실판매가)
					</td>
				</tr>
				<tr>
					<th>버튼그룹2</th>
					<td class="aLeft">

						<div class="input-group input-group-sm " style="width:140px;">
							<span class="input-group-addon">정상가</span>
							<input type="text" class="form-control"  name="BookdisCountP" value=""  placeholder="금액입력" >
							<span class="input-group-addon">원</span>
						</div>
						<span class="fa fa-asterisk"></span>
						<div class="input-group input-group-sm " style="width:140px;">
							<span class="input-group-addon">할인율</span>
							<input type="text" class="form-control"  name="BookdisCountP" value=""  placeholder="할인율입력" >
							<span class="input-group-addon">%</span>
						</div>

						<button type="button" class="btn btn-primary btn-sm" onclick="discount();">할인율적용 <span class="fa fa-arrow-right"></span></button>

						<div class="input-group input-group-sm" style="width:140px;">
							<span class="input-group-addon">할인가</span>
							<input type="text" name="BookRealPrice" value="" class="form-control input-sm" placeholder="실제판매금액" style="text-align:right;border:1px solid red;" ReadOnly>
							<span class="input-group-addon">원</span>
						</div>

					</td>
				</tr>
				<tr>
					<th width="100">검색 [<a href="#none" onclick="javascript:$('.hiddenTR').toggle('fast');">상세</a>]</th>
					<td class="aLeft" >
						<select name="pageSize" class="form-control input-sm" style="width:100px;">
							<option value="20" selected>20건씩</option>
							<option value="30" >30건씩</option>
							<option value="50" >50건씩</option>
						</select>
						<select name="searchType" class="form-control input-sm" style="width:100px;">
							<option value="ord.orderID" >주문번호</option>
							<option value="mem.m_name" >이름</option>
							<option value="ord.userID" >아이디</option>
						</select>
						<input type="text" name="searchString" class="form-control input-sm "  value="" style="width:200px;vetical-align:bottom;">

						<button type="button" class="btn btn-primary btn-sm"  style="display:inline;" onclick="searchAction();"><span class="fa fa-search"></span> 검색</button>
						<button type="button" class="btn btn-primary btn-sm"  style="display:inline;" onclick="location.href='?';"><span class="fa fa-list-ul"></span> 모두보기</button>

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