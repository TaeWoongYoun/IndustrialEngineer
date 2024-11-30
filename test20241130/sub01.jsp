<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
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
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{border: 1px solid black; padding: 5px 10px;}
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
		<h1>주식 종목 조회</h1>
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
			        ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_STOCK_ITEM");
			        while(rs.next()) {
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + rs.getString(3) + "</td>");
			            out.println("<td>" + rs.getString(4) + "</td>");
			            out.println("<td>" + rs.getString(5).substring(0, 4) + "년" + rs.getString(5).substring(4, 6) + "월" + rs.getString(5).substring(6, 8) + "일" + "</td></tr>");
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
		<p>HRDKOREA Copyrightⓒ2023</p>
	</footer>
</body>
</html>