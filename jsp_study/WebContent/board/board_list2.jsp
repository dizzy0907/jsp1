<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/common/header.jsp"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "red" value = "삘강이징"/>
<title>게시판</title>
<script>
function callback(result){
	$("#r_div").html(result);
	result = JSON.parse(result);
	alert(result.lenght);	
}
$(document).ready(function(){
	var param = "?command=list";
	param = encodeURI(param);
	var au = new AjaxUtil("list.board",param,"post");
	au.changeCallBack(callback);
	au.send();
})
</script>
</head>
<body>
<div id = "r_div"></div>
<table border = '1'>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성날짜</td>
		<td>작성자</td>
	</tr>
	<tbody id = "r_tbody">
	</tbody>
</table>
게시판2 요요
</body>
</html>