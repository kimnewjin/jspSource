//<![CDATA[
//document.write('<div id="toolTip" style="border-width:0px; border-style:none; width:0px; height:0px; position:absolute; left:0px; top:0px; z-index:1;" ></div>');

window.onload=function(){
	var obj_Element=document.createElement('<div id="toolTip" style="border-width:0px; border-style:none; width:0px; height:0px; position:absolute; left:0px; top:0px; z-index:1;" >');

	document.body.appendChild(obj_Element);

	//document.body.insertAdjacentElement("afterEnd", obj_Element); //�۵����ǳ� ǥ�þȵ�
}


function moveMsg()
{
	try
	{
		document.getElementById('toolTip').style.left = event.x + 10 + document.documentElement.scrollLeft;
		document.getElementById('toolTip').style.top  = event.y + 20 + document.documentElement.scrollTop;
	}
	catch(e)
	{
		//����ó��
	}
}

function showMsg(msg)
{
	var content;
	content ='<table align="center" border="0" cellpadding="10" cellspacing="0" style="border-width:3; border-color:#cccccc; border-style:solid;font-size:9pt;">';
	content += '<tr><td align="center" bgcolor="white" style="padding:5px;text-align:left !important;">'+msg+'</td></tr></table>';

	try
	{
		document.getElementById('toolTip').innerHTML=content;
	}
	catch(e)
	{
		//����
	}
}

function hideMsg()
{
	try
	{
		document.getElementById('toolTip').innerHTML='';
	}
	catch(e)
	{
		//�ƹ�ó������
	}
}

document.onmousemove=moveMsg;

//]]





