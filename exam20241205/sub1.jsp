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
        <form action="sub1Process.jsp">
	        <table>
	            <tr>
	                <th>예약번호</th>
	                <td><input type="text" name="resv_no" id="resv_no">예)20230001</td>
	            </tr>
	            <tr>
	                <th>고객번호</th>
	                <td><input type="text" name="cust_no" id="cust_no">예)1001</td>
	            </tr>
	            <tr>
	                <th>예약일자</th>
	                <td><input type="text" name="resv_date" id="resv_date">예)20230101</td>
	            </tr>
	            <tr>
	                <th>코트번호</th>
	                <td><input type="text" name="court_no" id="court_no">예)C001~C009</td>
	            </tr>
	            <tr>
	                <th colspan="2">
	                    <button type="submit" id="submit">예약등록</button>
	                    <button type="reset" id="reset">다시쓰기</button>
	                </th>
	            </tr>
	        </table>
	    </form>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2024 All rights reserved. Human Resources Development Service of Korea</h2></footer>
    
    <script>
	    const resv_no = document.getElementById('resv_no');
	    const resv_date = document.getElementById('resv_date');
	    const court_no = document.getElementById('court_no');
	    const cust_no = document.getElementById('cust_no');
	
	    document.getElementById('submit').addEventListener('click', (e) => {
	        if (resv_no.value === ""){
	            alert("예약번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            resv_no.focus();
	            return false;
	        }
	        if (cust_no.value === ""){
	            alert("고객번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            cust_no.focus();
	            return false;   
	        }
	        if (resv_date.value === ""){
	            alert("예약일자가 입력되지 않았습니다!");
	            e.preventDefault();
	            resv_date.focus();
	            return false;   
	        }
	        if (court_no.value === ""){
	            alert("코트번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            court_no.focus();
	            return false;   
	        }
	        
	    })
	
	    document.getElementById('reset').addEventListener('click', () => {
	        alert("정보를 지우고 처음부터 다시 입력합니다.");
	        resv_no.focus();
	    })
    </script>
</body>
</html>