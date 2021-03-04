<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
	span {
		width : 100px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="practice.do" method="get">
		<span>번      호 : </span><input type="text" name="number"><br>
		<span>회원이름 : </span><input type="text" name="name"><br>
		<span>상품코드 : </span><input type="text" name="code"><br>
		<span>상품가격 : </span><input type="text" name="price"><br>
		<span>수      량 : </span><input type="text" name="quantity"><br>
		<span>날      짜 : </span>${date}<br>
		<input type="submit" value="제출">
	</form>
</body>
</html>