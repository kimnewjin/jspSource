import javax.servlet.http.*;
import java.io.*;

public class ServletTest1 extends HttpServlet{
	protected vod doGet(HttpServletRequest req, HttpServletResponse resp){
		String str1 = req.getParameter("var1");
		PrintWriter out = resp.getWriter();
		out.println(str1);

		out.close();

	}
}