<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file = "/common/header.jsp" %>
<title>회원정보 수정</title>
</head>
<body>
<script>
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
			잠<input type="checkbox" name="hobby" value="수면" <%=user.get("hobby").indexOf("잠")!=-1?"checked":""%>>
			먹기<input type="checkbox" name="hobby" value="음악" <%=user.get("hobby").indexOf("먹기")!=-1?"checked":""%>>
			운동<input type="checkbox" name="hobby" value="영화" <%=user.get("hobby").indexOf("운동")!=-1?"checked":""%>>
			수영<input type="checkbox" name="hobby" value="게임" <%=user.get("hobby").indexOf("수영")!=-1?"checked":""%>>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="회원정보수정"></td>
	</tr>
</table>
<input type="hidden" name="command" value="update">
<input type="hidden" name="userNo" value="<%=user.get("user_no")%>">
</form>
</body>
</html>