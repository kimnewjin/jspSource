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
// ��ť��Ʈ�ʱ�ȭ����
//----------------------------------------------------------------------------------------------------------------------

var isIE8 = (navigator.userAgent.indexOf("MSIE 8.0") != -1) ? true : false;

/*
	// ��Ŀ�� �� ó��
	function bluring(){
		if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
	}
	document.onfocusin=bluring;
*/





//----------------------------------------------------------------------------------------------------------------------
// �⺻��ǵ�
//----------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// 3�ڸ����� �޸����(���ں����϶�)
// @return : String
//-----------------------------------------------------------------------------
String.prototype.setComma = function () {
	return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}


//-----------------------------------------------------------------------------
// 3�ڸ����� �޸����(���ڰ��϶�_)
// @return : String
//-----------------------------------------------------------------------------
Number.prototype.setComma = function () {
	return this.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}


//-----------------------------------------------------------------------------
// ���ڸ� �����ö�
// @return : String
//-----------------------------------------------------------------------------
String.prototype.getNumber = function () {
	return this.replace(/[^0-9]/g, '');
}


//-----------------------------------------------------------------------------
// ������ ��, �� ���� ����
// @return : String
//-----------------------------------------------------------------------------
String.prototype.trim = function () {
	return this.replace(/(^\s*)|(\s*$)/gi, "");
}
//-----------------------------------------------------------------------------
// ������ �� ���� ����
// @return : String
//-----------------------------------------------------------------------------
String.prototype.ltrim = function () {
	return this.replace(/(^\s*)/, "");
}
//-----------------------------------------------------------------------------
// ������ �� ���� ����
// @return : String
//-----------------------------------------------------------------------------
String.prototype.rtrim = function () {
	return this.replace(/(\s*$)/, "");
}

//-----------------------------------------------------------------------------
// ���ڷ� ������ ���ڿ��ΰ� üũ
// @return : True Or False
//
// ��뿹
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




/*  �ѱ�ó������� �ֽ� ���������� ����
//�ѱ۸�
function KorCheck(str){
  if((/[^(��-?)]/).test(str)) {
	 return false;
  }else{
	 return true;
  }
}


//������
function EngCheck(str){
  if((/[^(A-Z)^(a-z)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}

//���ڸ�
function NumCheck(str){
  if((/[^(0-9)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}


//����,���ڸ�
function EngNumCheck(str){
  if((/[^(A-Z)^(a-z)^(0-9)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}


//����,����,�ѱ۸�
function KorEngNumCheck(str){
  if((/[^(A-Z)^(a-z)^(��-?)^(0-9)]/).test(str)){
	 return false;
  }else{
	 return true;
  }
}*/


/********************************************************************
 *  Function Name : token()                                          *
 *  Description   : Input Data �� integer�� ���� float�� ���� Check  *
 *  Input Data    : theField                                         *
 *  Output Data   : ctype (integer/float/invalid)                    *
 *  ��� Function : isDigit()                                        *
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
 *  Description   : CheckBox�� �ε��� ��������                		*
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
 *  Description   : input Data �� ���������� Check                   *
 *  Input Data    : theField                                         *
 *  Output Data   : true  - ������                                   *
 *                  false - ������                                   *
 *                                                                   *
 *  ��� Function : token()                                          *
 ********************************************************************/
function isNumber(theField) {
	var result = token(theField);

	return (result == "invalid") ? false : true;
}


/********************************************************************
 *  Function Name : isDigit()                                        *
 *  Description   : input Data�� 0 ~ 9 ������ ���� ������ Check      *
 *  Input Data    : num                                              *
 *  Output Data   : true/false                                       *
 *  ��� Function : None                                             *
 ********************************************************************/
function isDigit(num) {
	return (num >= "0" && num <= "9") ? true : false;
}

/********************************************************************
 *  Function Name : isNumeric()                                      *
 *  Description   : input Data �� ���������� Check                   *
 *  Input Data    : theField                                         *
 *  Output Data   : true/false (������ -> true, ������ -> false)     *
 *  ��� Function : token()                                          *
 ********************************************************************/
