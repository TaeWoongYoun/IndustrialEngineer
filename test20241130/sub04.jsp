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
		<h1>부서별 주식매수 통계</h1>
	    <table>
	        <tr>
	            <th>부서코드</th>
	            <th>부서명</th>
	            <th>총매수주식수</th>
	            <th>총매수주식금액</th>
	        </tr>
	        <%
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery("SELECT a.DEPT_CODE, a.DEPT_NAME, sum(b.buy_number), sum(b.buy_number * b.buy_price) FROM tbl_dept a JOIN tbl_buy_stock b ON a.dept_code= b.dept_code group by a.dept_code, a.dept_name order by a.dept_code");
			        while(rs.next()) {
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + String.format("%,d", rs.getInt(3)) + "</td>");
			            out.println("<td>" + String.format("%,d", rs.getInt(4)) + "</td>");
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