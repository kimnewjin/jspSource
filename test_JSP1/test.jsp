<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.net.URI"%>
<%@ page import="java.net.URISyntaxException"%>
<%@ page import="org.apache.http.client.ClientProtocolException"%>
<%@ page import="org.apache.http.client.utils.URIBuilder"%>



<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.sql.DataSource"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.android.gcm.server.*"%>


 

<%
	
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost("https://fcm.googleapis.com/fcm/send");
		post.setHeader("Content-type", "application/json");
		post.setHeader("Authorization", "key=AAAAYpUlHH8:APA91bFHaVqk47nohWmFrLdFtUiClJ9J5VqtJgCvEum3ASeiSYgM4slkxxXu0ZNrIsC-8JJxS5O9YhbrYqfqntomMPwhNll2EaBNng-0J-pJaJCDLncpBBigAaahJ8Aw67nQN73SExmH");

		JSONObject message = new JSONObject();
		message.put("to", "dBbB2BFT-VY:APA91bHrvgfXbZa-K5eg9vVdUkIsHbMxxxxxc8dBAvoH_3ZtaahVVeMXP7Bm0iera5s37ChHmAVh29P8aAVa8HF0I0goZKPYdGT6lNl4MXN0na7xbmvF25c4ZLl0JkCDm_saXb51Vrte");
		message.put("priority", "high");

		JSONObject notification = new JSONObject();
		notification.put("title", "Java");
		notification.put("body", "f4bpEzwESNij1uYxSqEb6H:APA91bHiPYfgNum_yl7gP2ySnwUuLmblHNLQ-ca269dOkDFUzPfEHdh5svrya73tCK-Ip-rRN3SbB9wXhRtS_c5Ji4_WETvcyNDbzra_ke1ba_hdwus0pPr7d-CyG09A1ERySJLMSvqe");

		message.put("notification", notification);

		post.setEntity(new StringEntity(message.toString(), "UTF-8"));
		HttpResponse response = client.execute(post);
		System.out.println(response);
		System.out.println(message);
%>