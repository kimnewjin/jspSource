//window.onload=function(){
//	setTimeout(function() {
//			window.scrollTo(0, 1);
//
//			if(document.body.clientHeight >= document.body.scrollHeight)
//				document.getElementById('divFooter').style.top=document.body.clientHeight;
//			else
//				document.getElementById('divFooter').style.top=document.body.scrollHeight;
//	}, 50);
//}



//----------------------------------------------------------------------------------------------------------------------
// 도큐멘트초기화관련
//----------------------------------------------------------------------------------------------------------------------

var isIE8 = (navigator.userAgent.indexOf("MSIE 8.0") != -1) ? true : false;

/*
	// 포커스 블러 처리
	function bluring(){
		if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
	}
	document.onfocusin=bluring;
*/





//----------------------------------------------------------------------------------------------------------------------
// 기본펑션들
//----------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// 3자리마다 콤마찍기(문자변수일때)
// @return : String
//-----------------------------------------------------------------------------
String.prototype.setComma = function () {
	return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}


//-----------------------------------------------------------------------------
// 3자리마다 콤마찍기(숫자값일때_)
// @return : String
//-----------------------------------------------------------------------------
Number.prototype.setComma = function () {
	return this.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}


//-----------------------------------------------------------------------------
// 숫자만 가져올때
// @return : String
//-----------------------------------------------------------------------------
String.prototype.getNumber = function () {
	return this.replace(/[^0-9]/g, '');
}


//-----------------------------------------------------------------------------
// 문자의 좌, 우 공백 제거
// @return : String
//-----------------------------------------------------------------------------
String.prototype.trim = function () {
	return this.replace(/(^\s*)|(\s*$)/gi, "");
}
//-----------------------------------------------------------------------------
// 문자의 좌 공백 제거
// @return : String
//-----------------------------------------------------------------------------
String.prototype.ltrim = function () {
	return this.replace(/(^\s*)/, "");
}
//-----------------------------------------------------------------------------
// 문자의 우 공백 제거
// @return : String
//-----------------------------------------------------------------------------
String.prototype.rtrim = function () {
	return this.replace(/(\s*$)/, "");
}

//-----------------------------------------------------------------------------
// 숫자로 구성된 문자열인가 체크
// @return : True Or False
//
// 사용예
// var strCheckData = " 123456 ";
// alert( strCheckData.isNumeric() );
//-----------------------------------------------------------------------------
String.prototype.isNumeric = function () {
	var isRtnValue = null;
	if (this.length == 0 || isNaN(this)) {
		isRtnValue = false;
	} else {
		isRtnValue = true;
	}

	return isRtnValue;
}




/*  한글처리관계로 최신 브라우저에서 오류
//한글만
function KorCheck(str){
  if((/[^(가-?)]/).test(str)) {
	 return false;
  }else{
	 return true;
  }
}


//영문만
function EngCheck(str){
  if((/[^(A-Z)^(a-z)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}

//숫자만
function NumCheck(str){
  if((/[^(0-9)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}


//영문,숫자만
function EngNumCheck(str){
  if((/[^(A-Z)^(a-z)^(0-9)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}


//영문,숫자,한글만
function KorEngNumCheck(str){
  if((/[^(A-Z)^(a-z)^(가-?)^(0-9)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}*/


/********************************************************************
 *  Function Name : token()                                          *
 *  Description   : Input Data 가 integer형 인지 float형 인지 Check  *
 *  Input Data    : theField                                         *
 *  Output Data   : ctype (integer/float/invalid)                    *
 *  사용 Function : isDigit()                                        *
 ********************************************************************/
function token(theField) {
	var Status = 0;
	var num = 0;
	var ctype = "";
	var i;

	i = 0;

	while (i < theField.value.length) {

		num = theField.value.charAt(i);

		if (Status == 0) {
			if (isDigit(num)) {
				Status = 1;
				i++;
			} else {
				Status = 10; // invalid number
				break;
			}
		} else if (Status == 1) {
			if (isDigit(num)) {
				Status = 1; // integer
				i++;
			} else if (num == ".") {
				Status = 2; // is float number
				i++;
			} else {
				Status = 10; // invalid number
				break;
			}
		} else if (Status == 2) {
			if (isDigit(num)) {
				i++;
			} else {
				Status = 10;
				break;
			}
		}
	}

	if (Status == 1) ctype = "integer";
	else if (Status == 2) ctype = "float";
	else if (Status == 10) ctype = "invalid";

	return ctype;
}


