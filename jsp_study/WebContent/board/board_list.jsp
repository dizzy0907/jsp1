<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/common/header.jsp"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "red" value = "삘강이징"/>
<title>게시판</title>
</head>
<body>
${list}
${ul}
${red}
<table border = '1'>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성날짜</td>
		<td>작성자</td>
	</tr>
	<c:forEach var = "b" items = "${boardList}">
	<tr>
		<td>${b.bNum}</td>
		<td>${b.title}</td>
		<td>${b.content}</td>
		<td>${b.regDate}</td>
		<td>${b.writer}</td>
		
	</tr>
	</c:forEach>
</table>
게시판 요요
</body>
</html>