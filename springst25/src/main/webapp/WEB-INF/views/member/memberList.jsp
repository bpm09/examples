<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<style>
	td {
		border : 2px solid lightgray;
		height : 30px;
	}
	table {
		border : 2px solid lightgray;
		width : 1100px;
		text-align:center
	}
	th {
		border : 2px solid lightgray;
		height : 40px;
		background : lightgray;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<th>아이디</th>
	<th>이름</th>
	<th>이메일</th>
	<th>성별</th>
	<th>나이</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>가입일자</th>
	<th>삭제</th>
	<th>수정</th>
</tr>
<c:forEach var="member" items="${memberList}">
	<tr>
		<td><a href="memberView.do?id=${member.id }">${member.id }</a></td>
		<td>${member.name }</td>
		<td>${member.email }</td>
		<td>${member.gender }</td>
		<td>${member.age }</td>
		<td>${member.phone }</td>
		<td>${member.address }</td>
		<td><fmt:formatDate value ="${member.enrollDate }" pattern="yy/MM/dd HH:mm:ss"></fmt:formatDate></td>
		<td><a href="memberDelete.do?id=${member.id }" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
		<td><a href="updateBridge.do?id=${member.id }">수정</a></td>
	</tr>
</c:forEach>


</table>
<br>
<a href="WirteBridge.do" class="btn btn-primary btn-lg">회원등록</a>

</body>
</html>