/********************************************************************
 *  Function Name : checkedIndex()                                   *
 *  Description   : CheckBox의 인덱스 가져오기                		*
 *  Input Data    : theField                                         *
 ********************************************************************/
function checkedIndex(r) {
	var i = 0;
	for (var i = 0; i < r.length; i++)
		if (r[i].checked) return i
}

function sum(a, b) {
	console.log("asdfasdfasd");
}


/********************************************************************
 *  Function Name : isNumber()                                       *
 *  Description   : input Data 가 숫자형인지 Check                   *
 *  Input Data    : theField                                         *
 *  Output Data   : true  - 숫자형                                   *
 *                  false - 문자형                                   *
 *                                                                   *
 *  사용 Function : token()                                          *
 ********************************************************************/
function isNumber(theField) {
	var result = token(theField);

	return (result == "invalid") ? false : true;
}


/********************************************************************
 *  Function Name : isDigit()                                        *
 *  Description   : input Data가 0 ~ 9 사이의 값을 갖는지 Check      *
 *  Input Data    : num                                              *
 *  Output Data   : true/false                                       *
 *  사용 Function : None                                             *
 ********************************************************************/
function isDigit(num) {
	return (num >= "0" && num <= "9") ? true : false;
}

/********************************************************************
 *  Function Name : isNumeric()                                      *
 *  Description   : input Data 가 숫자형인지 Check                   *
 *  Input Data    : theField                                         *
 *  Output Data   : true/false (숫자형 -> true, 문자형 -> false)     *
 *  사용 Function : token()                                          *
 ********************************************************************/
function isNumeric(theField) {
	var result = token(theField);
	return (result == "invalid" || result == "float") ? false : true;
}

/********************************************************************
 *  Function Name : isNumeric()                                      *
 *  Description   : input Data 가 숫자형인지 Check                   *
 *  Input Data    : theField                                         *
 *  Output Data   : true/false (숫자형 -> true, 문자형 -> false)     *
 *  사용 Function : token()                                          *
 ********************************************************************/
function isNumericCheck(theField) {
	if (!isNumeric(theField)) {
		alert("숫자만을 입력하세요.");
		theField.value = "";
		theField.focus();
		return;
	}
}





//ID 문자열길이계산(텍스트필드참조, 남은글자집어넣을id이름, 최대값)
function getRemainCount(inputField, remainField, maxlen) {
	var temp; //들어오는 문자값...
	var msglen;
	var objRemain = document.getElementById(remainField);

	msglen = maxlen * 1;

	l = inputField.value.length;
	tmpstr = "";

	if (l == 0)
		objRemain.innerHTML = maxlen * 1;
	else {
		for (k = 0; k < l; k++) {
			temp = inputField.value.charAt(k);

			if (escape(temp).length > 4)
				msglen -= 2; //바이트계산, 단순글자수로만 하려면 1
			else
				msglen--;

			if (msglen < 0) {
				alert("총 영문 " + (maxlen * 1) + "자 한글 " + maxlen + "자 까지 등록 가능합니다.");
				inputField.value = tmpstr;
				break;
			} else {
				objRemain.innerHTML = msglen.setComma();
				tmpstr += temp;
			}
		}
	}
}



//문자열길이계산
function getByteLength(strValue) {
	var chkLen = strValue.length;
	var cntLen = 0;

	if (chkLen == 0)
		return cntLen;
	else {
		for (k = 0; k < chkLen; k++) {
			temp = strValue.charAt(k);

			if (escape(temp).length > 4)
				cntLen += 2; //바이트계산, 단순글자수로만 하려면 1
			else
				cntLen++;
		}

		return cntLen;
	}
}



//온로드 이벤트 함수 추가
function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != "function") {
		window.onload = func;
	} else {
		window.onload = function () {
			if (oldonload) {
				oldonload();
			}
			func();
		}
	}
}


