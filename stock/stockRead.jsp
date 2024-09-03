<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식 매수 관리 프로그램</title>
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
            <h3>주식 종목 조회</h3>
            <table>
			    <tr>
			        <th>종목코드</th>
			        <th>종목명</th>
			        <th>종목시장</th>
			        <th>업종</th>
			        <th>상장일</th>
			    </tr>
			    <%
				    try {
				        Class.forName ("oracle.jdbc.OracleDriver");
				        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				        Statement stmt = con.createStatement();
				        ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_stock_item");
				        while(rs.next()) {
				        	out.println("<tr><td>" + rs.getString(1) + "</td>");
				            out.println("<td>" + rs.getString(2) + "</td>");
				            out.println("<td>" + rs.getString(3) + "</td>");
				            out.println("<td>" + rs.getString(4) + "</td>");
				            out.println("<td>" + rs.getString(5).substring(0, 4) + "년" + rs.getString(5).substring(5, 6) + "월" + rs.getString(5).substring(7, 8) + "일" + "</td></tr>");          
				        }
				        stmt.close();
				        con.close();
				    } catch (Exception e) {
				        e.printStackTrace();
				    }
				%>
			</table>
        </section>
        <footer>
            <address>HRDKOREA Copyright©2023</address>
        </footer>
    </main>
</body>
</html>