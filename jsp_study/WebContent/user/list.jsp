<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file = "/common/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원리스트</title>
</head>
<!-- jquery, ajax 사용 -->
<script>
$(document).ready(function(){
	$("form[action='list.user']").submit();
});
</script>
<body>
<form action="list.user" method="post">
<input type="hidden" name="command" value="list">
</form>
</body>
</html>