//이미지 사이즈가 지정된사이즈보다 크면 지정사이즈로 줄이기
function resizeImage(imgObj, nMaxWidth) {
	if (imgObj.width > nMaxWidth) {
		var heightSize = (imgObj.height * nMaxWidth) / imgObj.width;
		imgObj.width = nMaxWidth;
		imgObj.height = heightSize;
	}
}




//-----------------------------------------------------------------------------
// 클립보드로복사
//-----------------------------------------------------------------------------
function copy2clipboard(SetText, msg) {
	if (window.clipboardData && clipboardData.setData) {
		clipboardData.setData("Text", SetText);
		if (msg == "")
			alert("복사되었습니다.\nCtrl + V를 해주세요.");
		else
			alert(msg);
	} else {
		if (msg == "")
			prompt("복사하시려면 .\nCtrl + C를 눌러서 복사 해주세요.", SetText);
		else
			prompt(msg, SetText);
	}
}







//-----------------------------------------------------------------------------
//	popup
//-----------------------------------------------------------------------------
function openPopup(linkURL, winName, w, h, scroll) { //v2.0

	var winl = 1; // (window.innerWidth - w) / 2; //(screen.width - w) / 2;
	var wint = 1; //(window.innerHeight - h) / 2; // (screen.height - h) / 2;


	var winprops = 'width=' + w + ',height=' + h + ',top=' + wint + ',left=' + winl + ',resizable=1,status=0,scrollbars=' + scroll + '';
	var popWin = window.open(linkURL, winName, winprops);
	if (parseInt(navigator.appVersion) >= 4) {
		popWin.window.focus();
	}
}


//-----------------------------------------------------------------------------
//	Layer보였다 숨겼다 하기
//-----------------------------------------------------------------------------
function toggleLayer(layerId) {
	if (document.getElementById(layerId).style.display == 'none')
		document.getElementById(layerId).style.display = '';
	else
		document.getElementById(layerId).style.display = 'none';
}

function showLayer(layerID) {
	document.getElementById(layerID).style.display = '';
}

function hideLayer(layerID) {
	document.getElementById(layerID).style.display = 'none';
}




//-----------------------------------------------------------------------------
// 해당 객체가 배열인지체크
// objName : input,checkbox,radio등, 또는 id로 정의된 객체들
// 샘플
//	if(isArray(document.test.aaa))
//		alert('배열입니다.');
//	else
//		alert('배열이 아닙니다.');
//-----------------------------------------------------------------------------
function isArray(objName, objType) {
	if (objType == 'id') {
		var obj = document.getElementById(objName);

		try {
			if (typeof (obj.length) == 'undefined')
				return false;
			else
				return true;
		} catch (e) {
			return false;
		}
	} else {
		try {
			if (typeof (objName.length) == 'undefined')
				return false;
			else
				return true;
		} catch (e) {
			return false;
		}
	}
}







//-----------------------------------------------------------------------------
// asp의 left와 right
//-----------------------------------------------------------------------------
// 설  명 : 지정한 갯수만큼 문자 가져오기  (한영갯수 구분없이)
// 일반형 : left(문자열, 갯수);
//			right(문자열, 갯수);
// 예  제 : left(strVal, 7);
//			right(strVal, 7);
//-----------------------------------------------------------------------------

function left(str, n) {
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else
		return String(str).substring(0, n);
}


function right(str, n) {
	if (n <= 0) {
		return "";
	} else if (n > String(str).length) {
		return str;
	} else {
		var iLen = String(str).length;
		return String(str).substring(iLen, iLen - n);
	}
}

//-----------------------------------------------------------------------------
// Function Name : Replace
// Description :  문자열에서 해당 문자를 규정한 문자로 바꿈.
// Parameters :	SrcString	원본 문자열
//						FirChar		바꿀 문자
//						SecChar	바꿔질 문자
// Nonlocal Data : VOID
// Return Value : 바꿔진 문자열
//-----------------------------------------------------------------------------

function replace(SrcString, FirChar, SecChar) {

	Pattern = new RegExp(FirChar, "g");

	return SrcString.replace(Pattern, SecChar);
}





//--------------------------------------------------------------------------------------------------------------------
// 자바스크립트 쿠키관련펑션
//--------------------------------------------------------------------------------------------------------------------
// 설  명 : setCookie:쿠키설정, getCookie:쿠키가져오기
// 일반형 : setCookie('쿠키이름', '셋팅값', '유효기간');
//			getCookie('쿠키이름');
// 예  제 : setCookie('event3', '1', 7);
//			alert( getCookie('event3') );
//--------------------------------------------------------------------------------------------------------------------
//쿠키설정
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	todayDate.setHours(0, 0, 0, 0);

	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//쿠키조회
