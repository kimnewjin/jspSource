<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE,CHROME=1">
<title>������ķ��-���ھ����� ������</title>


<!-- <link href="/favicon.ico" rel="icon" type="image/x-icon" /> -->

<!-- <link rel="stylesheet" type="text/css" href="/_library/bootflat/css/bootflat.min.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="/_library/buttonWave/dist/waves.css" /> -->
<link rel="stylesheet" type="text/css" href="/_library/bootstrap/css/bootstrap.min.css">
<!-- <link rel="stylesheet" type="text/css"  href="https://netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="/_library/bootstrap/css/bootstrap-theme.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"> -->
<link rel="stylesheet" type="text/css" href="/_library/jquery/jQueryUI/jquery-ui.css">
<!--link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"-->
<link rel="stylesheet" href="/_library/fontAwesome/4.7.0/css/font-awesome.min.css" >

<!-- hover -->
<link rel="stylesheet" href="/_library/hover/hover.css">
<!-- toastr -->
<script src="/_library/jquery/jquery.min.2.1.3.js"></script>




<!--[if lte IE 9]>
	<link rel="stylesheet" href="ie9.css" />
<![endif]-->


<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
<!--[if lte IE 8]>
<script src="/_library/theme/assets/js/html5shiv.min.js"></script>
<script src="/_library/theme/assets/js/respond.min.js"></script>
<![endif]-->
<style>
	body {
		font-family : "malgun gothic","malgungothic","nanumgothic","Helvetica Neue",Helvetica,Arial,sans-serif;
		line-height: 1.2244;
		color:black;

	}

	*:focus {
		outline:0 !important;
		outline:none !important;
	}


	.container, .container-fluid, .divMainContainer {
	  /*max-width: none !important;
	  min-width: 1380px !important;*/
	  padding: 0;
	}

	.txt_red{
			color:red;
	}

	.modal { z-index: 10000; }


	.vLine {
		z-index:1010;
		-webkit-box-shadow:	2px 0 5px rgba(0,0,0,0.36), 5px 0 5px rgba(0,0,0,0.12);
		-moz-box-shadow:		2px 0 5px rgba(0,0,0,0.36), 5px 0 5px rgba(0,0,0,0.12);
		box-shadow:				2px 0 5px rgba(0,0,0,0.36), 5px 0 5px rgba(0,0,0,0.12);
		background-color:white !important;
	}

	.main-content3 {
		z-index:1010;
		margin-top:-5px;
		-webkit-box-shadow:	-2px 0 5px rgba(0,0,0,0.36), -5px 0 5px rgba(0,0,0,0.12);
		-moz-box-shadow:		-2px 0 5px rgba(0,0,0,0.36), -5px 0 5px rgba(0,0,0,0.12);
		box-shadow:				-2px 0 5px rgba(0,0,0,0.36), -5px 0 5px rgba(0,0,0,0.12);
		background-color:white !important;
	}


	.hLine {z-index:1000;
		-webkit-box-shadow: 0 2px 5px 0 rgba(0,0,0,0.36),0 2px 10px 0 rgba(0,0,0,0.12);
		-moz-box-shadow: 0 2px 5px 0 rgba(0,0,0,0.36),0 2px 10px 0 rgba(0,0,0,0.12);
		box-shadow: 0 2px 5px 0 rgba(0,0,0,0.36),0 2px 10px 0 rgba(0,0,0,0.12);
	}


	@media (max-width: 1130px) {
		#divLNB {  top:2px; display:none; z-index:1000;}
		#divMainContainer { padding-left:1px; z-index:2000;}
		/*.vLine {padding-bottom: 0;}*/
		#btnLnbToggle { display:block; }

	}

	@media (min-width: 1131px) {
		#divLNB {  top:0;  display:block; z-index:2000;}
		#divMainContainer { padding-left:200px; z-index:1000; }
		/*.vLine {padding-bottom: 1000px;}*/
		#btnLnbToggle { display:none; }
	}



	/*@media (max-width: 970px) {

		#divLNB { position:absolute; top:2px !important; display:none !important; z-index:1000 !important;}
		.navbar-nav {display:none3; }
		.navbar-header {float:right; }
		.navbar-toggle { display:block; }
		#gnbMenu { display:none2; }
	}*/



	/*gnb ���� */
		#divMainContainer {
			float:left;
			/*padding-left:200px;*/
			width:100%;
			padding-right:2px;
		}

		/* �׺�� ���� */
		.navbar { border-radius: 0 !important; }
		.navbar-inverse {
			background-color: #5264ae;
			color: #fff !important;
			border-color:transparent;
		}
		.navbar-inverse
		.navbar-nav>.active>a,
		.navbar-inverse .navbar-nav>.active>a:hover,
		.navbar-inverse .navbar-nav>.active>a:focus {
			background-color: #4859b7;
			color: orange;

			display: inline-block;
			vertical-align: middle;
			-webkit-transform: translateZ(0);
			transform: translateZ(0);
			box-shadow: 0 0 1px rgba(0, 0, 0, 0);
			-webkit-backface-visibility: hidden;
			backface-visibility: hidden;
			-moz-osx-font-smoothing: grayscale;
			-webkit-transition-duration: 0.3s;
			transition-duration: 0.3s;
			-webkit-transition-property: box-shadow;
			transition-property: box-shadow;

			box-shadow: 0 0 8px rgba(0, 0, 0, 0.6);
		}
		.navbar-inverse .navbar-text,
		.navbar-inverse .navbar-nav > li > a
		{
			color: #e8e8e8;
		}

		.navbar-form {
			/* margin-top: 6px; margin-bottom: 6px; */
			 margin: 0;
			 padding: 2px 2px 0 0;
		}

		.navbar-toggle {
			margin-bottom: 1px !important;
			padding: 11px 10px !important;
		}


		/* �׺�� ������ */
		.navbar-orange { background:#edc4a5 !important; border:1px solid orange;}
		.navbar-orange li > a { color: #5f5f5f !important; }
		.navbar-orange .active>a, .navbar-orange .active>a:hover, .navbar-orange .active>a:focus {background:#f8e0ab !important;}
		.navbar-orange a:focus {background:#f8e0ab !important;}

		.navbar-indigo { color: #f9f9f9 !important; background:#4a4f68 !important; border:1px solid black;}
		.navbar-indigo li > a { color: #ebebeb !important; }
		.navbar-indigo .active>a, .navbar-indigo .active>a:hover, .navbar-indigo .active>a:focus {color: #f9f9f9 !important; background:#5488d6 !important;}
		.navbar-indigo a:focus {color: #f9f9f9 !important; background:#5488d6 !important;}


		.navbar-blue { color: #f9f9f9 !important; background:#4982f8 !important; border:1px solid black;}
		.navbar-blue li > a { color: #ebebeb !important; }
		.navbar-blue .active>a, .navbar-blue .active>a:hover, .navbar-blue .active>a:focus {color: #f9f9f9 !important; background:blue !important;}
		.navbar-blue a:focus {color: #f9f9f9 !important; background:blue !important;}




		.navbar-black {
		  background-image: -webkit-linear-gradient(top, #3c3c3c 0%, #222 100%);
		  background-image:      -o-linear-gradient(top, #3c3c3c 0%, #222 100%);
		  background-image: -webkit-gradient(linear, left top, left bottom, from(#3c3c3c), to(#222));
		  background-image:         linear-gradient(to bottom, #3c3c3c 0%, #222 100%);
		  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3c3c3c', endColorstr='#ff222222', GradientType=0);
		  filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
		  background-repeat: repeat-x;
		}
		.navbar-black .navbar-nav > .open > a,
		.navbar-black .navbar-nav > .active > a {
		  background-image: -webkit-linear-gradient(top, #080808 0%, #0f0f0f 100%);
		  background-image:      -o-linear-gradient(top, #080808 0%, #0f0f0f 100%);
		  background-image: -webkit-gradient(linear, left top, left bottom, from(#080808), to(#0f0f0f));
		  background-image:         linear-gradient(to bottom, #080808 0%, #0f0f0f 100%);
		  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff080808', endColorstr='#ff0f0f0f', GradientType=0);
		  background-repeat: repeat-x;
		  -webkit-box-shadow: inset 0 3px 9px rgba(0, 0, 0, .25);
					 box-shadow: inset 0 3px 9px rgba(0, 0, 0, .25);
		}
		.navbar-black .navbar-brand,
		.navbar-black .navbar-nav > li > a {
		  text-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
		}




		/* 1�ܰ� �� */
		.panel .panel-body {
			 padding: 5px !important;
		}

		/* ������ �� �׵θ� */
		.tabs-container .nav-tab-sub {
			border-top:0; border-right: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; padding:10px;
		}

		.nav-tabs>li {
			margin-bottom: -1px !important;
		}

		.nav-tabs>li.active>a {
			font-weight: bold;
		}



		.tab-indigo { color: #f9f9f9 !important; background:#4a4f68 !important; border:1px solid black; }
		.tab-indigo .nav-tabs li > a { color: #ebebeb !important; }
		.tab-indigo .nav-tabs li > a:focus,
		.tab-indigo .nav-tabs li > a:hover,
		.tab-indigo .nav-tabs li.active > a {color: #505050 !important; background:#ebebeb !important;}


		.breadcrumb>li+li:before {
			content: "/\00a0";
		}




		.btn {
			/*margin-top:1px !important;
			margin-bottom:1px !important;*/
			display: inline-block;
			vertical-align: middle;


			/* Glow */
			-webkit-transform: translateZ(0);
			transform: translateZ(0);
			box-shadow: 0px 0px 1px rgba(0,0,0,0);
			-webkit-backface-visibility: hidden;
			backface-visibility: hidden;
			-moz-osx-font-smoothing: grayscale;
			-webkit-transition-duration: 0.3s;
			transition-duration: 0.3s;
			-webkit-transition-property: box-shadow;
			transition-property: box-shadow;

		}
		.btn:hover, .btn:focus, .btn:active {
		  /* Glow */
		  box-shadow: 0 0 8px rgba(0, 0, 0, 0.6);
		}


		/* ��ưũ������ */
		.btn-sm, .btn-group-sm>.btn {
			padding: 3px 5px !important;;
			font-size: 11px !important;;
			line-height: 1.25 !important;;
			/*vertical-align: top !important;*/
		}

		.btn-xs, .btn-group-xs>.btn {
			padding: 1px 3px !important;;
			line-height: 1.25 !important;;
		}

		.btn-xs2, .btn-group-xs2>.btn {
			padding: 0 3px !important;;
			font-size: 11px !important;;
			border-radius: 2px !important;;
			line-height: 1.2 !important;;
		}


		/* ��ư������ */
		.btn-default {
			/*background-image: -webkit-linear-gradient(top, #fff 0, #e0e0e0 100%);
			background-image: -o-linear-gradient(top, #fff 0, #e0e0e0 100%);
			background-image: linear-gradient(to bottom, #fff 0, #e0e0e0 100%);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe0e0e0', GradientType=0);
			filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);
			background-repeat: repeat-x;*/
			border: 1px solid #cccccc;
			background: #efefef;
			color: #444444;
			/*color: #fff;
			background-color: #e7e7e7;
			border-color: #d7d7d7;*/
		}


		.btn-white {
			border-color: #dbdbdb;
			background: #fff;
			text-shadow: 0 1px 0 #fff;
			border-color: #ccc;
		}


		/* ���� ���� */
		.bgGray {
			background: #c0c0c0;
		}

		.bgBlack {
			background: black;
			color: #f3f3f3;
		}

		.bgBlue {
			background: blue;
			color: #f3f3f3;
		}

		.bold {
			font-weight: bold;
		}


		/* ������ */
		/* input ũ�� ������ */
		.input-group-sm > .form-control, .input-group-sm > .input-group-addon, .input-group-sm > .input-group-btn > .btn {
			padding: 1px 5px !important;
		}

		.input-sm { padding: 2px 3px !important; vertical-align:middle !important;}

		/*input-xs�����*/
		.input-xs{
		  height: 18px;
		  padding: 0 2px;
		  font-size: 9px;
		  line-height: 1.2;
		  border-radius: 2px;
		}
		select.input-xs {
		  height: 18px;
		  line-height: 18px;
		  padding: 1px 2px;
		}
		textarea.input-xs,
		select[multiple].input-xs {
		  height: auto;
		}
		.form-group-xs .form-control {
		  height: 18px;
		  padding: 1px 2px;
		  font-size: 10px;
		  line-height: 1.25;
		  border-radius: 2px;
		}
		select.form-group-xs .form-control {
		  height: 18px;
		  line-height: 18px;
		}
		textarea.form-group-xs .form-control,
		select[multiple].form-group-xs .form-control {
		  height: auto;
		}
		.form-group-xs .form-control-static {
		  height: 18px;
		  padding: 0 2px;
		  font-size: 10px;
		  line-height: 1.5;
		}


		.input-group .form-control {
			z-index: 0 !important;
		}


		/*�޷¹��������ϴ°� �߰� �ڽ� �¿� �ϳ����� �׵θ� ����� , .input-group .form-control:not(:first-child):not(:last-child) */
		.input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child){
			border-left:0;
			border-right:0;
			vertical-align: top;
		}



		.radio-inline+.radio-inline, .checkbox-inline+.checkbox-inline {
			margin-left:auto !important;
		}

		.checkbox-inline, .radio-inline{
			margin-right: 5px;
			/*float:left;*/
		}

		/*.checkbox-inline {
			margin-right: 10px;
		}
		.radio-inline  {
			margin-right: 5px;
		}

		.checkbox label, .radio label {padding-left: 20px; }*/

		.radio input[type='radio'], .radio-inline input[type='radio'], .checkbox input[type='checkbox'], .checkbox-inline input[type='checkbox'] {
			margin-top: 1px !important;
			margin-left: -18px !important;
		}

		.form-control {
			display: inline-block !important;
			/*	margin-top:1px !important; margin-bottom:1px !important; */
		}





		select.form-control.input-sm {
			padding: 1px 2px;
		}
		select.form-control {
			padding: 2px 2px;
		}
		select.form-control.input-lg {
			padding: 3px 3px;
		}
		/*.form-control {}*/



		/* ���ϼ��ñ� */
		.file-group {
			width:100%;
			margin:0;
			padding:1px;
		}
		.file-group input[type="file"] {
			display:inline-block !important;
			border: 1px solid #e9e9e9;
			width: auto !important;
		}
		.file-group .help-block {
			display:inline-block !important;
			margin: 2px 0 0 0 !important;
		}





	/* LNB���� */
		#divLNB {
			position:absolute; 
			/*left: 0;*/
			width:200px; 
			background-color:white !important;
		}
		#lnbTitle {
			font-weight: bold;
			font-size: 1.5em !important;
			color:white;
			background-color: #3278b3 !important;/*#4fc1e9;*/
			border-color: #3278b3;
			padding: 10px 0 10px 10px !important;
			height:45px;
		}

		/*#divLNB .list-group > a { font-size:0.9em; }*/
		#divLNB .list-group > .active { font-size:1.1em; font-weight:bold;}
		#divLNB .list-group-item { border-radius:0 !important; padding: 10px 2px 10px 10px;}
		#divLNB .list-group-item > li { padding: 3px 0 3px 10px;}
		#divLNB .list-group-item > li a { font-size:0.85em; color:gray; }
		#divLNB .list-group-item > li a:hover { text-decoration:none; color:red !important; }
		#divLNB .active {border-radius:0 !important; padding: 10px 2px 10px 10px; }

		.selected.list-group-item, .selected.list-group-item:hover, .selected.list-group-item:focus {background-color:#f2f2f2;  color:black; font-weight:bold; }
		.selItem { color:red !important; }
	/* /�׺�� ���� */


	/* ���������� */
	.contentsMain {
		padding-left:10px;
		padding-right:10px;

	}



	.waves-circle {
		 text-align: center;
		 width: 2.5em;
		 height: 2.5em;
		 line-height: 2.5em !important;
		 border-radius: 50%;
	}



	/*����¡����*/
	.pagination { margin:0; padding: 9px 0 7px 0 !important;}
	.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus {
		color: white;
		background-color: #5D9CEC;
		border-color: #5D9CEC;
	}
	.pagination > li > a, .pagination > li > span {
		 position: relative;
		 float: left;
		 padding: 1px 6px;
		 line-height: 1.44;
		 text-decoration: none;
		 color: #337ab7;
		 background-color: #fff;
		 border: 1px solid #ddd;
		 margin-left: -1px;
	}
	.pagenation-block {
		margin-top:-14px;
		padding-left:10px;
		text-align:left !important;
	}

	.center-block {
		/*������*/
		margin-top:-14px;
		display:block;
		min-height:3.3em;
		text-align:center;
		border-radius:2px;
		border:1px solid silver;
		background-color:#F5F7FA;
	}






	/* jqueryUI */
	.ui-datepicker { width: 15em; font-size: 0.9em; }

	.ui-datepicker select.ui-datepicker-year { width:50% !important; font-weight: normal;font-size: 1em;}
	.ui-datepicker select.ui-datepicker-month { width:50% !important;}

	.ui-datepicker .ui-datepicker-title select {
		font-size: 0.9em;
		margin: 1px 0;
	}





	/* ���̺� ���� */
	.table caption {
		text-align:left;
		font-size: 1.1em;
		background-color: #307ecc;
		color: #FFF;
		line-height: 38px;
		padding-left: 12px;
		margin-bottom: 1px;
	}

	.table th { /*.table > tbody > tr > th {*/
		/*color: #707070;*/
		text-align:center;
		font-weight: bold;
		vertical-align:middle !important;
		background: #e6e6e6 !important;
		padding: 4px !important;
		/*background-image: -webkit-linear-gradient(top, #f8f8f8 0%, #ececec 100%);
		background-image: -o-linear-gradient(top, #f8f8f8 0%, #ececec 100%);
		background-image: linear-gradient(to bottom, #f8f8f8 0%, #ececec 100%);
		background-repeat: repeat-x;
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff8f8f8', endColorstr='#ffececec', GradientType=0);*/
	}


	.table>thead>tr>th {
		color: #000000;
		text-align:center;
		font-weight: bold;
		vertical-align:middle !important;
		border-bottom: 2px solid #ddd;
		background: #e6e6e6 !important;
		padding: 4px !important;
	}


	.table-list th, .table-list td { text-align:center; vertical-align:middle !important; }
	.table-center th, .table-center td { text-align:center; vertical-align:middle !important; }


	.table td {
		vertical-align:middle !important;
		padding:4px;
	}

	.table-form th {
		text-align: right !important;
		padding-right: 5px !important;
	}
	.table-form td {
		text-align: left !important;
		padding-left: 5px !important;
	}


	/* ���İ��� */
	.aRight, .aright { text-align:right !important; }
	.aLeft, .aleft	{ text-align:left !important; }
	.aCenter, .acenter	{ text-align:center !important; }
	.vTop, .vtop { vertical-align:top !important; }
	.vMid, .vmid { vertical-align:middle !important; }
	.vBottom, .vbottom { vertical-align:bottom !important; }


	/*������*/
	.subtab{
		/*border-top: 1px solid silver;*/
		margin: 0;
		padding: 5px 0;
		border-bottom: 1px solid silver;
	}

	.thirdtab{
		border-bottom: 1px solid silver;
		margin:0 0 0 20px;
		padding: 5px 0;
	}

	/*alert*/
	.alert li { margin-left: 5px; }

	.smallFont
	{
		font-size:0.8em;
	}


	/* ���� ��ư */
	#toTop
	{
		display: none;
		z-index:1030; width: 100px; border: 2px solid #f7f7f7; background: #d0d0d0;
		position: fixed; text-align: center; bottom: 10px; right: 10px; cursor: pointer; padding: 5px;
		color: #333; opacity: 0.6; filter: alpha(opacity=60); -webkit-border-radius: 10px; -moz-border-radius: 10px; -o-border-radius: 10px; border-radius: 10px;
		-webkit-transition: all .25s linear; -moz-transition: all .25s linear; -o-transition: all .25s linear; transition: all .25s linear;
	}


	.callRedText{
		color:red;
		font-weight:bold;
	}

	.yellowbg{
		border:1px solid #dddddd;background-color:#ffffdd;
	}

	.waitingbox{
			border:4px solid;
			border-color:#5587ED;
			z-index:100;
			background-color:#6799FF;
			position:absolute;
			top : 60%;
			left:40%;
			width:30%;
			font-size:1.3em;
			color:#ffffff;
			font-weight:bold;
			padding-top: 15px;
			padding-bottom:15px;
			text-align:center;
			line-height:40px;
	}

		.noSearchArea{
			width:100;
			height:200px;
			border:4px solid;
			border-color:#eaeaea;
			text-align:center;
			padding-top:80px;
			line-height:40px;
			font-size:1.3em;
		}


		/*2017-06-29 ������ �߰�*/

		.orderByBtn{
			cursor:pointer;
		}

		.btnBoldRed{
			color:red;
			font-weight:bold;
		}

</style>


<!--[if IE 8]>
<style>
.breadcrumb>li {display:inline;}

#divLNB {  top:0;  display:block; z-index:2000;}
#divMainContainer { padding-left:200px; z-index:1000; }
/*.vLine {padding-bottom: 1000px;}*/
#btnLnbToggle { display:none; }
</style>
<![endif]-->
