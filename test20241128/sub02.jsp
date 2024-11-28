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
		<h1>수강생등록조회/수정</h1>
		<table>
	        <tr>
	            <th>수강생번호</th>
	            <th>수강생이름</th>
	            <th>전화번호</th>
	            <th>생년월일</th>
	            <th>자격코드</th>
	            <th>합격여부</th>
	            <th>수정</th>
	        </tr>
	        <%
	        String sno = "";
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery("select * from student");
			        while(rs.next()) {
			        	sno = rs.getString(1);
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + rs.getString(3) + "</td>");
			            out.println("<td>" + rs.getString(4).substring(0, 11) + "</td>");
			            out.println("<td>" + rs.getString(5) + "</td>");
			            if ("1".equals(rs.getString(6))){
			            	out.println("<td>필기합격</td>");
			            } else {
			            	out.println("<td>최종합격</td>");
			            }
			            out.println("<td><a href = 'update.jsp?sno="+sno+"'><button>수정</button></a></td>");
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