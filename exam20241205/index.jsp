<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
        *{padding: 0; margin: 0;}
        header{width: 100%; height: 70px; background-color: #111; color: #fff; text-align: center; align-content: center;}
        nav{width: 100%; height: 50px; display: flex; align-items: center; background-color: #666;}
        nav div{padding: 0 20px;}
        nav div a{text-decoration: none; color: inherit;}
        section{width: 100%; height: calc(100vh - 170px);}
        section h2{text-align: center; line-height: 70px;}
        section p{padding-left: 20px; line-height: 50px;}
        footer{width: 100%; height: 50px; background-color: #111; color: #fff; text-align: center; align-content: center;}
    </style>
    <header><h1>(과정평가형 정보처리산업기사) 배드민턴 코드예약 관리프로그램 ver 2024-11</h1></header>
    <nav>
        <div><a href="sub1.jsp">코트예약</a></div>
        <div><a href="sub2.jsp">코트예약조회</a></div>
        <div><a href="sub3.jsp">사용일수조회</a></div>
        <div><a href="index.jsp">홈으로</a></div>
    </nav>
    <section>
        <h2>과정평가형 자격 CBQ</h2>
        <p>국가직무능력표준(NCS:National Competency Standards)으로 설계된 교육.훈련 과정을 충실히 이수한 후 내.외부 평가를 거쳐 합격 기준을 충족하는 교육.훈련생에게 국가기술자격을 부여하는 제도</p>
        <p>산업현장 중심의 교육 평가로 더 커지는 능력!</p>
        <p>알고 있는 것에 할 수 있는 것을 더하는</p>
        <p>과정형평가 자격은</p>
        <p>현장 중심형 인재육성을 지원합니다</p>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2024 All rights reserved. Human Resources Development Service of Korea</h2></footer>
</body>
</html>