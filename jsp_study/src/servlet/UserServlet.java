package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import service.UserService;
import service.implement.UserServiceImpl;

public class UserServlet extends CommonServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService us = new UserServiceImpl();
	private Gson g = new Gson();	
	
	public void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		if(command==null) {
			doProcess(resp, "�߸��� ��û�Դϴ�.");
		}else {
			if(command.equals("signin")) {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String name = request.getParameter("name");
				String[] hobbies = request.getParameterValues("hobby");
				String hobby ="";
				for(String h : hobbies) {
					hobby += h + ",";
				}
				hobby = hobby.substring(0, hobby.length()-1);
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("id", id);
				hm.put("pwd", pwd);
				hm.put("name", name);
				hm.put("hobby", hobby);
				String result = us.insertUser(hm);
				doProcess(resp, result);
			}else if(command.equals("login")) {
				String param = request.getParameter("param");
				Map<String, String> hm = g.fromJson(param, HashMap.class);
				Map<String, String> resultMap = us.loginUser(hm);
				String url = "/user/login.jsp";
				if(resultMap.get("id")!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("user", resultMap);
					url = "/main.jsp";
				}
				resultMap.put("url", url);
				String result = g.toJson(resultMap);
				doProcess(resp, result);
			}else if(command.equals("logout")) {
				HttpSession session = request.getSession();
				session.invalidate();
				resp.sendRedirect("/user/login.jsp");
			}else if(command.equals("delete")) {
				String userNo = request.getParameter("userNo");
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("user_no", userNo);
				int rCnt = us.deleteUser(hm);
				String result ="ȸ��Ż�� �����ϼ̽��ϴ�.";
				if(rCnt==1) {
					result = "ȸ��Ż�� �����ϼ̽��ϴ�.";
					result += "<script>";
					result += "alert('ȸ��Ż�� �����ϼ̽��ϴ�.');";
					result += "</script>";
				}
				doProcess(resp, result);
			}else if(command.equals("update")) {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String name = request.getParameter("name");
				String[] hobbies = request.getParameterValues("hobby");
				String hobby ="";
				for(String h : hobbies) {
					hobby += h + ",";
				}
				hobby = hobby.substring(0, hobby.length()-1);
				String userNo = request.getParameter("userNo");				
				Map<String, String> hm = new HashMap<String, String>();
				hm.put("id", id);
				hm.put("pwd", pwd);
				hm.put("name", name);
				hm.put("hobby", hobby);
				hm.put("user_no", userNo);
				int rCnt = us.updateUser(hm);
				String result ="ȸ������ ������ �����ϼ̽��ϴ�.";				
				if(rCnt==1) {
					result = "ȸ������ ������ �����ϼ̽��ϴ�.";
				}
				doProcess(resp, result);
			}else if(command.equals("list")) {
				Map<String, String> hm = new HashMap<String, String>();
				List<Map<String, String>> userList = us.selectUserList(hm);
				String result ="<table border = '1'";
				for(Map<String, String> m : userList) {
					result += "<tr>";
					result += "<td>" + m.get("name")+"</td>";
					result += "<td>" + m.get("name")+"</td>";
					result += "<td>" + m.get("name")+"</td>";
					result += "</tr>";
				}
				result += "</table>";
				doProcess(resp, result);
			}else if(command.equals("view")) {
				String param = request.getParameter("param");
				Map<String, String> hm = g.fromJson(param, HashMap.class);
				Map<String, String> rHm =us.selectUser(hm);
				String result = g.toJson(rHm);
				doProcess(resp, result);
			}
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String param = request.getParameter("param");
		Map<String, String> hm = g.fromJson(param, HashMap.class);
		System.out.println(hm.get("id"));
		System.out.println(hm.get("pwd"));
		String id = hm.get("id");
		String pwd = hm.get("pwd");
		String msg = "���� �ƴϵ� �Դϴ�.";
		if(id.equals("aa")) {
			if(pwd.equals("aa")) {
				msg = "�α��� ����";
			}else {
				msg = "��й�ȣ Ʋ��";
			}
		}
		Map<String, String> rHm = new HashMap<String, String>();
		rHm.put("msg",msg);
		String result = g.toJson(rHm);
 		doProcess(resp,result);
	}	
	public void doProcess(HttpServletResponse resp, String writeStr) 
			throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(writeStr);
	}
}
