<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <style>
        *{margin: 0;padding: 0;}
        header{width: 100%; height: 70px; background-color: black; color: #fff; text-align: center; align-content: center;}
        nav{width: 100%; height: 50px; background-color: #777; color: #fff; display: flex;}
        nav div{padding: 0 20px; align-content: center;}
        a{text-decoration: none; color: inherit;}
        section{width: 100%; height: calc(100vh - 170px); background-color: #fff;}
        section h2{line-height: 100px; text-align: center;}
        footer{width: 100%; height: 50px; background-color: black; color: #fff; text-align: center; align-content: center;}
    </style>
    <header>
        <h1>골프연습장 회원관리 프로그램 ver 1.0</h1>
    </header>
    <nav>
        <div><a href="sub1.jsp">강사조회</a></div>
        <div><a href="sub2.jsp">수강신청</a></div>
        <div><a href="sub3.jsp">학원정보조회</a></div>
        <div><a href="sub4.jsp">강사매출현황</a></div>
        <div><a href="index.jsp">홈으로</a></div>
    </nav>
    <section>
        <h2>골프연습장 회원관리 프로그램</h2>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2015 All right reserved.</h2></footer>
</body>
</html>