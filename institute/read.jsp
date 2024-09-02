<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSTITUTE</title>
</head>
<body>
	<style>
        *{margin: 0; padding: 0;}
        .wrap{width: 100%; height: 100vh; display: flex; align-items: center; justify-content: center;}
        main{width: 1000px;}
        header{width: 100%; height: 70px; background-color: #6666FF; color: #fff; text-align: center; line-height: 70px;}
        nav{width: 100%; height: 50px; display: flex; align-items: center; background-color: skyblue; color: #fff;}
        nav div{padding: 0 30px;}
        a{text-decoration: none; color: inherit;} 
        section{width: 100%; padding-bottom: 40px; background-color: #fff;}
        section h3{line-height: 70px; text-align: center;}
        section p{padding: 10px;}
        footer{width: 100%; height: 50px; text-align: center; line-height: 50px; background-color: #6666FF; color: #fff;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{padding: 5px 10px; border: 1px solid black;}
    </style>
    <div class="wrap">
        <main>
            <header><h2>학원 관리 프로그램</h2></header>
            <nav>
                <div><a href="create.jsp">수강생등록</a></div>
                <div><a href="update.jsp">수강생등록조회/수정</a></div>
                <div><a href="read.jsp">코스조회</a></div>
                <div><a href="index.jsp">홈으로</a></div>
            </nav>
            <section>
                <h3>수강생등록조회/수정</h3>
                <table>
				    <tr>
				        <th>코스코드</th>
				        <th>교수</th>
				        <th>코스이름</th>
				        <th>등록수강생</th>
				        <th>운영상태</th>
				    </tr>
				    <%
					    try {
					        Class.forName ("oracle.jdbc.OracleDriver");
					        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					        Statement stmt = con.createStatement();
					        ResultSet rs = stmt.executeQuery("SELECT b.course, b.teacher, b.cname, count(a.course), a.status, b.status FROM institute a JOIN course b ON a.course = b.course GROUP by b.course, b.teacher, b.cname, a.status, b.status ORDER BY b.course");
					        while(rs.next()) {
					            if (rs.getString(5).equals("1")) {
					                out.println("<tr><td>" + rs.getString(1) + "</td>");
					                out.println("<td>" + rs.getString(2) + "</td>");
					                out.println("<td>" + rs.getString(3) + "</td>");
					                out.println("<td>" + rs.getString(4) + "</td>");
					                out.println("<td>" + rs.getString(6) + "</td></tr>");
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
                <address>HRDKOREA Copyrightⓒ2023</address>
            </footer>
        </main>
    </div>
</body>
</html>