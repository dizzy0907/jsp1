<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src ="/js/jquery-3.2.1.min.js"></script>
<script>
test1();
function test(){
	/* // 둘이 똑같은 기능을 함
	var name = $("#name").val();
	//alert($("input[name = 'nameInput']").val());
	var age = $("#age").val();
	
	var result = "이름: " + name;
	result += "나이: " + age;
	$("#result_div").html(result);  //innerhtml 기능
	//$("#result_div").append(result); // =+개념 */
}
</script>
<script>
$(document).ready(function(){
	$("#btn1").click	(function(){
		var name = $("#name").val();
		var age = $("#age").val();
		var result = "이름: " + name;
		result += "나이:  " + age;
		$("#result_div").html(result);
	})
})

</script>
<body>
이름: <input type = "text" name = "nameInput" id = "name">
<br>
나이: <input type = "text" name = "ageInput" id = "age">
<br>
<div id = "result_div"></div>
<input type = "button" value = "클릭" id = "btn1">
</body>
</html>