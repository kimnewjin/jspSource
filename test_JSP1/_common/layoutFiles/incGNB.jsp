<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%
	//String userIP = request.getRemoteAddr();
%>
<Script language="javascript">
	function setAdminPassword(memIDX){
		openPopup('/login/editPassword.jsp','adminPWDEditInfo', 600, 300, 1);
	}
</Script>
			<div class="hLine" style="position: relative; background-color: white;height:70px;margin-bottom:10px;width:100%;">
				<div class="" style="position:relative;margin:0; padding:5px 10px 1px 0; height:20px; text-align:right;">
					<button type="button" class="btn btn-info btn-xs" onclick="javascript: setAdminPassword();">
						<i class="fa fa-cog"></i> 비번변경
					</button>
					<button type="button" class="btn btn-danger btn-xs tooltips" title="김유진님 로그아웃" data-toggle="tooltip" onclick="logout();"><i class="fa fa-user"></i> <%=sessionMemberName%> 님[<%=userIP%>] 로그아웃</button>
				</div>
				<div>

					<nav class="navbar  navbar-inverse" style="min-height: 40px; margin: 9px 0 10px 0; overflow:hidden;">
						<div class="container-fluid">
							<div>
								<button type="button" class="navbar-toggle collapsed" id="btnLnbToggle" href="#1" onclick="$('#divLNB').slideToggle('fast');" style="float:left !important; z-index:3000; margin-top: 1px;">
									<span class="sr-only">Toggle LNB</span>
									<span class="fa fa-navicon"></span>
									<span class="fa fa-angle-down"></span>
								</button>
							</div>

							<div class="navbar-header" >
								<!-- <a class="navbar-brand" href="#"><img src="http://lgimg.soobakc.com/images/footer/footer_logo.jpg" ></a> -->
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" href="#gnbMenu" aria-expanded="false" aria-controls="gnbMenu" style="float:right !important;  margin:2px 10px; z-index:3000;">
									<span class="sr-only">Toggle GNB</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div>
							<%
								String GNBActive1 = "";
								String GNBActive2 = "";
								String GNBActive3 = "";
								String GNBActive4 = "";

								if(pageCode == "member"){
									GNBActive1 ="active";
								}
								if(pageCode == "order"){
									GNBActive2 ="active";
								}
								if(pageCode == "commission"){
									GNBActive3 ="active";
								}
								if(pageCode == "payment"){
									GNBActive4 ="active";
								}
							%>



							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse collape" id="gnbMenu" style="min-width:980px !important;">
								<ul class="nav navbar-nav" style="">											
									<li class="<%=GNBActive1%>">
										<a href="/member/index.jsp" class="hvr-glow">
											<i class="menu-icon fa fa-users"></i> 가입현황
										</a>
									</li> 
									<li class="<%=GNBActive2%>">
										<a href="/order/index.jsp" class="hvr-glow">
											<i class="menu-icon fa fa-krw"></i> 결제현황
										</a>
									</li>
									<li class="<%=GNBActive3%>">
										<a href="/commission/index.jsp" class="hvr-glow">
											<i class="menu-icon fa fa-krw"></i> 수수료정산
										</a>
									</li>
									<li class="<%=GNBActive4%>">
										<a href="/payment/index.jsp" class="hvr-glow">
											<i class="menu-icon fa fa-gift"></i> 대행결제
										</a>
									</li>			
								</ul>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid -->
					</nav>
				</div>

			</div>

