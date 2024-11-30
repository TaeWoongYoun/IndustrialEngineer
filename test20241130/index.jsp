<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20241130</title>
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
		<h2>주식 매수 관리 프로그램</h2>
	</header>
	<nav>
		<div><a href="sub01.jsp">주식종목조회</a></div>
		<div><a href="sub02.jsp">주식매수등록</a></div>
		<div><a href="sub03.jsp">주식매수내역조회</a></div>
		<div><a href="sub04.jsp">부서별주식매수통계</a></div>
		<div><a href="index.jsp">홈으로</a></div>
	</nav>
	<section>
		<h1>주식 매수 관리 프로그램</h1>
		<p>주식 매수 관리 프로그램의 데이터베이스를 구축하고 학생을 관리하는 프로그램을 작성한다</p>
		<p>프로그램 작성 순서</p>
		<h3>1. 데이터베이스 테이블을 작성한다.</h3>
		<h3>2. 데이터베이스 테이블에 데이터를 생성한다.</h3>
		<h3>3. 프로그램을 작성한다.</h3>
	</section>
	<footer>
		<p>HRDKOREA Copyrightⓒ2023</p>
	</footer>
</body>
</html>