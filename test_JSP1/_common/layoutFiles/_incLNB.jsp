<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<!-- <div class="vLine "  style="width:100%;"> -->
	<!-- lnb : ���� -->
	<!-- <div class=" " style="width:100%;"> -->
		<div style="height:73px;">
			<a class="navbar-brand" href="#" ><img src="/images/soobakcLogo.gif" height="50" style="float:left; margin-left:20px;" /></a>
		</div>

		<nav class="nav nav-pills nav-stacked vLine">

			<div class="list-group" style="margin:0;padding:0;">

				<a href="#none" class="list-group-item "  id="lnbTitle">					
					<span class="menu-text"> <%=lnbTitle%> </span>
					<i  class="fa fa-exchange waves-effect waves-circle"
								style="background: #ff6400;color:#fff;float:right;font-size:12px;margin-right:5px;" onclick="toggleLNB();" title="ȭ��ũ��"></i>
				</a>





				
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem178');"><i class="fa fa-plus"></i> ���°���</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem178">
									<li>- <a href="/productManage/lecture/cc/lecturelist.asp?pageCode=4I39I178" >�ߵ� ���°���</a></li>
							
									<li>- <a href="/productManage/lecture/cc/productlist.asp?pageCode=4I39I179" >�ߵ� ��ǰ����</a></li>
									
									<li>- <a href="/productManage/lecture/cc/packagelist.asp?pageCode=4I39I180" >�ߵ� ��Ű������</a></li>
									
									<li>- <a href="/productManage/lecture/cc/unitlist.asp?pageCode=4I39I181" >�ܿ��� ��ǰ ����</a></li>
									
									<li>- <a href="/productManage/lecture/cc/textbooklist.asp?pageCode=4I39I182" >�������� ����</a></li>
									
									<li>- <a href="/productManage/lecture/cc/lectureUploadStatus.asp?pageCode=4I39I691" >���� ���ε� ��Ȳ</a></li>
									
									<li>- <a href="/productManage/lecture/setIntroLIDX/index.asp?pageCode=4I39I858" >���Ǻ���Ʈ�ΰ���</a></li>
									
									<li>- <a href="/productManage/lecture/teachingPlan/index.asp?pageCode=4I39I871" >���Ⱦ��ε���Ȳ</a></li>
									
									<li>- <a href="���м�?pageCode=4I39I183" >____________________________</a></li>
									
									<li>- <a href="/productManage/lecture/reality/choicePack.asp?pageCode=4I39I184" >������ ��Ű�� ���� �ܰ���</a></li>
									
									<li>- <a href="/productManage/lecture/theMuhan/list.asp?pageCode=4I39I185" >���Ѽ��� ����</a></li>
									
									<li>- <a href="/productManage/lecture/cc/myselfsavelist.asp?pageCode=4I39I186" >�ߵ� �������SAVE</a></li>
									
									<li>- <a href="/productmanage/lecture/reality/pfPayList.asp?pageCode=4I39I187" >�������� ���ⵥ����2(��)</a></li>
									
									<li>- <a href="/productmanage/lecture/reality/pfPayListnewCheck.asp?pageCode=4I39I188" >�������� ���ⵥ����3(��)</a></li>
									
									<li>- <a href="���м�?pageCode=4I39I189" >____________________________</a></li>
									
									<li>- <a href="/productManage/lecture/reality/todaymovieStatus.asp?pageCode=4I39I190" >�Ϻ�����������Ȳ</a></li>
									
									<li>- <a href="/productManage/lecture/reality/shootinglist.asp?pageCode=4I39I191" >�������� �Կ����(�ߵ�)</a></li>
									
									<li>- <a href="/productManage/lecture/reality/shootingsearch.asp?pageCode=4I39I192" >���� �Կ� ��Ȳ ��ȸ(�ߵ�)</a></li>
									
									<li>- <a href="/productManage/lecture/setup/freeviewmovelist.asp?pageCode=4I39I193" >�����䵿����</a></li>
									
									<li>- <a href="/productManage/lecture/reality/valuelistadm.asp?pageCode=4I39I194" >������ ����(�ߵ�)</a></li>
									
									<li>- <a href="/productManage/lecture/reality/questionlist.asp?pageCode=4I39I195" >�н�QnA ����</a></li>
									
									<li>- <a href="/productManage/lecture/reality/satisfactiontableView.asp?pageCode=4I39I197" >��������������</a></li>
									
									<li>- <a href="/productManage/examManage/chpterTestManage/list.asp?pageCode=4I39I198" >�ܿ��� ����</a></li>
									
									<li>- <a href="/productManage/examManage/ChapterTestChangeTool/List.asp?pageCode=4I39I199" >�򰡹��׺������</a></li>
									
									<li>- <a href="/productManage/examManage/jinDanTestManage/list.asp?pageCode=4I39I201" >�����򰡽���������</a></li>
									
									<li>- <a href="/productManage/examManage/mySelfTestPlanManage/list.asp?pageCode=4I39I202" >��������׽�Ʈ_��������</a></li>
									
									<li>- <a href="/productManage/lecture/setup/promotioncouponlist.asp?pageCode=4I39I205" >���θ�� �������ް���</a></li>
									
									<li>- <a href="/productManage/lecture/setup/promotionBonusCashList.asp?pageCode=4I39I805" >���θ�� ���ʽ�ĳ������</a></li>
									
									<li>- <a href="/productManage/lecture/reality/smartcourselist.asp?pageCode=4I39I206" >����Ʈ���͵� ��������</a></li>
									
									<li>- <a href="/productManage/lecture/setup/defaultChar.asp?pageCode=4I39I207" >�б⼳�� ����</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem209');"><i class="fa fa-plus"></i> ����ǰ����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem209">
									<li>- <a href="/productManage/giftItem/giftItemList.asp?pageCode=4I40I209" >����ǰ���</a></li>
							
									<li>- <a href="/productManage/giftItem/encryptList.asp?pageCode=4I40I799" >����ǰ ������ ��������</a></li>
									
									<li>- <a href="/productManage/giftItem/eachEncryptList.asp?pageCode=4I40I824" >���� ����ǰ ������ ��������</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem210');"><i class="fa fa-plus"></i> ���ܰ˻� ����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem210">
									<li>- <a href="/productManage/tdtp/product/list.asp?pageCode=4I41I210" >��ǰ����</a></li>
							
									<li>- <a href="/productManage/tdtp/product/testFreeIssue.asp?pageCode=4I41I211" >��ǰ����߱�</a></li>
									
									<li>- <a href="/productManage/tdtp/self/tdtpList.asp?pageCode=4I41I212" >�ڱ��ֵ� �н��˻� ������Ȳ</a></li>
									
									<li>- <a href="/productManage/tdtp/status/tdtpList.asp?pageCode=4I41I213" >���� 5% ���ܰ˻� ������Ȳ</a></li>
									
									<li>- <a href="/productManage/tdtp/report/studentViewReport.asp?tseq=1&pageCode=4I41I214" >�н����� ���ܰ˻� ������Ȳ</a></li>
									
									<li>- <a href="/productManage/tdtp/report/studentViewReport.asp?tseq=2&pageCode=4I41I215" >�л����� ���ܰ˻� ������Ȳ</a></li>
									
									<li>- <a href="/productManage/tdtp/report/studentViewReport.asp?tseq=3&pageCode=4I41I216" >�θ��� ���ܰ˻� ������Ȳ</a></li>
									
									<li>- <a href="/productManage/tdtp/career/list.asp?pageCode=4I41I217" >���μ��� ���ܰ˻� ������Ȳ</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem218');"><i class="fa fa-plus"></i> ���޻�ǰ����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem218">
									<li>- <a href="/productManage/lecture/cc/productListB2B.asp?pageCode=4I42I218" >��ǰ����</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem220');"><i class="fa fa-plus"></i> ����������</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem220">
									<li>- <a href="/productManage/book/lectureTextBookManage/list.asp?pageCode=4I43I220" >�������� ����</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem703');"><i class="fa fa-plus"></i> ��������������</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem703">
									<li>- <a href="/productManage/lecture/cc/assessmentList.asp?pageCode=4I165I703" >������ ���� ����</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem221');"><i class="fa fa-plus"></i> ���������� ����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem221">
									<li>- <a href="/productManage/lecture/reality/satisfactiontableView.asp?pageCode=4I44I221" >���������� ����</a></li>
							
									<li>- <a href="/productManage/lecture/reality/satisfactionNew.asp?pageCode=4I44I686" >���������� ���� (�����)</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem765');"><i class="fa fa-plus"></i> ���豸�źм�</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem765">
									<li>- <a href="/productManage/lecture/dataLink/linkUserPaymentsView.asp?pageCode=4I199I765" >���豸�źм�</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem229');"><i class="fa fa-plus"></i> ����������</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem229">
									<li>- <a href="/productManage/jinroConsulting/report.asp?pageCode=4I46I229" >���������ø���Ʈ �̿���Ȳ</a></li>
							
									<li>- <a href="/productManage/jinroConsulting/camp.asp?pageCode=4I46I856" >���ο¶���ķ��(�Ϲ�)</a></li>
									
									<li>- <a href="/productManage/jinroConsulting/orderList4Story.asp?pageCode=4I46I857" >�Ѹ𵨽��丮 ������Ȳ</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem233');"><i class="fa fa-plus"></i> �ܽ���Ʈ����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem233">
									<li>- <a href="/productManage/book/SamsNoteManage/MainSchedule/List.asp?pageCode=4I47I233" >�׷캰�����Է�</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem234');"><i class="fa fa-plus"></i> ü�� ���°��� (369, 100�ð�)</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem234">
									<li>- <a href="/productManage/100Time/hotKeywordList.asp?pageCode=4I48I234" >HOT�˻��� ����</a></li>
							
									<li>- <a href="/productManage/100Time/packInfo/info.asp?pageCode=4I48I235" >ü�� ��ǰ ����</a></li>
									
									<li>- <a href="/productManage/100Time/lectureManage.asp?pageCode=4I48I237" >ü�谭�� ���� ����</a></li>
									
									<li>- <a href="/productManage/100Time/LectureBestInfo.asp?pageCode=4I48I687" >ü�� ��õ���¼���</a></li>
									
									<li>- <a href="/productManage/100Time/LecturePopular.asp?pageCode=4I48I688" >����! ���ھ����� ����</a></li>
									
									<li>- <a href="/productManage/100Time/freezoneInfoList.asp?pageCode=4I48I705" >ü��Ϸ� ��������</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem240');"><i class="fa fa-plus"></i> ���а��丶����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem240">
									<li>- <a href="/productManage/lecture/mathConcept/program/list.asp?pageCode=4I50I240" >���α׷� ����</a></li>
							
									<li>- <a href="/productManage/lecture/mathConcept/member/list.asp?pageCode=4I50I241" >��ûȸ�� ����</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem242');"><i class="fa fa-plus"></i> ��</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem242">
									<li>- <a href="/productManage/examManage/levelTest/List.asp?pageCode=4I51I242" >�����׽�Ʈ</a></li>
							
									<li>- <a href="/productManage/examManage/trialTest/_trialTestTurnList.asp?pageCode=4I51I702" >���ǰ��</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item selected" onclick="toggleLNBSub(this, 'lnbSubItem822');"><i class="fa fa-minus"></i> �۰��ǰ���</a>
								

								<ul class="list-group-item" style="display:;list-style:none;" id="lnbSubItem822">
									<li>- <a href="/productManage/pickupIndex/typeofBook.asp?pageCode=4I168I822" class="selItem">�۰��ǰ���</a></li>
							
									<li>- <a href="/productManage/QokLecture/weeklyManage/bestPickList.asp?pageCode=4I168I725" >BEST�۰��ǰ���</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item "><i class="fa fa-asterisk"></i> --- ����Ʈ���׽��� ---</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem593">
									<li>- <a href="���?pageCode=4I140I593" >�ߺз�</a></li>
							
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem594');"><i class="fa fa-plus"></i> ���α׷�����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem594">
									<li>- <a href="/productManage/selfLeader/Program/list.asp?pageCode=4I141I594" >���α׷�����</a></li>
							
									<li>- <a href="/productManage/selfLeader/Program/conquest_list.asp?pageCode=4I141I629" >�����غ��ݿ����α׷�</a></li>
									
									<li>- <a href="/productManage/selfLeader/IntroManage/Index.asp?pageCode=4I141I630" >�Ұ�����������</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem595');"><i class="fa fa-plus"></i> ��ǰ����</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem595">
									<li>- <a href="/productManage/selfLeader/Product/productManage/list.asp?pageCode=4I142I595" >��ǰ����</a></li>
							
									<li>- <a href="/productManage/selfLeader/Product/BookManage/List.asp?pageCode=4I142I631" >���α׷�����������</a></li>
									
									<li>- <a href="/productManage/selfLeader/Product/GoodSentence/List.asp?pageCode=4I142I632" >�Ӵ������</a></li>
									
								</ul>
								
								<a href="#none" class="list-group-item " onclick="toggleLNBSub(this, 'lnbSubItem596');"><i class="fa fa-plus"></i> ������Ȳ</a>
								

								<ul class="list-group-item" style="display:none;list-style:none;" id="lnbSubItem596">
									<li>- <a href="/productManage/selfLeader/Report/Research/list.asp?pageCode=4I143I596" >����������Ȳ����</a></li>
							
									<li>- <a href="/productManage/selfLeader/Report/ResearchPay/list.asp?pageCode=4I143I633" >����������Ȳ����(����)</a></li>
									
									<li>- <a href="/productManage/selfLeader/Report/JoinerList/List.asp?pageCode=4I143I634" >���α׷��̿���Ȳ</a></li>
									
									<li>- <a href="/productManage/selfLeader/Report/eleJoinerList/list.asp?pageCode=4I143I758" >�ʵ�_���ΰ�ȹ������Ȳ</a></li>
									
							</ul>
					
			</div>
		</nav>
	<!-- </div> -->
	<!-- /lnb : �� -->
<!-- </div> -->