function getCookie(name) {
	var Found = false
	var start, end
	var i = 0

	while (i <= document.cookie.length) {
		start = i
		end = start + name.length

		if (document.cookie.substring(start, end) == name) {
			Found = true
			break
		}
		i++
	}

	if (Found == true) {
		start = end + 1
		end = document.cookie.indexOf(";", start)

		if (end < start)
			end = document.cookie.length
		return document.cookie.substring(start, end)
	}
	return ""
}



//창닫을때 쿠키 셋팅하기
function closePopup(cookieFlag, name, expireDays) {
	if (cookieFlag == 'set' || cookieFlag == '1') {
		try {
			setCookie(name, 'view', expireDays);
			window.close();
		} catch (e) {
			window.close();
		}
	} else {
		window.close();
	}
}




//--------------------------------------------------------------------------------------------------------------------
// 플레시 삽입하기
//--------------------------------------------------------------------------------------------------------------------
// 설  명 : 마우스 올릴때 이미지 바꾸는거
// 일반형 : loadFlash(플레시url, 가로크기, 세로크기, 투명모드)
// 예  제 : loadFlash('/images/test.swf', 500, 500, 'Y');
//--------------------------------------------------------------------------------------------------------------------
function loadFlash(flashUrl, fwidth, fheight, Wmode) {
	var _fObject = "";

	_fObject += "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='" + fwidth + "' height='" + fheight + "'>";
	_fObject += "<param name='movie' value='" + flashUrl + "'>";
	_fObject += "<param name='quality' value='high'>";

	if (Wmode == "Y") {
		_fObject += "<param name='wmode' value='transparent'>";
	}

	_fObject += "<embed src='" + flashUrl + "' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='" + fwidth + "' height='" + fheight + "'></embed>";
	_fObject += "</object>";

	document.write(_fObject);
}


//--------------------------------------------------------------------------------------------------------------------
// 이미지 리사이즈하기
//--------------------------------------------------------------------------------------------------------------------
// 설  명 : 이미지의 표시 이미지 크기를 바꿀때
// 일반형 : resizeImage(이미지레퍼런스, 가로크기, 세로크기)
// 예  제 : onload="resizeImage(this, 500, 500);"
//--------------------------------------------------------------------------------------------------------------------
function resizeImage(obj, imgWidth, imgHeight) {
	var width = obj.orgWidth = obj.width;
	var height = obj.orgHeight = obj.height;
	var base = width / imgWidth > height / imgHeight ? 1 : 0;

	if (base) {
		obj.width = Math.min(width, imgWidth);
		obj.height = Math.floor(height * obj.width / width);
	} else {
		obj.height = Math.min(height, imgHeight);
		obj.width = Math.floor(width * obj.height / height);
	}

	obj.thumbWidth = obj.width;
	obj.thumbHeight = obj.height;
	obj.style.marginTop = (imgHeight - obj.offsetHeight) / 2 + 'px';
	obj.style.marginLeft = (imgWidth - obj.offsetWidth) / 2 + 'px';
	obj.style.marginRight = (imgWidth - obj.offsetWidth - parseInt(obj.style.marginLeft, 10)) + 'px'; // add v1.20
	obj.style.marginBottom = (imgHeight - obj.offsetHeight - parseInt(obj.style.marginTop, 10)) + 'px'; // add v1.20
	obj.onload = null;
}







//----------------------------------------------------------------------------------------------------------------------
// ajax관련
//----------------------------------------------------------------------------------------------------------------------

var Try = {
	these: function () {
		var returnValue;

		for (var i = 0; i < arguments.length; i++) {
			var lambda = arguments[i];
			try {
				returnValue = lambda();
				break;
			} catch (e) {}
		}

		return returnValue;
	}
}
var Ajax = {
	getTransport: function () {
		return Try.these(
			function () {
				return new ActiveXObject('Msxml2.XMLHTTP.4.0')
			},
			function () {
				return new ActiveXObject('Msxml2.XMLHTTP.3.0')
			},
			function () {
				return new ActiveXObject('Msxml2.XMLHTTP')
			},
			function () {
				return new ActiveXObject('Microsoft.XMLHTTP')
			},
			function () {
				return new XMLHttpRequest()
			}
		) || false;
	}
}