function isNumeric(theField) {
	var result = token(theField);
	return (result == "invalid" || result == "float") ? false : true;
}

/********************************************************************
 *  Function Name : isNumeric()                                      *
 *  Description   : input Data �� ���������� Check                   *
 *  Input Data    : theField                                         *
 *  Output Data   : true/false (������ -> true, ������ -> false)     *
 *  ��� Function : token()                                          *
 ********************************************************************/
function isNumericCheck(theField) {
	if (!isNumeric(theField)) {
		alert("���ڸ��� �Է��ϼ���.");
		theField.value = "";
		theField.focus();
		return;
	}
}





//ID ���ڿ����̰��(�ؽ�Ʈ�ʵ�����, ���������������id�̸�, �ִ밪)
function getRemainCount(inputField, remainField, maxlen) {
	var temp; //������ ���ڰ�...
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
				msglen -= 2; //����Ʈ���, �ܼ����ڼ��θ� �Ϸ��� 1
			else
				msglen--;

			if (msglen < 0) {
				alert("�� ���� " + (maxlen * 1) + "�� �ѱ� " + maxlen + "�� ���� ��� �����մϴ�.");
				inputField.value = tmpstr;
				break;
			} else {
				objRemain.innerHTML = msglen.setComma();
				tmpstr += temp;
			}
		}
	}
}



//���ڿ����̰��
function getByteLength(strValue) {
	var chkLen = strValue.length;
	var cntLen = 0;

	if (chkLen == 0)
		return cntLen;
	else {
		for (k = 0; k < chkLen; k++) {
			temp = strValue.charAt(k);

			if (escape(temp).length > 4)
				cntLen += 2; //����Ʈ���, �ܼ����ڼ��θ� �Ϸ��� 1
			else
				cntLen++;
		}

		return cntLen;
	}
}



//�·ε� �̺�Ʈ �Լ� �߰�
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


//�̹��� ����� �����Ȼ������ ũ�� ����������� ���̱�
function resizeImage(imgObj, nMaxWidth) {
	if (imgObj.width > nMaxWidth) {
		var heightSize = (imgObj.height * nMaxWidth) / imgObj.width;
		imgObj.width = nMaxWidth;
		imgObj.height = heightSize;
	}
}




