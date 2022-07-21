<%!
	/*�Լ� ��� ���Ͽ��� ������ ! (����ǥ) - ��������!*/

	/*����� ���� �Լ� ����*/

	/*��¥ ǥ�� ����*/
	public String setSwitchDateValue(String DateValue , int a){
		String returnValue ;
		switch (a){
			case 1 :
				returnValue = DateValue.substring(0,10);
				break;
			case 2 :
				returnValue = "�˲�~";			
				break;
			default :
				returnValue = DateValue;
				break;
		}
		return returnValue;
	}


	public String getPaging(String pageParameters , int currentPage, int pagingCount, StringBuffer pageName){
		String pagingReturnValue  = "";
		String currentPage1 = Integer.toString(currentPage);
		if(currentPage1 == ""){
			currentPage =  1;
		}

		int blockPage = ((currentPage-1)/10)*10+1;

		int endPage = (blockPage-1)+10;

		if (endPage > pagingCount){
			endPage = pagingCount;
		}

		
		int beforePage = currentPage - 1;
		int nextPage = currentPage + 1;

		

		pagingReturnValue = "<ul class='pagination'>";
		if(pagingCount >= 0 ){
			if (blockPage == 1){
				pagingReturnValue = pagingReturnValue + "<li class='disabled'>";
				pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage=1&"+pageParameters+"'>	";
				pagingReturnValue = pagingReturnValue + "		<i class='fa fa-fast-backward' title='��ó�� �������'></i>	";
				pagingReturnValue = pagingReturnValue + "	</a>";
				pagingReturnValue = pagingReturnValue + "</li>";
				pagingReturnValue = pagingReturnValue + "<li class='disabled'>";
				pagingReturnValue = pagingReturnValue + "	<a href='#1'><i class='fa fa-chevron-left'></i></a>	";
				pagingReturnValue = pagingReturnValue + "</li>	";
			} else {
				pagingReturnValue = pagingReturnValue + "<li>";
				pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage=1&"+pageParameters+"'>	";
				pagingReturnValue = pagingReturnValue + "		<i class='fa fa-fast-backward' title='����������'></i>	";
				pagingReturnValue = pagingReturnValue + "	</a>";
				pagingReturnValue = pagingReturnValue + "</li>";
				pagingReturnValue = pagingReturnValue + "<li>";
				pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage="+Integer.toString(beforePage)+"&"+pageParameters+"'>	";
				pagingReturnValue = pagingReturnValue + "		<i class='fa fa-chevron-left' title='���� ������'></i>	";
				pagingReturnValue = pagingReturnValue + "	</a>";
				pagingReturnValue = pagingReturnValue + "</li>	";
			}	

			for (int P = blockPage ; P <= endPage ; P++){
				if (P == currentPage){
					pagingReturnValue = pagingReturnValue + "<li class='active'><a href='#1'>" + P + "</a></li>";
				}else{
					pagingReturnValue = pagingReturnValue + "<li>	";
					pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage=" + P + "&"+pageParameters+"'>" +P +"</a>	";
					pagingReturnValue = pagingReturnValue + "</li>";
				}
			}
			
			
			if (blockPage > pagingCount){
				pagingReturnValue = pagingReturnValue + "<li>";
				pagingReturnValue = pagingReturnValue + "	<a href='#1'><i class='fa fa-chevron-right'></i></a>	";
				pagingReturnValue = pagingReturnValue + "</li>	";
				pagingReturnValue = pagingReturnValue + "<li>";
				pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage="+Integer.toString(pagingCount)+"&"+pageParameters+"'>	";
				pagingReturnValue = pagingReturnValue + "		<i class='fa fa-fast-forward' title='�ǳ� �������'></i>	";
				pagingReturnValue = pagingReturnValue + "	</a>";
				pagingReturnValue = pagingReturnValue + "</li>";
				
			} else {
				pagingReturnValue = pagingReturnValue + "<li>";
				pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage="+Integer.toString(nextPage)+"&"+pageParameters+"'>	";
				pagingReturnValue = pagingReturnValue + "		<i class='fa fa-chevron-right' ></i>	";
				pagingReturnValue = pagingReturnValue + "	</a>";
				pagingReturnValue = pagingReturnValue + "</li>	";
				pagingReturnValue = pagingReturnValue + "<li>";
				pagingReturnValue = pagingReturnValue + "	<a href='"+pageName+"?gotoPage="+Integer.toString(pagingCount)+"&"+pageParameters+"'>	";
				pagingReturnValue = pagingReturnValue + "		<i class='fa fa-fast-forward' title='�ǳ� �������'></i>	";
				pagingReturnValue = pagingReturnValue + "	</a>";
				pagingReturnValue = pagingReturnValue + "</li>";
			}		
		}
		pagingReturnValue = pagingReturnValue + "</ul>";

		return pagingReturnValue;
	}


%>