function createXHR() {
	if (window.ActiveXObject) {
		var versionList = ['MSXML2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP', 'MSXML2.XMLHTTP', 'Microsoft.XMLHTTP']; //'MSXML2.XMLHTTP.5.0',는 사용경고

		for (i = 0; i < versionList.length; i++) {
			try {
				return new ActiveXObject(versionList[i]);
			} catch (oldVersion) {
				//
			}
		}
	} else {
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}
	}
}

//-----------------------------------------------------------------------------
// select박스 내용초기화
//-----------------------------------------------------------------------------
// 설  명 : select 박스의 내용을 초기화한다(삭제)
// 일반형 : initSelectBox(폼이름, 셀렉트박스이름);
// 예  제 : initSelectBox('frmInput', 'teacherId');
// 로  그 : 2009-08-01 박범일
//-----------------------------------------------------------------------------

function initSelectBox(frmName, selectName) {
	var selectboxObj = eval('document.' + frmName + '.' + selectName);
	var optionCount = selectboxObj.options.length++;


	for (var i = 0; i < optionCount; i++) {
		selectboxObj.options[1] = null;
	}

	//또는 아래처럼 해도뎀

	//for (var i = 0; i < optionCount ; i++)
	//{
	// selectboxObj.options[optionCount - i]=null; //뒤에것부터 지워나온다
	// }


}




//-----------------------------------------------------------------------------
// select박스 내용삽입
//-----------------------------------------------------------------------------
// 설  명 : select 박스의 내용을 초기화한다(삭제)
// 일반형 : insertSelectBox(폼이름, 셀렉트박스이름, 옵션값, 옵션텍스트, 선택값);
// 예  제 : insertSelectBox('frmInput', 'teacherId', 'mteach023', '육진숙', 'selected');
// 로  그 : 2009-08-01 박범일
//-----------------------------------------------------------------------------

function insertSelectBox(frmName, selectName, value, text, selflag) {
	var selectboxObj = eval('document.' + frmName + '.' + selectName);
	var optionCount = selectboxObj.options.length++;



	selectboxObj.options[optionCount] = new Option(text, value);

	if (selflag == 'selected')
		selectboxObj.options[optionCount].selected = true;

	//	selectboxObj.options[optionCount].value=value;
	//	selectboxObj.options[optionCount].text=text;

}







//-----------------------------------------------------------------------------
// form 값을 querystring으로 연결하기
//-----------------------------------------------------------------------------
// 설  명 : 폼값을 querystring으로 죽~ 연결해서 리턴한다.
// 일반형 : getSerialize(form Object);
// 예  제 : getSerialize(document.theFrom);
//-----------------------------------------------------------------------------

function getSerialize(docForm) {
	var submitContent = '';
	var formElem;
	var lastElemName = '';

	for (i = 0; i < docForm.elements.length; i++) {

		formElem = docForm.elements[i];
		switch (formElem.type) {
			// Radio buttons
			case 'radio':
				if (formElem.checked) {
					submitContent += formElem.name + '=' + escape(formElem.value) + '&'
				}
				break;

				// Checkboxes
			case 'checkbox':
				if (formElem.checked) {
					submitContent += formElem.name + '=' + escape(formElem.value) + '&'
				}
				break;

				// Text fields, hidden form elements
				/*case 'text':
				case 'hidden':
				case 'password':
				case 'textarea':
				case 'select-one':*/
			default:
				submitContent += formElem.name + '=' + escape(formElem.value) + '&'
				break;
		}
	}
	// Remove trailing separator
	submitContent = submitContent.substring(0, submitContent.length - 1);
	return submitContent;
}










//----------------------------------------------------------------------------------------------------------------------
// 폼관련된것들
//----------------------------------------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------------------------------------
// 폼에서 체크박스 전체 선택하기
//--------------------------------------------------------------------------------------------------------------------
// 설  명 : 게시판같은 목록 화면에서 체크박스로 여러개 선택할때
// 일반형 : checkAll(form이름, 체크박스목록이름(같은이름으로된것들), 전체선택용 체크박스이름)
// 예  제 : checkAll('frmList', 'idx', 'chkAll');
//--------------------------------------------------------------------------------------------------------------------