//-----------------------------------------------------------------------------
// Ŭ������κ���
//-----------------------------------------------------------------------------
function copy2clipboard(SetText, msg) {
	if (window.clipboardData && clipboardData.setData) {
		clipboardData.setData("Text", SetText);
		if (msg == "")
			alert("����Ǿ����ϴ�.\nCtrl + V�� ���ּ���.");
		else
			alert(msg);
	} else {
		if (msg == "")
			prompt("�����Ͻ÷��� .\nCtrl + C�� ������ ���� ���ּ���.", SetText);
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
//	Layer������ ����� �ϱ�
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
// �ش� ��ü�� �迭����üũ
// objName : input,checkbox,radio��, �Ǵ� id�� ���ǵ� ��ü��
// ����
//	if(isArray(document.test.aaa))
//		alert('�迭�Դϴ�.');
//	else
//		alert('�迭�� �ƴմϴ�.');
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
// asp�� left�� right
//-----------------------------------------------------------------------------
// ��  �� : ������ ������ŭ ���� ��������  (�ѿ����� ���о���)
// �Ϲ��� : left(���ڿ�, ����);
//			right(���ڿ�, ����);
// ��  �� : left(strVal, 7);
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
// Description :  ���ڿ����� �ش� ���ڸ� ������ ���ڷ� �ٲ�.
// Parameters :	SrcString	���� ���ڿ�
//						FirChar		�ٲ� ����
//						SecChar	�ٲ��� ����
// Nonlocal Data : VOID
// Return Value : �ٲ��� ���ڿ�
//-----------------------------------------------------------------------------

function replace(SrcString, FirChar, SecChar) {

	Pattern = new RegExp(FirChar, "g");

	return SrcString.replace(Pattern, SecChar);
}





//--------------------------------------------------------------------------------------------------------------------
// �ڹٽ�ũ��Ʈ ��Ű�������
//--------------------------------------------------------------------------------------------------------------------
// ��  �� : setCookie:��Ű����, getCookie:��Ű��������
// �Ϲ��� : setCookie('��Ű�̸�', '���ð�', '��ȿ�Ⱓ');
//			getCookie('��Ű�̸�');
// ��  �� : setCookie('event3', '1', 7);
//			alert( getCookie('event3') );
//--------------------------------------------------------------------------------------------------------------------
//��Ű����
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	todayDate.setHours(0, 0, 0, 0);

	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//��Ű��ȸ
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



//â������ ��Ű �����ϱ�
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
// �÷��� �����ϱ�
//--------------------------------------------------------------------------------------------------------------------
// ��  �� : ���콺 �ø��� �̹��� �ٲٴ°�
// �Ϲ��� : loadFlash(�÷���url, ����ũ��, ����ũ��, ������)
// ��  �� : loadFlash('/images/test.swf', 500, 500, 'Y');
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
// �̹��� ���������ϱ�
//--------------------------------------------------------------------------------------------------------------------
// ��  �� : �̹����� ǥ�� �̹��� ũ�⸦ �ٲܶ�
// �Ϲ��� : resizeImage(�̹������۷���, ����ũ��, ����ũ��)
// ��  �� : onload="resizeImage(this, 500, 500);"
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
// ajax����
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
		var versionList = ['MSXML2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP', 'MSXML2.XMLHTTP', 'Microsoft.XMLHTTP']; //'MSXML2.XMLHTTP.5.0',�� �����

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
// select�ڽ� �����ʱ�ȭ
//-----------------------------------------------------------------------------
// ��  �� : select �ڽ��� ������ �ʱ�ȭ�Ѵ�(����)
// �Ϲ��� : initSelectBox(���̸�, ����Ʈ�ڽ��̸�);
// ��  �� : initSelectBox('frmInput', 'teacherId');
// ��  �� : 2009-08-01 �ڹ���
//-----------------------------------------------------------------------------

function initSelectBox(frmName, selectName) {
	var selectboxObj = eval('document.' + frmName + '.' + selectName);
	var optionCount = selectboxObj.options.length++;


	for (var i = 0; i < optionCount; i++) {
		selectboxObj.options[1] = null;
	}

	//�Ǵ� �Ʒ�ó�� �ص���

	//for (var i = 0; i < optionCount ; i++)
	//{
	// selectboxObj.options[optionCount - i]=null; //�ڿ��ͺ��� �������´�
	// }


}




//-----------------------------------------------------------------------------
// select�ڽ� �������
//-----------------------------------------------------------------------------
// ��  �� : select �ڽ��� ������ �ʱ�ȭ�Ѵ�(����)
// �Ϲ��� : insertSelectBox(���̸�, ����Ʈ�ڽ��̸�, �ɼǰ�, �ɼ��ؽ�Ʈ, ���ð�);
// ��  �� : insertSelectBox('frmInput', 'teacherId', 'mteach023', '������', 'selected');
// ��  �� : 2009-08-01 �ڹ���
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
// form ���� querystring���� �����ϱ�
//-----------------------------------------------------------------------------
// ��  �� : ������ querystring���� ��~ �����ؼ� �����Ѵ�.
// �Ϲ��� : getSerialize(form Object);
// ��  �� : getSerialize(document.theFrom);
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
// �����õȰ͵�
//----------------------------------------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------------------------------------
// ������ üũ�ڽ� ��ü �����ϱ�
//--------------------------------------------------------------------------------------------------------------------
// ��  �� : �Խ��ǰ��� ��� ȭ�鿡�� üũ�ڽ��� ������ �����Ҷ�
// �Ϲ��� : checkAll(form�̸�, üũ�ڽ�����̸�(�����̸����εȰ͵�), ��ü���ÿ� üũ�ڽ��̸�)
// ��  �� : checkAll('frmList', 'idx', 'chkAll');
//--------------------------------------------------------------------------------------------------------------------

function checkAll(frmName, checkboxObj, allObj) {
	var objForm = eval('document.' + frmName); //����ü
	var arrCheckBox = eval('document.' + frmName + '.' + checkboxObj); //üũ�ڽ����
	var checkboxAll = eval('document.' + frmName + '.' + allObj); //��ü�����ϴ� üũ�ڽ�


	try {
		if (checkboxAll.checked) {
			//üũ
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
			//����
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
		alert('������ �׸��� �����ϴ�.');
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


//üũ/������ư üũ�Ǿ��ִ��� Ȯ���ϱ�
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


//�ش� ��ü�� üũ�� ���� ���ϱ�
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


//������ư üũ�Ǿ��ִ��� Ȯ���ϱ�(ȣȯ��)
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



//����Ʈ���� ���ڰ��
function getFormLength(chkfrm, remainfrm, maxlen) {
	var temp; //������ ���ڰ�...
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
				alert("�� ���� " + (maxlen * 1) + "�� �ѱ� " + maxlen + "�� ���� ��� �����մϴ�.");
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
// iframe�� ����� �ڵ�����
//-----------------------------------------------------------------------------
// ��  �� : iframe�� ����� �ڵ�����
// �Ϲ��� : resizeFrame(�����Ӹ�);
// ��  �� : resizeFrame('ifr1');
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

	// �ͽ��� ũ�� ���ĸ��׽�Ʈ~ �ڹ���
	var the_height = obj.contentWindow.document.body.offsetHeight;
	obj.height = the_height;
}

function resizeFrame(name) {
	//�ε����̹���<img id="imgLoading" src='/images/ajax-loader.gif' border='0' align="center" style="margin:100px;">
	//if(typeof(document.getElementById('imgLoading'))=='object')
	//	document.getElementById('imgLoading').style.display='none';

	try {
		var Frame_Body = document.frames(name).document.body;
		var Frame_name = document.all(name);

		Frame_name.style.display = 'block';

		var resize_width = Frame_Body.scrollWidth + (Frame_Body.offsetWidth - Frame_Body.clientWidth); //������ �ʺ� ���ϱ�
		var resize_height = Frame_Body.scrollHeight + (Frame_Body.offsetHeight - Frame_Body.clientHeight); //������ ���� ���ϱ�

		//�ּ� ������ ����
		if (resize_width < 620) {
			resize_width = 620;
		}

		//�ּ� ����������
		if (resize_height < 200) {
			resize_height = 200;
		}

		//�ִ� ������ ����
		if (resize_width > 730) {
			resize_width = 730;
		}

		Frame_name.style.width = resize_width;
		Frame_name.style.height = resize_height;

		if (Frame_name.style.height == "0px" || Frame_name.style.width == "0px") {
			Frame_name.style.width = "730px"; //�⺻ iframe �ʺ�
			Frame_name.style.height = "200px"; //�⺻ iframe ����
			window.status = '������ ������ �����ϴ�. IE 5.5�̻����� ������Ʈ ���ּ���.';
		} else {
			window.status = '';
		}
	} catch (e) {
		window.status = 'Error: ' + e.number + '; ' + e.description;
	}
}

//����
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
		if (urlType != "") { // ȭ������
			openW = "1048";
		}
	}


	if (isChrome || isEdge) {
		//alert("��Ÿ�÷��̾� ����");

		var exe = StarPlayerExe; //�ش� �ҽ� ����
		exe.install = STARPLAYER_SETUP_URL; //�ش� �ҽ� ����
		exe.url = url; //���� url�� ����� �� ����
		exe.width = openW; //ũ��, ���������� �˾� ���λ�����
		exe.height = openH; //ũ��, ���������� �˾� ���λ�����
		exe.topmost = true; //�׻� �� ��� ���
		exe.caption = "���ھ� �÷��̾�"; //ũ��, ���������� Ÿ��Ʋ��
		exe.run(); //�ش� �ҽ� ����(ũ��, ���������� ����)
		return false;
	} else {
		//alert("�Ϲ� ������");

		openPopup(url, 'sPlayer', openW, openH, 0);
	}
}