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



	//����Ȱ��ȭwhite-space: nowrap;

	$('.tooltips').tooltip({container: 'body', html:'ture' , placement: 'auto right', track: 'true'});


	//-- üũ�ڽ� ��ü�������� toggleCheckbox(���ð�, �ش��ʵ�, Ư�����̸�)
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

	//�⺻�޷�
	$( ".jQueryCalendar, .jqueryCalendar, .jquerycalendar" ).datepicker({
		showButtonPanel: true,
		changeMonth: true,
		changeYear: true,
		dateFormat: 'yy-mm-dd',

		//�ִ�
		showAnim:'slideDown'
	});
	$( ".jQueryCalendar" ).attr('autocomplete', 'off');


	//ó������ ��ư
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



	//lnb���
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
			//lnb ���λ���������

			//lnb����������
			resizingLNB();
		});
	}


	//lnb����������
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

		/*������ ������������������ üũ
		if($('.contentsMain').height() < $(window).height() )
			$('.vLine').height($(window).height());
		else
			$('.vLine').height($('.contentsMain').height()+30);
		*/
	}
	resizingLNB();






	//��� ����̸��� ����־ ȣȯ������ ����
	function MM_openBrWindow(url, name, opt)
	{
		alert('openPopup����ؾ���');
		return;
		//window.open(url,name,opt);
	}



	//�α׾ƿ�
	function logout()
	{
		if(confirm('�α׾ƿ� �Ͻðڽ��ϱ�?'))
		{
			location.href='/auth/logout.asp';
		}
	}

	//ȭ��Ȯ����Űó��
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





	//��¥����jqueryȮ��
	$.extend({
				//=====================================================================================
				// �� ��¥���� ����
				// dateType : w : �� , d : ��, h : ��, n : ��, s : ��
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
				// ���� ��¥
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
				// 10 ���� ���� �տ� 0 ����
				//=====================================================================================
				addZero: function(number){
					return parseInt(number, 10) < 10 ? "0" + number : number;
				}
			});



	// ���� ���̵� ��� �������� : �Ķ��Ÿ(�����ϼ���ID, ��/�߰�, �����ڵ�, �ڵ������Ұ�����̵�) / 2015-11-17 / �ڹ���
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
									//ó���Ϸ�
									document.getElementById(teacherFormID).innerHTML=msg;//xhr.responseText;
								},
								error : function(xhr, txtStatus) {
									alert('������ ��� �� ������ �߻��Ͽ����ϴ�.\n����:'+xhr.responseText);
								}
							});
	}














	function saveDownloadLog(adminID, desc, ipAddress, url, callBackFn) {
		if (confirm('���� �ٿ�ε�� �̿볻���� ��Ͽ� �߰��˴ϴ�.\n�ٿ�ε� �����ðڽ��ϱ�?'))
		{
			var serialize = 'adminID='+adminID+'&desc='+escape(desc)+'&ipAddress='+ipAddress+'&url='+encodeURI(url);
			var xhr = $.ajax({
									url: '/_common/systemFiles/xhrSetDownloadRequest.asp', /*���ϸ� �ٲ�� ����? xhrSetExcelDownloadLog.asp*/
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
										alert('������ �߻��Ͽ����ϴ�.\n����:'+xhr.responseText);
									}
								});
		}
	}

//-->
</script>





<script type="text/javascript">
	//-- ����������
	function getSessionInfo() {
		$.ajax({
					url: "/auth/xhrRefresh.asp",
					type: "get",
					headers: {'Content-Type': 'application/x-www-form-urlencoded'},
					dataType: "html",
					data: '',
					success : function (msg) {

						if (document.getElementById('sessionInfo')){
							//ó���Ϸ�
							document.getElementById('sessionInfo').innerHTML=msg; //xhr.responseText;
							setTimeout(getSessionInfo, 10000);
						}


					},
					error : function(rtn, txtStatus) {
						//�ƹ�ó�����ϵ��� ���� alert('���� �������� �� iisǮ�� ����� �Ǿ����ϴ�.\n����:'+txtStatus+' / ' + rtn.responseText);
					}
				});
	}

	$(document).ready(function(){
		getSessionInfo();
	});




</script>