function checkAll(frmName, checkboxObj, allObj) {
	var objForm = eval('document.' + frmName); //폼객체
	var arrCheckBox = eval('document.' + frmName + '.' + checkboxObj); //체크박스목록
	var checkboxAll = eval('document.' + frmName + '.' + allObj); //전체선택하는 체크박스


	try {
		if (checkboxAll.checked) {
			//체크
			if (!isArray(arrCheckBox)) //if(typeof(arrCheckBox.length)=='undefined')
			{
				if (!arrCheckBox.disabled) {
					arrCheckBox.checked = true;
				}
			} else {
				for (i = 0; i < arrCheckBox.length; i++) {
					if (!arrCheckBox[i].disabled) {
						arrCheckBox[i].checked = true;
					}
				}
			}
		} else {
			//해제
			if (!isArray(arrCheckBox)) //if(typeof(arrCheckBox.length)=='undefined')
			{
				arrCheckBox.checked = false;
			} else {
				for (i = 0; i < arrCheckBox.length; i++) {
					arrCheckBox[i].checked = false;
				}
			}
		}
	} catch (e) {
		alert('선택할 항목이 없습니다.');
	}

}


function getSpecDate(theDate, deli) {

	var arr_start_date = theDate.split(deli);

	var sy = arr_start_date[0];
	var sm = arr_start_date[1];
	var sd = arr_start_date[2];
	sy = parseFloat(sy);
	sm = parseFloat(sm) - 1;
	sd = parseFloat(sd);

	var todate_start = new Date();
	todate_start.setFullYear(sy, sm, sd);

	return todate_start;

}


//체크/라디오버튼 체크되어있는지 확인하기
function isChecked(chkObj) {
	var chkValue = false;

	try {
		if (isArray(chkObj)) {
			for (radioLoop = 0; radioLoop < chkObj.length; radioLoop++) {
				if (chkObj[radioLoop].checked) {
					chkValue = true;
					break;
				}
			}
		} else {
			if (chkObj.checked) {
				chkValue = true;
			}
		}

		return chkValue;
	} catch (e) {
		return false;
	}
}


//해당 객체의 체크된 갯수 구하기
function getSelectedCount(countObj) {
	var chkCount = 0;

	try {
		if (isArray(countObj)) {
			for (radioLoop = 0; radioLoop < countObj.length; radioLoop++) {
				if (countObj[radioLoop].checked) {
					chkCount++;
				}
			}
		} else {
			if (countObj.checked) {
				chkCount++;
			}
		}

		return chkCount;
	} catch (e) {
		return 0;
	}

}


//라디오버튼 체크되어있는지 확인하기(호환용)
function checkRadio(radioObj) {
	var chkValue = false;

	try {
		if (isArray(radioObj)) {
			for (radioLoop = 0; radioLoop < radioObj.length; radioLoop++) {
				if (radioObj[radioLoop].checked) {
					chkValue = true;
					break;
				}
			}
		} else {
			if (radioObj.checked) {
				chkValue = true;
			}
		}

		return chkValue;
	} catch (e) {
		return 0;
	}
}



//바이트단위 문자계산
function getFormLength(chkfrm, remainfrm, maxlen) {
	var temp; //들어오는 문자값...
	var msglen;
	msglen = maxlen * 1;

	l = chkfrm.value.length;
	tmpstr = "";

	if (l == 0)
		remainfrm.value = maxlen * 1;
	else {
		for (k = 0; k < l; k++) {
			temp = chkfrm.value.charAt(k);

			if (escape(temp).length > 4)
				msglen -= 2;
			else
				msglen--;

			if (msglen < 0) {
				alert("총 영문 " + (maxlen * 1) + "자 한글 " + maxlen + "자 까지 등록 가능합니다.");
				chkfrm.value = tmpstr;
				break;
			} else {
				remainfrm.value = msglen;
				tmpstr += temp;
			}
		}
	}
}









