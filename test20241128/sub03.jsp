<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20241128</title>
</head>
<body>
	<style>
		*{padding: 0; margin: 0;}
		header{width: 100%;height: 70px;background-color: #111;text-align: center;align-content: center;color: #fff;}
		nav{width: 100%;height: 50px;background-color: #666;color: #fff;display: flex;}
		nav div{padding: 0 20px; text-align: center; align-content: center;}
		a{color:inherit; text-decoration: none;}
		section{width: 100%;height: calc(100vh - 190px);background-color: #fff;}
		section h1{text-align: center; line-height: 150px;}
		section p{line-height: 70px; padding-left: 20px;}
		section h3{line-height: 50px; padding-left: 20px;}
		section table{border-collapse: collapse; margin: 0 auto;}
        th, td{border: 1px solid black; padding: 5px 10px;text-align: center;}
		footer{width: 100%;height: 70px;background-color: #000;color: #fff;text-align: center;align-content: center;}
	</style>
	<header>
		<h2>자격 관리 프로그램</h2>
	</header>
	<nav>
		<div><a href="sub01.jsp">학생등록</a></div>
		<div><a href="sub02.jsp">학생등록조회/수정</a></div>
		<div><a href="sub03.jsp">자격조회</a></div>
		<div><a href="index.jsp">홈으로</a></div>
	</nav>
	<section>
		<h1>자격 조회</h1>
		<table>
	        <tr>
	            <th>자격코드</th>
	            <th>자격증명</th>
	            <th>필기합격</th>
	            <th>실기합격</th>
	        </tr>
	        <%
	        String sno = "";
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery(" SELECT a.LNO, a.LNAME, count(b.status), count(b.status) FROM licence a LEFT JOIN student b ON a.LNO = b.LINO group by a.LNO, a.LNAME order by a.LNO");
			        while(rs.next()) {
			        	sno = rs.getString(1);
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + rs.getString(3) + "</td>");
			            out.println("<td>" + rs.getString(4) + "</td>");
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