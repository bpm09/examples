<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<tr>
		<th>이름</th>
		<th>이메일</th>
		<th>성별</th>
		<th>나이</th>
		<th>휴대폰</th>
		<th>주소</th>
		<th>가입일자</th>
	</tr>
	
	<tr>
		<td>${member.name}</td>
		<td>${member.email }</td>
		<td>${member.gender }</td>
		<td>${member.age }</td>
		<td>${member.phone }</td>
		<td>${member.address }</td>
		<td>${member.enrollDate }</td>
	</tr>
</table>





</body>
</html>