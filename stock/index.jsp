<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예방접종 프로그램</title>
</head>
<body>
    <style>
        *{padding: 0; margin: 0;}
        main{width: 1000px; margin: 0 auto;}
        header{width: 100%; height: 70px; background-color: #6666FF; color: #fff; display: flex; align-items: center; justify-content: center;}
        nav{width: 100%; height: 50px; background-color: skyblue; color: #fff; display: flex; align-items: center;}
        nav div{padding: 0 20px;}
        nav div a{text-decoration: none; color: inherit;}
        section{width: 100%; background-color: #fff; padding-bottom: 20px;}
        section h3{text-align: center; line-height: 80px;}
        section p{padding: 10px;}
        footer{width: 100%; height: 50px; background-color: #6666FF; color: #fff; text-align: center; line-height: 50px;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{padding: 5px 10px; border: 1px solid black;}
    </style>
    <main>
        <header><h1>주식 매수 관리 프로그램</h1></header>
        <nav>
            <div><a href="stockRead.jsp">주식종목조회</a></div>
            <div><a href="create.jsp">주식매수등록</a></div>
            <div><a href="buyRead.jsp">주식매수내역조회</a></div>
            <div><a href="data.jsp">부서별주식매수통계</a></div>
            <div><a href="index.jsp">홈으로</a></div>
        </nav>
        <section>
            <h3>주식 매수 관리 프로그램</h3>
            <p>주식 매수 관리 프로그램의 데이터베이스를 구축하고 관리하는 프로그램을 작성한다.</p>
            <p>프로그램 작성 순서</p>
            <p>1. 데이터베이스 테이블을 생성한다.</p>
            <p>2. 데이터베이스 테이블에 데이터를 생성한다.</p>
            <p>3. 프로그램을 작성한다.</p>
        </section>
        <footer>
            <address>HRDKOREA Copyright©2023</address>
        </footer>
    </main>
</body>
</html>