//-----------------------------------------------------------------------------
// iframe의 사이즈를 자동조정
//-----------------------------------------------------------------------------
// 설  명 : iframe의 사이즈를 자동조종
// 일반형 : resizeFrame(프레임명);
// 예  제 : resizeFrame('ifr1');
//-----------------------------------------------------------------------------
function resizeIframe(obj) {
	/*var obj_document = obj.contentWindow.document;

	if(obj_document.height) {
		obj.height = obj_document.height;
		//obj.style.width = obj_document.width;
	} else {
		obj.style.height = obj_document.body.scrollHeight+"px";
		//obj.style.width = obj_document.body.scrollHeight+"px";
	}*/

	// 익스및 크롬 사파리테스트~ 박범일
	var the_height = obj.contentWindow.document.body.offsetHeight;
	obj.height = the_height;
}

function resizeFrame(name) {
	//로딩중이미지<img id="imgLoading" src='/images/ajax-loader.gif' border='0' align="center" style="margin:100px;">
	//if(typeof(document.getElementById('imgLoading'))=='object')
	//	document.getElementById('imgLoading').style.display='none';

	try {
		var Frame_Body = document.frames(name).document.body;
		var Frame_name = document.all(name);

		Frame_name.style.display = 'block';

		var resize_width = Frame_Body.scrollWidth + (Frame_Body.offsetWidth - Frame_Body.clientWidth); //페이지 너비 구하기
		var resize_height = Frame_Body.scrollHeight + (Frame_Body.offsetHeight - Frame_Body.clientHeight); //페이지 높이 구하기

		//최소 가로폭 지정
		if (resize_width < 620) {
			resize_width = 620;
		}

		//최소 세로폭지정
		if (resize_height < 200) {
			resize_height = 200;
		}

		//최대 가로폭 지정
		if (resize_width > 730) {
			resize_width = 730;
		}

		Frame_name.style.width = resize_width;
		Frame_name.style.height = resize_height;

		if (Frame_name.style.height == "0px" || Frame_name.style.width == "0px") {
			Frame_name.style.width = "730px"; //기본 iframe 너비
			Frame_name.style.height = "200px"; //기본 iframe 높이
			window.status = '브라우저 버전이 낮습니다. IE 5.5이상으로 업데이트 해주세요.';
		} else {
			window.status = '';
		}
	} catch (e) {
		window.status = 'Error: ' + e.number + '; ' + e.description;
	}
}

//샘플
//<body onload="resizeFrame('main_frame');">


var isChrome = window.chrome && !navigator.userAgent.match(/Opera|OPR\//);
var isEdge = navigator.appVersion.indexOf("Edge/12") != -1 ? true : false;


function openPlayer(playerType, num, l_idx, lp_idx, ld_idx, media_type, directURL, title, urlType) {

	//	var url;
	//	openPopup('/sPlayer/player.asp?num='+num+'&l_idx='+l_idx+'&lp_idx='+lp_idx+'&ld_idx='+ld_idx+'&media_type='+media_type+'&directURL='+directURL+'&Title='+title, 'sPlayer', 748, 517, 0);


	var url = '/sPlayer/player.asp?num=' + num + '&l_idx=' + l_idx + '&lp_idx=' + lp_idx + '&ld_idx=' + ld_idx + '&media_type=' + media_type + '&directURL=' + directURL + '&Title=' + title + "&urlType=" + urlType;

	var openW = "748";
	var openH = "530";

	if (typeof (urlType) != "undefined") {
		if (urlType != "") { // 화질설정
			openW = "1048";
		}
	}


	if (isChrome || isEdge) {
		//alert("스타플레이어 전용");

		var exe = StarPlayerExe; //해당 소스 유지
		exe.install = STARPLAYER_SETUP_URL; //해당 소스 유지
		exe.url = url; //변수 url에 적용된 값 적용
		exe.width = openW; //크롬, 엣지브라우저 팝업 가로사이즈
		exe.height = openH; //크롬, 엣지브라우저 팝업 세로사이즈
		exe.topmost = true; //항상 위 기능 허용
		exe.caption = "수박씨 플레이어"; //크롬, 엣지브라우저 타이틀명
		exe.run(); //해당 소스 유지(크롬, 엣지브라우저 실행)
		return false;
	} else {
		//alert("일반 브라우져");

		openPopup(url, 'sPlayer', openW, openH, 0);
	}
}