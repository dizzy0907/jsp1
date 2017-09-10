<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/common/header.jsp"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>게시판</title>
<script>
function callback(result){
	$("#table").bootstrapTable({data : result});
}
/* function callback(result){
	result = JSON.parse(result);
	var str= "";
	for(var i=0, max = result.length; i<max; i++ ){
		var b = result[i];
		str +="<tr>";
		str +="<td>" + b.bNum + "</td>";
		str +="<td>" + b.title + "</td>";
		str +="<td>" + b.content + "</td>";
		str +="<td>" + b.writer + "</td>";
		str +="<td>" + b.regDate + "</td>";
		str +="</tr>";
	}
	$("#r_tbody").html(str);		
} */

function getBoardList(content){
	var param = {};
	param["command"] ="list";
	if(content){
		param["content"] = content
	}
	param = JSON.stringify(param);
	var ja = new JqAjax("list.board",param);
	ja.changeFunc(callback);
	ja.send();
}
$(document).ready(function(){
	getBoardList();
	$("#btnSearch").click(function(){
		var searchStr = $("#searchStr").val().trim();
		if(!searchStr){
			alert("검색 내용을 적어주세요");
			$("#searchStr").val("");
			$("#searchStr").focus();
			return;
		}
		getBoardList(searchStr);
	});
})

	
</script>
</head>
<body>
내용 : <input type ="text" name = "searchStr" id ="searchStr"/>
<input type = "button" value = "검색" id = "btnSearch"/>
	<table id = "table" data-height = "460" class = "table table-bordered table-hover">
	<thead>
		<tr>
			<th data-field = "bNum" class = "text=center">번호</th>
			<th data-field = "title" class = "text=center">제목</th>		
			<th data-field = "content" class = "text=center">내용</th>	
			<th data-field = "regDate" class = "text=center">작성날짜</th>
			<th data-field = "writer" class = "text=center">작성자</th>
		</tr>
		</thead>
	<tbody id = "r_tbody">
	</tbody>
</table>
게시판2 요요
</body>
</html>