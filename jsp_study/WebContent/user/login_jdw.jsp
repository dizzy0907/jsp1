<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@ include file="/common/header.jsp" %>
<!--<link rel = "stylesheet" href = "/ui/btsp3.7.7/css/bootstrap-theme.min.css"/>>-->
<link rel = "stylesheet" href = "/ui/signin.css"/>
<style>
input[type = 'password']{
	color:red;
}
#pwd{
color:blue;
}
.test{
color:green;
}
</style>
<title>로그인</title>
</head>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("input[type='button']").click(function(){
		if(this.getAttribute("id")=="btnLogin") return;
		var value = this.value;
		if(value=="회원탈퇴"){
			$("#command").val("delete");
		}else if(value=="회원정보수정"){
			location.href = "/user/update.jsp";
			return;
		}else if(value=="회원리스트"){
			location.href = "/user/list.jsp";
			return;
		}
		this.form.submit();
	})
})
</script>
<script>

$(document).ready(function(){
	$("#btnLogin").click(function(){
		var idValue = $("#id").val().trim();
		var pwdValue = $("#id").val().trim();
		if(idValue == ""){
			alert("아이디를 쓰시기 바랍니다.")
			$("id").val("");
			$("id").focus();
			return;
		}
		if(idValue ==""){
			alert("비밀번호를 쓰시기 바랍니다.")
			$("pwd").val("");
			$("pwd").focus();
			return;
		}
		var param = {};
		param["id"] = idValue;
		param["pwd"] = 	pwdValue;
		
		param = "?command=login&param=" + JSON.stringify(param);
		param = encodeURI(param);
		var au = new AjaxUtil("test.user",param,"get",false);  // true: 비동기,  false: 동기
		au.changeCallBack(callback);
		au.send();
	});
	
})
function callback2(result){
	var re = JSON.parse(result);
	alert(re.result);
	location.href = re.url;
}
function callback(result){
	var idValue = $("#id").val().trim();
	var pwdValue = $("#pwd").val().trim();
	var param = {};
	param["id"] = idValue;
	param["pwd"] = pwdValue;
	
	param = "?command=login&param=" + JSON.stringify(param);
	param = encodeURI(param);
	var au1 = new AjaxUtil("test.user",param,"post",false);
	au1.changeCallBack(callback2);
	au1.send();
}
</script>

<body>
	<%
		if(user == null) {
	%>
	<form action="login.user" method="post">
	아이디 : <input type="text" name="id" id="id" class = "test"><br> 
	비밀번호 : <input type="password" name="pwd" id="pwd"><br>
	 <input type="hidden" name="command" id="command" value="login"> 
	 <input type="button" id="btnLogin" value="로그인">
	</form>
	<%
		} else {
			String id = user.get("id");
			String userNo = user.get("user_no");
			String name = user.get("name");
			String hobby = user.get("hobby");
			String result = userNo + "번쨰로 가입하신 " + name + "님 반갑습니다.<br>";
			result += name + "님의 아이디는 " + id + "이며,<br> 취미는 " + hobby + "입니다";
			out.println(result);
			//out.println(session.getAttribute("id") + "님 환영합니다.");
	%>
	<form action="some.user" method="post">
		<input type="button" value="로그아웃"> 
		<input type="button" value="회원탈퇴"> 
		<input type="button" value="회원정보수정"> 
		<input type="button" value="회원리스트"> 
		<input type="hidden" name="command" id="command" value="logout"> 
		<input type="hidden" name="userNo" value="<%=userNo%>">
	</form>
	<%
}
%>
</body>
</html>