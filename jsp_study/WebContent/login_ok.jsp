<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>   
<%@ page import="java.sql.DriverManager"%>   
<%@ page import="java.sql.ResultSet"%>   
<%@ page import="java.sql.SQLException"%>   
<%@ page import="java.sql.PreparedStatement"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id1");
String pwd = request.getParameter("pwd1");
String dbUrl = "jdbc:mysql://localhost:3306/jsp_study";
String dbId ="root";
String dbPwd ="jspstudy";
Connection con;
PreparedStatement ps;
String result = id + "없는 ID 입니다";
session.setAttribute("login", "false");
try {
	Class.forName("org.mariadb.jdbc.Driver");
	con = DriverManager.getConnection(dbUrl,dbId,dbPwd);
	System.out.println("연결성공");
	String sql = "select * from user where id =?";
	ps = con.prepareStatement(sql);
	ps.setString(1, id);
	ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		if(pwd.equals(rs.getString("pwd"))){
			result = "로그인 성공";
			session.setAttribute("login", "true");
			session.setAttribute("id", id);
		}else{
			result = "로그인 실패";
		}
	}
}catch (ClassNotFoundException e) {
	e.printStackTrace();
}catch(SQLException e) {
	e.printStackTrace();
}

boolean login = false;
%>
<script>
	alert("<%=result%>");
	location.href = "/login.jsp";
</script>
</body>
</html>