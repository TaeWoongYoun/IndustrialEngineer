<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 관리 프로그램</title>
</head>
<body>
    <style>
        *{margin: 0; padding: 0;}
        .wrap{width: 100%; height: 100vh; display: flex; align-items: center; justify-content: center;}
        main{width: 1000px;}
        header{width: 100%; height: 70px; background-color: #6666FF; color: #fff; text-align: center; line-height: 70px;}
        nav{width: 100%; height: 50px; display: flex; align-items: center; background-color: skyblue; color: #fff;}
        nav div{padding: 0 30px;}
        nav div a{text-decoration: none; color: inherit;}
        section{width: 100%; padding-bottom: 40px; background-color: #fff;}
        section h3{line-height: 70px; text-align: center;}
        section p{padding: 10px;}
        footer{width: 100%; height: 50px; text-align: center; line-height: 50px; background-color: #6666FF; color: #fff;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{padding: 5px 10px; border: 1px solid black;}
    </style>

    <div class="wrap">
        <main>
            <header><h2>학원 관리 프로그램</h2></header>
            <nav>
                <div><a href="create.jsp">수강생등록</a></div>
                <div><a href="update.jsp">수강생등록조회/수정</a></div>
                <div><a href="read.jsp">코스조회</a></div>
                <div><a href="index.jsp">홈으로</a></div>
            </nav>
            <section>
                <h3>학원관리프로그램</h3>
                <p>학원관리프로그램의 데이터베이스를 구축하고 수강생을 관리하는 프로그램을 작성한다.</p>
                <p>프로그램 작성 순서</p>
                <p>1. 데이터베이스 테이블을 생성한다.</p>
                <p>2. 데이터베이스 테이블에 데이터를 생성한다.</p>
                <p>3. 학원관리 프로그램을 작성한다.</p>
            </section>
            <footer>
                <address>HRDKOREA Copyrightⓒ2023</address>
            </footer>
        </main>
    </div>
</body>
</html>