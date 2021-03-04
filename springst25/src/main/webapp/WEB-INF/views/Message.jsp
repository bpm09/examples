<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${data1 } <br>
${data2 } <br>
<fmt:formatDate value="${date }" pattern="yyy년 MM월 dd일 hh시 mm분 ss초" />
</body>
</html>