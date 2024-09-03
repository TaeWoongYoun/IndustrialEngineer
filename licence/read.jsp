<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격 관리 프로그램</title>
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
        th, td{padding: 5px 10px; border: 1px solid black; text-align: center;}
    </style>
    <main>
        <header><h1>자격 관리 프로그램</h1></header>
        <nav>
            <div><a href="insert.jsp">학생등록</a></div>
            <div><a href="read.jsp">학생등록조회/수정</a></div>
            <div><a href="select.jsp">자격조회</a></div>
            <div><a href="index.jsp">홈으로</a></div>
        </nav>
        <section>
            <h3>수강생등록</h3>
		    <form action="insertProcess.jsp" method="get">
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
					        ResultSet rs = stmt.executeQuery("SELECT * FROM student");
					        while(rs.next()) {
					        	sno = rs.getString(1);
					        	out.println("<tr><td>" + rs.getString(1) + "</td>");
					        	out.println("<td>" + rs.getString(2) + "</td>");
					        	out.println("<td>" + rs.getString(3) + "</td>");
					        	out.println("<td>" + rs.getString(4).substring(0, 10) + "</td>");
					        	out.println("<td>" + rs.getString(5) + "</td>");
					        	out.println("<td>");
					        	if (rs.getString(6).equals("1")) out.print("필기합격");
					        	else out.print("최종합격");
					        	out.println("</td>");
					        	out.println("<td><a href='update.jsp?sno="+sno+"'>수정</a></td></tr>");
					        }
					        stmt.close();
					        con.close();
					    } catch (Exception e) {
					        e.printStackTrace();
					    }
					%>
		        </table>
		    </form>
        </section>
        <footer>
            <address>HRDKOREA Copyright©2023</address>
        </footer>
    </main>
</body>
</html>