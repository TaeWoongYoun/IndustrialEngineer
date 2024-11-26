<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자조회</title>
</head>
<body>
	<style>
		*{padding: 0; margin: 0;}
		header{width: 100%;height: 70px;background-color: #111;text-align: center;align-content: center;color: #fff;}
		nav{width: 100%;height: 50px;background-color: #666;color: #fff;display: flex;}
		nav div{padding: 0 20px; text-align: center; align-content: center;}
		nav div a{color:inherit; text-decoration: none;}
		section{width: 100%;height: calc(100vh - 190px);background-color: #fff;display: grid;place-content: center;}
		section h1{text-align: center; line-height: 100px;}
		section p{line-height: 70px; padding-left: 20px;}
		section h3{line-height: 50px; padding-left: 20px;}
		footer{width: 100%;height: 70px;background-color: #000;color: #fff;text-align: center;align-content: center;}
		table{border-collapse: collapse;}
		th,td{border: 1px solid black; padding: 5px 20px; font-size: 24px; text-align: center;}
	</style>
	<header>
		<h2>(과정평가형 정보처리산업기사) 진단검사 프로그램 ver 2020-04</h2>
	</header>
	<nav>
		<div><a href="sub01.jsp">환자조회</a></div>
		<div><a href="sub02.jsp">검사결과입력</a></div>
		<div><a href="sub03.jsp">검사결과조회</a></div>
		<div><a href="sub04.jsp">지역별검사건수</a></div>
		<div><a href="index.jsp">홈으로</a></div>
	</nav>
	<section>
		<h1>환자조회</h1>
		<table>
			<tr>
				<th>환자번호</th>
				<th>환자명</th>
				<th>검사명</th>
				<th>검사시작일</th>
				<th>검사상태</th>
				<th>검사종료일</th>
				<th>검사결과</th>
			</tr>
			<%
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery("SELECT a.P_NO, b.P_NAME, c.T_NAME, a.T_SDATE, a.T_STATUS, a.T_LDATE, a.T_RESULT FROM TBL_RESULT_202004 a JOIN TBL_PATIENT_202004 b ON a.P_NO = b.P_NO JOIN TBL_LAB_TEST_202004 c ON a.T_CODE = c.T_CODE");
			        while(rs.next()) {
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + rs.getString(3) + "</td>"); 
			            out.println("<td>" + rs.getString(4).substring(0, 11)+"</td>");
			            if ("1".equals(rs.getString(5))) {			            	
			            	out.println("<td>검사중</td>");
			            } else {
			            	out.println("<td>검사완료</td>");
			            }
			            out.println("<td>" + rs.getString(6).substring(0, 11)+"</td>");
			            if ("X".equals(rs.getString(7))) {			            	
			            	out.println("<td>미입력</td>");
			            } else if ("P".equals(rs.getString(7))) {
			            	out.println("<td>양성</td>");
			            } else {
			            	out.println("<td>음성</td>");
			            }
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
		<p>HRDKOREA Copyrightⓒ2020 ALL roghts reserved. Human Resources Development Service of Korea</p>
	</footer>
</body>
</html>