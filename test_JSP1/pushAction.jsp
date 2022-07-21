 <%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

 

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>

<%@ page import="com.google.android.gcm.server.*"%>

 




<%
	ArrayList<String> token = new ArrayList<String>();    //token값을 ArrayList에 저장
    String MESSAGE_ID		= String.valueOf(Math.random() % 100 + 1);    //메시지 고유 ID
    boolean SHOW_ON_IDLE	= true;    //옙 활성화 상태일때 보여줄것인지
    int LIVE_TIME			= 1;    //옙 비활성화 상태일때 FCM가 메시지를 유효화하는 시간
    int RETRY				= 2;   //메시지

	String simpleApiKey = "AAAAVaHbSMc:APA91bG_CidbP5R93yVPH6NBqKAUpQiotYuCHoZyy5O2wGZwZjHpcSLBVJsvFe_C9pASYJaqAVE1D28aDypZmwTjb6nemevWUYiWzRG8gYgfgN-jP7FwlH1OSLc8KjaT9pqFu_XNGAl0";
    String gcmURL = "https://fcm.googleapis.com/v1/projects/kimnewpush/messages:send";//"https://fcm.googleapis.com/fcm/send";    
    Connection conn = null; 
    Statement stmt = null; 
    ResultSet rs = null;
    
    String msg = "kimnew";//request.getParameter("pushmsg");
    
    if(msg==null || msg.equals("")){
        msg="";
    }
    
    msg = new String(msg.getBytes("UTF-8"), "UTF-8");   //메시지 한글깨짐 처리
	

		// String url = "jdbc:sqlserver://localhost:1433;databaseName=사용 할 DB명;user=계정명;password=패스워드;";
	    //conn = DriverManager.getConnection(url);
        // stmt = conn.createStatement();            

		/*DataSource ds;
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		ds = (DataSource) envCtx.lookup("jdbc/mssql");
		conn	= ds.getConnection();
		stmt	= conn.createStatement();

        String sql = "select  pushToken from dZone.dbo.tblkimnewAppPushTestTokenLog with(Nolock)";
        rs = stmt.executeQuery(sql);
        
        //모든 등록ID를 리스트로 묶음
        while(rs.next()){
            token.add(rs.getString("pushToken"));
        }
        conn.close();*/

		token.add("f4bpEzwESNij1uYxSqEb6H:APA91bHiPYfgNum_yl7gP2ySnwUuLmblHNLQ-ca269dOkDFUzPfEHdh5svrya73tCK-Ip-rRN3SbB9wXhRtS_c5Ji4_WETvcyNDbzra_ke1ba_hdwus0pPr7d-CyG09A1ERySJLMSvqe");

		token.add("dch-A-miTweAqZjutXBcAr:APA91bEOseyMYxJpiBC07m3Er06af-YAI-oB0xk5wZpa4WRWzM6Rr6hU7394tF6t8Rt39HNruS6i7vIuPgFECQSHmHs87wWtAhyx0UvQNjMfN-prF8kRDuftJFRA8i2lRr-1zU2ITo5q");
        out.println(token);

		Sender sender = new Sender(simpleApiKey);

		 Message message = new Message.Builder()
        .collapseKey(MESSAGE_ID)
        .delayWhileIdle(SHOW_ON_IDLE)
        .timeToLive(LIVE_TIME)
        .addData("message",msg)
		.addData("title","pushTest")
        .build();

		//MulticastResult result = null;

		out.println(message);
		out.println("<br/>");
		out.println(token);
		MulticastResult result = sender.send(message,token,RETRY);
%>