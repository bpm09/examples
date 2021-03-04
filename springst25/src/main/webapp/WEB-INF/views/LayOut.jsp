<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap { border:1px solid pink; width:1000px; margin:auto;}
	#header { height:50px; background:pink;}
	#footer { height:50px; background:skyblue;}
	#main { margi-top:10px;}
	#main_left { float:left; height:100px; width:250px}
	#main_right { float:left; width:750px}
</style>
</head>
<body>
	<div id="wrap"> <!-- div나 table 또는 html5에서는 header footer nav section article -->
		<div id="header"><%@ include file="sub/header.jsp" %></div>
		<div id="main">
			<div id="main_left"><%@ include file="sub/left.jsp" %></div>
			<div id="main_right"><%@ include file="sub/OSOL_main1.jsp" %></div>
		</div>		
			<div style="clear:both">
		<div id="footer"><%@ include file="sub/footer.jsp" %></div>
		</div>
	</div>
</body>
</html>