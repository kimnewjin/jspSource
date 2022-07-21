<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<!-- <div class="vLine "  style="width:100%;"> -->
	<!-- lnb : 시작 -->
	<!-- <div class=" " style="width:100%;"> -->
		<div style="height:73px;">
			<a class="navbar-brand" href="#" ><img src="/images/soobakcLogo.gif" height="50" style="float:left; margin-left:20px;" /></a>
		</div>

		<nav class="nav nav-pills nav-stacked vLine">

			<div class="list-group" style="margin:0;padding:0;">

				<a href="#none" class="list-group-item "  id="lnbTitle">					
					<span class="menu-text"> <%=lnbTitle%> </span>
					<i  class="fa fa-exchange waves-effect waves-circle"
								style="background: #ff6400;color:#fff;float:right;font-size:12px;margin-right:5px;" onclick="toggleLNB();" title="화면크기"></i>
				</a>





				
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem178');"><i class="fa fa-plus"></i> 강좌관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem178">
									<li>- <a href="/productManage/lecture/cc/lecturelist.asp?pageCode=4I39I178" >중등 강좌관리</a></li>
							
									<li>- <a href="/productManage/lecture/cc/productlist.asp?pageCode=4I39I179" >중등 상품관리</a></li>
									
									<li>- <a href="/productManage/lecture/cc/packagelist.asp?pageCode=4I39I180" >중등 패키지관리</a></li>
									
									<li>- <a href="/productManage/lecture/cc/unitlist.asp?pageCode=4I39I181" >단원별 상품 관리</a></li>
									
									<li>- <a href="/productManage/lecture/cc/textbooklist.asp?pageCode=4I39I182" >교과서명 관리</a></li>
									
									<li>- <a href="/productManage/lecture/cc/lectureUploadStatus.asp?pageCode=4I39I691" >강의 업로드 현황</a></li>
									
									<li>- <a href="/productManage/lecture/setIntroLIDX/index.asp?pageCode=4I39I858" >강의별인트로관리</a></li>
									
									<li>- <a href="/productManage/lecture/teachingPlan/index.asp?pageCode=4I39I871" >교안업로드현황</a></li>
									
									<li>- <a href="구분선?pageCode=4I39I183" >____________________________</a></li>
									
									<li>- <a href="/productManage/lecture/reality/choicePack.asp?pageCode=4I39I184" >선택형 패키지 구매 단강좌</a></li>
									
									<li>- <a href="/productManage/lecture/theMuhan/list.asp?pageCode=4I39I185" >무한수강 관리</a></li>
									
									<li>- <a href="/productManage/lecture/cc/myselfsavelist.asp?pageCode=4I39I186" >중등 내맘대로SAVE</a></li>
									
									<li>- <a href="/productmanage/lecture/reality/pfPayList.asp?pageCode=4I39I187" >컨기전용 매출데이터2(신)</a></li>
									
									<li>- <a href="/productmanage/lecture/reality/pfPayListnewCheck.asp?pageCode=4I39I188" >컨기전용 매출데이터3(신)</a></li>
									
									<li>- <a href="구분선?pageCode=4I39I189" >____________________________</a></li>
									
									<li>- <a href="/productManage/lecture/reality/todaymovieStatus.asp?pageCode=4I39I190" >일별강의제작현황</a></li>
									
									<li>- <a href="/productManage/lecture/reality/shootinglist.asp?pageCode=4I39I191" >제작전용 촬영기록(중등)</a></li>
									
									<li>- <a href="/productManage/lecture/reality/shootingsearch.asp?pageCode=4I39I192" >강의 촬영 현황 조회(중등)</a></li>
									
									<li>- <a href="/productManage/lecture/setup/freeviewmovelist.asp?pageCode=4I39I193" >프리뷰동영상</a></li>
									
									<li>- <a href="/productManage/lecture/reality/valuelistadm.asp?pageCode=4I39I194" >수강평 관리(중등)</a></li>
									
									<li>- <a href="/productManage/lecture/reality/questionlist.asp?pageCode=4I39I195" >학습QnA 관리</a></li>
									
									<li>- <a href="/productManage/lecture/reality/satisfactiontableView.asp?pageCode=4I39I197" >수강만족도조사</a></li>
									
									<li>- <a href="/productManage/examManage/chpterTestManage/list.asp?pageCode=4I39I198" >단원평가 관리</a></li>
									
									<li>- <a href="/productManage/examManage/ChapterTestChangeTool/List.asp?pageCode=4I39I199" >평가문항변경관리</a></li>
									
									<li>- <a href="/productManage/examManage/jinDanTestManage/list.asp?pageCode=4I39I201" >진단평가시험지관리</a></li>
									
									<li>- <a href="/productManage/examManage/mySelfTestPlanManage/list.asp?pageCode=4I39I202" >내맘대로테스트_일정관리</a></li>
									
									<li>- <a href="/productManage/lecture/setup/promotioncouponlist.asp?pageCode=4I39I205" >프로모션 쿠폰지급관리</a></li>
									
									<li>- <a href="/productManage/lecture/setup/promotionBonusCashList.asp?pageCode=4I39I805" >프로모션 보너스캐쉬관리</a></li>
									
									<li>- <a href="/productManage/lecture/reality/smartcourselist.asp?pageCode=4I39I206" >스마트스터디 과정관리</a></li>
									
									<li>- <a href="/productManage/lecture/setup/defaultChar.asp?pageCode=4I39I207" >학기설정 관리</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem209');"><i class="fa fa-plus"></i> 사은품관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem209">
									<li>- <a href="/productManage/giftItem/giftItemList.asp?pageCode=4I40I209" >사은품목록</a></li>
							
									<li>- <a href="/productManage/giftItem/encryptList.asp?pageCode=4I40I799" >사은품 지급자 정보수집</a></li>
									
									<li>- <a href="/productManage/giftItem/eachEncryptList.asp?pageCode=4I40I824" >개별 사은품 지급자 정보수집</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem210');"><i class="fa fa-plus"></i> 진단검사 관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem210">
									<li>- <a href="/productManage/tdtp/product/list.asp?pageCode=4I41I210" >상품관리</a></li>
							
									<li>- <a href="/productManage/tdtp/product/testFreeIssue.asp?pageCode=4I41I211" >상품무료발급</a></li>
									
									<li>- <a href="/productManage/tdtp/self/tdtpList.asp?pageCode=4I41I212" >자기주도 학습검사 참여현황</a></li>
									
									<li>- <a href="/productManage/tdtp/status/tdtpList.asp?pageCode=4I41I213" >상위 5% 진단검사 참여현황</a></li>
									
									<li>- <a href="/productManage/tdtp/report/studentViewReport.asp?tseq=1&pageCode=4I41I214" >학습성향 진단검사 참여현황</a></li>
									
									<li>- <a href="/productManage/tdtp/report/studentViewReport.asp?tseq=2&pageCode=4I41I215" >학생성향 진단검사 참여현황</a></li>
									
									<li>- <a href="/productManage/tdtp/report/studentViewReport.asp?tseq=3&pageCode=4I41I216" >부모성향 진단검사 참여현황</a></li>
									
									<li>- <a href="/productManage/tdtp/career/list.asp?pageCode=4I41I217" >진로성향 진단검사 참여현황</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem218');"><i class="fa fa-plus"></i> 제휴상품관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem218">
									<li>- <a href="/productManage/lecture/cc/productListB2B.asp?pageCode=4I42I218" >상품관리</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem220');"><i class="fa fa-plus"></i> 교과서관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem220">
									<li>- <a href="/productManage/book/lectureTextBookManage/list.asp?pageCode=4I43I220" >교과서명 관리</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem703');"><i class="fa fa-plus"></i> 수행평가유형관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem703">
									<li>- <a href="/productManage/lecture/cc/assessmentList.asp?pageCode=4I165I703" >수행평가 유형 관리</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem221');"><i class="fa fa-plus"></i> 수강만족도 조사</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem221">
									<li>- <a href="/productManage/lecture/reality/satisfactiontableView.asp?pageCode=4I44I221" >수강만족도 조사</a></li>
							
									<li>- <a href="/productManage/lecture/reality/satisfactionNew.asp?pageCode=4I44I686" >수강만족도 조사 (컨기용)</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem765');"><i class="fa fa-plus"></i> 연계구매분석</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem765">
									<li>- <a href="/productManage/lecture/dataLink/linkUserPaymentsView.asp?pageCode=4I199I765" >연계구매분석</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem229');"><i class="fa fa-plus"></i> 진로컨설팅</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem229">
									<li>- <a href="/productManage/jinroConsulting/report.asp?pageCode=4I46I229" >진로컨설팅리포트 이용현황</a></li>
							
									<li>- <a href="/productManage/jinroConsulting/camp.asp?pageCode=4I46I856" >진로온라인캠프(일반)</a></li>
									
									<li>- <a href="/productManage/jinroConsulting/orderList4Story.asp?pageCode=4I46I857" >롤모델스토리 구매현황</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem233');"><i class="fa fa-plus"></i> 쌤스노트관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem233">
									<li>- <a href="/productManage/book/SamsNoteManage/MainSchedule/List.asp?pageCode=4I47I233" >그룹별정보입력</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem234');"><i class="fa fa-plus"></i> 체험 강좌관리 (369, 100시간)</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem234">
									<li>- <a href="/productManage/100Time/hotKeywordList.asp?pageCode=4I48I234" >HOT검색어 관리</a></li>
							
									<li>- <a href="/productManage/100Time/packInfo/info.asp?pageCode=4I48I235" >체험 상품 관리</a></li>
									
									<li>- <a href="/productManage/100Time/lectureManage.asp?pageCode=4I48I237" >체험강좌 설정 관리</a></li>
									
									<li>- <a href="/productManage/100Time/LectureBestInfo.asp?pageCode=4I48I687" >체험 추천강좌설정</a></li>
									
									<li>- <a href="/productManage/100Time/LecturePopular.asp?pageCode=4I48I688" >강추! 수박씨강좌 설정</a></li>
									
									<li>- <a href="/productManage/100Time/freezoneInfoList.asp?pageCode=4I48I705" >체험완료 선물관리</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem240');"><i class="fa fa-plus"></i> 수학개념마스터</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem240">
									<li>- <a href="/productManage/lecture/mathConcept/program/list.asp?pageCode=4I50I240" >프로그램 관리</a></li>
							
									<li>- <a href="/productManage/lecture/mathConcept/member/list.asp?pageCode=4I50I241" >신청회원 관리</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem242');"><i class="fa fa-plus"></i> 평가</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem242">
									<li>- <a href="/productManage/examManage/levelTest/List.asp?pageCode=4I51I242" >레벨테스트</a></li>
							
									<li>- <a href="/productManage/examManage/trialTest/_trialTestTurnList.asp?pageCode=4I51I702" >모의고사</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item selected" onclick="toggleLNBSub(this, 'lnbSubItem822');"><i class="fa fa-minus"></i> 콕강의관리</a>
								

								<ul class="list-group-item" style="display:;list-style:none;" id="lnbSubItem822">
									<li>- <a href="/productManage/pickupIndex/typeofBook.asp?pageCode=4I168I822" class="selItem">콕강의관리</a></li>
							
									<li>- <a href="/productManage/QokLecture/weeklyManage/bestPickList.asp?pageCode=4I168I725" >BEST콕강의관리</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item "><i class="fa fa-asterisk"></i> --- 스마트러닝스쿨 ---</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem593">
									<li>- <a href="경로?pageCode=4I140I593" >중분류</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem594');"><i class="fa fa-plus"></i> 프로그램관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem594">
									<li>- <a href="/productManage/selfLeader/Program/list.asp?pageCode=4I141I594" >프로그램관리</a></li>
							
									<li>- <a href="/productManage/selfLeader/Program/conquest_list.asp?pageCode=4I141I629" >약점극복반영프로그램</a></li>
									
									<li>- <a href="/productManage/selfLeader/IntroManage/Index.asp?pageCode=4I141I630" >소개페이지관리</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem595');"><i class="fa fa-plus"></i> 상품관리</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem595">
									<li>- <a href="/productManage/selfLeader/Product/productManage/list.asp?pageCode=4I142I595" >상품관리</a></li>
							
									<li>- <a href="/productManage/selfLeader/Product/BookManage/List.asp?pageCode=4I142I631" >프로그램별도서관리</a></li>
									
									<li>- <a href="/productManage/selfLeader/Product/GoodSentence/List.asp?pageCode=4I142I632" >속담명언관리</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem596');"><i class="fa fa-plus"></i> 참여현황</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem596">
									<li>- <a href="/productManage/selfLeader/Report/Research/list.asp?pageCode=4I143I596" >설문조사현황보기</a></li>
							
									<li>- <a href="/productManage/selfLeader/Report/ResearchPay/list.asp?pageCode=4I143I633" >설문조사현황보기(결재)</a></li>
									
									<li>- <a href="/productManage/selfLeader/Report/JoinerList/List.asp?pageCode=4I143I634" >프로그램이용현황</a></li>
									
									<li>- <a href="/productManage/selfLeader/Report/eleJoinerList/list.asp?pageCode=4I143I758" >초등_공부계획참여현황</a></li>
									
							</ul>
					
			</div>
		</nav>
	<!-- </div> -->
	<!-- /lnb : 끝 -->
<!-- </div> -->