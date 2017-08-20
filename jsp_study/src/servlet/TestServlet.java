package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("두호스트두호스트~~~~" + req.getParameterMap());
			PrintWriter out = resp.getWriter();
	    }
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String[]> m = req.getParameterMap();
		Iterator<String> it = m.keySet().iterator();
		String str = "두겟두겟!!!!" ;		
		while(it.hasNext()) {
			String key = it.next();
			str += key +":"+req.getParameter(key);
		}
		doProcess(resp, str);
		    
		}
	
	public void doProcess(HttpServletResponse resp, String writeStr) throws IOException {
		resp.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resp.getWriter();
	    out.println(writeStr);
	}
	
}
