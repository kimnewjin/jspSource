alert('�ش� ��ũ��Ʈ�� ���Ұ�. �ڹ���ip���� �����ּ���~');
return false;

var Try = {
		  these: function() {
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
			  getTransport: function() {
			    return Try.these(
			      function() {return new ActiveXObject('Msxml2.XMLHTTP')},
			      function() {return new ActiveXObject('Microsoft.XMLHTTP')},
			      function() {return new XMLHttpRequest()}
			    ) || false;
			  }
			}

function paramEscape(paramValue)
{
	return escape(paramValue); // �����ڵ�(16����)�� ���ڵ�
//	return encodeURIComponent(paramValue); // utf-8�� ���ڵ�
}

function formData2QueryString(docForm)
{
  var submitContent = '';
  var formElem;
  var lastElemName = '';

  for (i = 0; i < docForm.elements.length; i++) {

    formElem = docForm.elements[i];
    switch (formElem.type) {
      // Text fields, hidden form elements
      case 'text':
      case 'hidden':
      case 'password':
      case 'textarea':
      case 'select-one':
        submitContent += formElem.name + '=' + paramEscape(formElem.value) + '&'
        break;

      // Radio buttons
      case 'radio':
        if (formElem.checked) {
          submitContent += formElem.name + '=' + paramEscape(formElem.value) + '&'
        }
        break;

      // Checkboxes
      case 'checkbox':
        if (formElem.checked) {
			submitContent += formElem.name + '=' + paramEscape(formElem.value) + '&'
          // Continuing multiple, same-name checkboxes
		  /*
          if (formElem.name == lastElemName) {
            // Strip of end ampersand if there is one
            if (submitContent.lastIndexOf('&') == submitContent.length-1) {
              submitContent = submitContent.substring(0, submitContent.length - 1);
            }
            // Append value as comma-delimited string
            submitContent += ',' + paramEscape(formElem.value);
          }
          else {
            submitContent += formElem.name + '=' + paramEscape(formElem.value);
          }
          submitContent += '&';
          lastElemName = formElem.name;
		  */
        }
        break;

    }
  }
  // Remove trailing separator
  submitContent = submitContent.substring(0, submitContent.length - 1);
  return submitContent;
}

function xmlHttpPost(actionUrl, submitParameter, resultFunction)
{
    var xmlHttpRequest = false;

    //IE�ΰ��
    if(window.ActiveXObject)
    {
        xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
    }
    else
    {
        xmlHttpReq = new XMLHttpRequest();
        xmlHttpReq.overrideMimeType('text/xml');
    }

    xmlHttpRequest.open('POST', actionUrl, true);
    xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlHttpRequest.onreadystatechange = function() {
        if(xmlHttpRequest.readyState == 4)
        {
            switch (xmlHttpRequest.status)
            {
                case 404:
                    alert('����: ' + actionUrl + '�� �������� ����');
                    break;
               case 500:
                   alert('����: ' + xmlHttpRequest.responseText);
                   break;
               default:
                   eval(resultFunction + '(xmlHttpRequest.responseText);');
                   break;
            }
        }
    }

    xmlHttpRequest.send(submitParameter);
}