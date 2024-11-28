<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20241128</title>
</head>
<body>
	<style>
		*{padding: 0; margin: 0;}
		header{width: 100%;height: 70px;background-color: #111;text-align: center;align-content: center;color: #fff;}
		nav{width: 100%;height: 50px;background-color: #666;color: #fff;display: flex;}
		nav div{padding: 0 20px; text-align: center; align-content: center;}
		nav div a{color:inherit; text-decoration: none;}
		section{width: 100%;height: calc(100vh - 190px);background-color: #fff;}
		section h1{text-align: center; line-height: 150px;}
		section p{line-height: 70px; padding-left: 20px;}
		section h3{line-height: 50px; padding-left: 20px;}
		footer{width: 100%;height: 70px;background-color: #000;color: #fff;text-align: center;align-content: center;}
	</style>
	<header>
		<h2>자격 관리 프로그램</h2>
	</header>
	<nav>
		<div><a href="sub01.jsp">학생등록</a></div>
		<div><a href="sub02.jsp">학생등록조회/수정</a></div>
		<div><a href="sub03.jsp">자격조회</a></div>
		<div><a href="index.jsp">홈으로</a></div>
	</nav>
	<section>
		<h1>자격관리 프로그램</h1>
		<p>자격 관리프로그램의 데이터베이스를 구축하고 학생을 관리하는 프로그램을 작성한다</p>
		<p>프로그램 작성 순서</p>
		<h3>1. 데이터베이스 테이블을 작성한다.</h3>
		<h3>2. 데이터베이스 테이블에 데이터를 생성한다.</h3>
		<h3>3. HTML, CSS, J/S, JSP 프로그램을 작성한다.</h3>
	</section>
	<footer>
		<p>HRDKOREA Copyrightⓒ2023</p>
	</footer>
</body>
</html>