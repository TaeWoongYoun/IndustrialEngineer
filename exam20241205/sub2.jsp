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
        table{border-collapse: collapse; margin:0 auto;}
        th, td{padding: 10px 20px; border: 1px solid black;}
        button{padding: 5px 10px; border: 1px solid black; background-color: #fff;}
        input{width: 200px; float: left;}
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
        <h2>코트예약</h2>
        <form action="select.jsp">
	        <table>
	            <tr>
	                <th>고객번호를 입력하시오.</th>
	                <td><input type="text" name="read" id="read"></td>
	            </tr>
	            <tr>
	                <th colspan="2">
	                    <button type="submit" id="submit">코트예약조회</button>
	                    <a href="index.jsp"><button type="button">홈으로</button></a>
	                </th>
	            </tr>
	        </table>
	    </form>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2024 All rights reserved. Human Resources Development Service of Korea</h2></footer>

    <script>
	    const read = document.getElementById('read');
	
	    document.getElementById('submit').addEventListener('click', (e) => {
	        if (read.value === ""){
	            alert("고객번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            read.focus();
	            return false;
	        }
	    })
    </script>
</body>
</html>