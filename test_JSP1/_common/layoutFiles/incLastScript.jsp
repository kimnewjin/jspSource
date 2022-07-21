<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<script src="/_library/jquery/jQueryUI/jquery-ui.min.js"></script>
<script src="/_library/bootstrap/js/bootstrap.min.js"></script>


<!-- Bootflat's JS files.-->
<!-- <script src="/_library/bootflat/js/icheck.min.js"></script>
<script src="/_library/bootflat/js/jquery.fs.selecter.min.js"></script>
<script src="/_library/bootflat/js/jquery.fs.stepper.min.js"></script> -->

<!-- wave -->
<!-- <script type="text/javascript" src="/_library/buttonWave/dist/waves.js"></script>
<script type="text/javascript">
	Waves.displayEffect();
</script> -->



<script src="/_common/js/common.js"></script>


<!-- toastr -->
<script type="text/javascript" src="/_library/toastr/toastr.min.js"></script>
<script type="text/javascript">
<!--
	// Display an info toast with no title
	toastr.options = {
	  "closeButton": true,
	  "debug": false,
	  "progressBar": true,
	  "positionClass": "toast-bottom-right",
	  "onclick": null,
	  "showDuration": "300",
	  "hideDuration": "1000",
	  "timeOut": "5000",
	  "extendedTimeOut": "1000",
	  "showEasing": "swing",
	  "hideEasing": "linear",
	  "showMethod": "fadeIn",
	  "hideMethod": "fadeOut"
	}



	//툴팁활성화white-space: nowrap;

	$('.tooltips').tooltip({container: 'body', html:'ture' , placement: 'auto right', track: 'true'});


	//-- 체크박스 전체선택해제 toggleCheckbox(선택값, 해당필드, 특정폼이름)
	function toggleCheckbox(trueFlag, checkName, formName)
	{
		if (formName != '' && typeof(formName) != 'undefined')
		{
			$("form[name="+formName+"]  input[name="+checkName+"]").each(function( i ) {
				if(this.disabled != true) {
					this.checked=trueFlag;
				}
			});
		}
		else
		{
			$("input[name="+checkName+"]").each(function( i ) {
				if(this.disabled != true) {
					this.checked=trueFlag;
				}
			});
		}
	}

	//기본달력
	$( ".jQueryCalendar, .jqueryCalendar, .jquerycalendar" ).datepicker({
		showButtonPanel: true,
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',

		//애니
		showAnim:'slideDown'
	});
	$( ".jQueryCalendar" ).attr('autocomplete', 'off');


	//처음으로 버튼
	/*$('body').append('<div id="toTop" ><span class="fa fa-arrow-up fa-2x"></span> top</div>');

	$("#toTop").bind("click", function () {
		$("body, html").animate({ 'scrollTop': 0 }, 200);
	});

	$(window).scroll(function () {
		if ($(this).scrollTop() != 0) {
			if($('#toTop').offset().top + 10 < $('body').height())	{
				$('#toTop').fadeIn();
			} else {
				$('#toTop').fadeOut();
			}
		} else {
			$('#toTop').fadeOut();
		}
	});*/



	//lnb토글
	function toggleLNB()
	{
		if($('#btnLnbToggle').css('display') == 'none')
		{
			$('#divMainContainer').css('padding-left', '1px');
			$('#divLNB').css({ 'position':'absolute', 'top':'2px', 'display':'none', 'z-index':'1000' });
			$('#btnLnbToggle').css( {'display':'block'} );
		}
		else
		{
			$('#divMainContainer').css('padding-left', '200px');
			$('#divLNB').css({ 'position':'absolute', 'top':'0', 'display':'block', 'z-index':'2000' });
			$('#btnLnbToggle').css( {'display':'none'} );
		}

		/*if($('#divLNB').css('display') != 'none')
		{
			$('#divLNB').toggle(300);
			$('#divMain').animate({width:'1300px'},300);
		}
		else
		{
			$('#divMain').animate({width:'1090px'},300);
			$('#divLNB').toggle(300);
		}*/
	}



	//lnbSubmenuToggle
	function toggleLNBSub(objSelItem, selSubItem)
	{
		var $ojSelSubItem = $(objSelItem).find('i');

		if($ojSelSubItem.hasClass("fa-plus"))
		{
			$ojSelSubItem.removeClass( 'fa-plus' );
			$ojSelSubItem.addClass( 'fa-minus' );
		}
		else
		{
			$ojSelSubItem.removeClass( 'fa-minus' );
			$ojSelSubItem.addClass( 'fa-plus' );
		}

		$('#'+selSubItem).slideToggle('fast', function() {
			//lnb 세로사이즈조정

			//lnb사이즈조정
			resizingLNB();
		});
	}


	//lnb사이즈조정
	function resizingLNB()
	{
		if($('.list-group').height() <= $('#divMainContainer').height()+30 )
		{
			if( $('#divMainContainer').height() <= $(window).height() )
			{
				$('.vLine').height($(window).height()+20);
			}
			else
			{
				$('.vLine').height($('#divMainContainer').height()+20);
			}
		}
		else
		{
			if( $('.list-group').height() <= $(window).height() )
			{
				$('.vLine').height($(window).height()+20);
			}
			else
			{
				$('.vLine').height($('.list-group').height()+20);
			}
		}

		/*위에는 쓸데없이코퀄이지만 체크
		if($('.contentsMain').height() < $(window).height() )
			$('.vLine').height($(window).height());
		else
			$('.vLine').height($('.contentsMain').height()+30);
		*/
	}
	resizingLNB();






	//디비에 펑션이름이 들어있어서 호환용으로 생성
	function MM_openBrWindow(url, name, opt)
	{
		alert('openPopup사용해야함');
		return;
		//window.open(url,name,opt);
	}



	//로그아웃
	function logout()
	{
		if(confirm('로그아웃 하시겠습니까?'))
		{
			location.href='/auth/logout.asp';
		}
	}

	//화면확장쿠키처리
	function toggleExpand()
	{
		if(getCookie('isExpanded')=='1')
		{
			setCookie('isExpanded', '0', 365);

			$('#divLNB').css('left','auto');
			$('.container-fluid').toggleClass('container');
			$('.container-fluid').toggleClass('container-fluid');
			$('.fa-compress').toggleClass('fa-expand');
			$('.fa-compress').toggleClass('fa-compress');
		}
		else
		{
			setCookie('isExpanded', '1', 365);

			$('.container').toggleClass('container-fluid');
			$('.container').toggleClass('container');
			$('.fa-expand').toggleClass('fa-compress');
			$('.fa-expand').toggleClass('fa-expand');
		}

	}





	//날짜관련jquery확장
	$.extend({
				//=====================================================================================
				// 두 날짜간의 차이
				// dateType : w : 주 , d : 일, h : 시, n : 분, s : 초
				//=====================================================================================
				getDateDiff: function(dateType, toDate, fromDate){
					var dateType = dateType.toLowerCase();
					var fromDate = fromDate == null ? $.getToday(1) : fromDate;
					var splitFromDate = fromDate.split("-");
					var splitToDate = toDate.split("-");
					var divideNum = { w: 604800000, d: 86400000, h: 3600000, n: 60000, s: 1000 };
					var dateGap;


					fromDate = Date.UTC(splitFromDate[0], parseInt(splitFromDate[1], 10) + 1, splitFromDate[2]);
					toDate = Date.UTC(splitToDate[0], parseInt(splitToDate[1], 10) + 1, splitToDate[2]);

					dateGap = Math.floor((toDate - fromDate) / divideNum[dateType]);

					return dateGap;
				},
				//=====================================================================================
				// 오늘 날짜
				//=====================================================================================
				getToday: function(dateType){
					var today = new Date();

					switch (dateType){
						case 1 :
							today = today.getFullYear() + "-" + $.addZero(today.getMonth() + 1) + "-" + $.addZero(today.getDate());
							break;
						case 2 :
							today = today.getFullYear() + $.addZero(today.getMonth() + 1) + $.addZero(today.getDate());
							break;
					}

					return today;
				},
				//=====================================================================================
				// 10 이하 숫자 앞에 0 삽입
				//=====================================================================================
				addZero: function(number){
					return parseInt(number, 10) < 10 ? "0" + number : number;
				}
			});



	// 강사 아이디 목록 가져오기 : 파라메타(강사목록셀박ID, 초/중고, 과목코드, 자동선택할강사아이디) / 2015-11-17 / 박범일
	function xhrGetTeacherList(teacherFormID, schoolType, subjectCode, selectedCode)
	{
		if (typeof(selectedCode)=='undefined') {
			selectedCode='';
		}

		var serialize = 'schoolType='+schoolType+'&subjectCode='+subjectCode+'&selectedCode='+selectedCode;
		var xhr = $.ajax({
								url: "/_common/module/xhrGetTeacherList.asp",
								type: "get",
								dataType: "html",
								data: serialize,
								success : function (msg) {
									//처리완료
									document.getElementById(teacherFormID).innerHTML=msg;//xhr.responseText;
								},
								error : function(xhr, txtStatus) {
									alert('강사목록 재생 중 오류가 발생하였습니다.\n오류:'+xhr.responseText);
								}
							});
	}














	function saveDownloadLog(adminID, desc, ipAddress, url, callBackFn) {
		if (confirm('엑셀 다운로드시 이용내역이 기록에 추가됩니다.\n다운로드 받으시겠습니까?'))
		{
			var serialize = 'adminID='+adminID+'&desc='+escape(desc)+'&ipAddress='+ipAddress+'&url='+encodeURI(url);
			var xhr = $.ajax({
									url: '/_common/systemFiles/xhrSetDownloadRequest.asp', /*파일명 바뀐거 맞죠? xhrSetExcelDownloadLog.asp*/
									type: 'POST',
									headers: {'Content-Type': 'application/x-www-form-urlencoded'},
									dataType: 'html',
									data: serialize,
									success : function (msg) {
										 if(typeof callBackFn === 'function') {
											  callBackFn(1);
										 }
									},
									error : function(xhr, txtStatus) {
										alert('오류가 발생하였습니다.\n오류:'+xhr.responseText);
									}
								});
		}
	}

//-->
</script>





<script type="text/javascript">
	//-- 세션유지용
	function getSessionInfo() {
		$.ajax({
					url: "/auth/xhrRefresh.asp",
					type: "get",
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
					dataType: "html",
					data: '',
					success : function (msg) {

						if (document.getElementById('sessionInfo')){
							//처리완료
							document.getElementById('sessionInfo').innerHTML=msg; //xhr.responseText;
							setTimeout(getSessionInfo, 10000);
						}


					},
					error : function(rtn, txtStatus) {
						//아무처리안하도록 변경 alert('세션 리프레시 중 iis풀이 재시작 되었습니다.\n오류:'+txtStatus+' / ' + rtn.responseText);
					}
				});
	}

	$(document).ready(function(){
		getSessionInfo();
	});




</script>