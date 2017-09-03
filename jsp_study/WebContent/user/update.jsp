<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file = "/common/header.jsp" %>
<title>회원정보 수정</title>
</head>
<body>
<script>
$(document).ready(function(){
	var params = {};
	params["user_no"] = "<%=request.getParameter("user_no")%>";
	params = "?command=view&param=" + JSON.stringify(params);
	params = encodeURI(params);
	var au = new AjaxUtil("update.user",params,"post");
	au.changeCallBack(callback);
	au.send();
})
function callback(result){
	
	var obj = JSON.parse(result);
	$("#name").val(obj.name);
	$("#id").val(obj.id);
	var hobbies = obj.hobby.split(",");
	for(var i = 0, max = hobbies.length;i<max;i++){
		$("input[value='" + hobbies[i] +"']").prop("checked", true);
	}
	$("#userNo").val(obj.user_no);
}
function check(){
	var nameValue = $("#name").val().trim();
	var pwdValue = $("#pwd").val().trim();
	if(nameValue == ""){
		alert("이름이 공백입니다.");
		$("#name").val("");
		$("#name").focus();
		return false;
	}
	if(pwdValue == ""){
		alert("비밀번호가 공백입니다.");
		$("#pwd").val("");
		$("#pwd").focus();
		return false;
	}
	return true;
}
</script>
<form action="sigin.user" method="post" onsubmit="return chek()">
<table border="1">
	<tr>
		<td colspan="2" align="center">회원정보 수정</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" id="id" readOnly value="<%=user.get("id")%>"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" id="pwd" ></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name" value="<%=user.get("name")%>"></td>
	</tr>
	<tr>
		<td>취미</td>
		<td>
			잠<input type="checkbox" name="hobby" value="수면">
			먹기<input type="checkbox" name="hobby" value="음악">
			운동<input type="checkbox" name="hobby" value="영화">
			수영<input type="checkbox" name="hobby" value="게임">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="회원정보수정"></td>
	</tr>
</table>
<input type="hidden" name="command" value="update">
<input type="hidden" name="userNo" id ="userNo">
</form>
</body>
</html>