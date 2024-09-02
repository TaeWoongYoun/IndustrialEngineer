<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예방접종 프로그램</title>
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
        th{background-color: #9fffff;}
    </style>
    <main>
        <header><h1>과정평가형 정보처리산업기사(v4.0) 예방접종관리 프로그램</h1></header>
        <nav>
            <div><a href="vaccineShow.jsp">백신정보조회</a></div>
            <div><a href="create.jsp">예방접종이력등록</a></div>
            <div><a href="peopleShow.jsp">예방접종이력조회</a></div>
            <div><a href="data.jsp">예방접종통계</a></div>
            <div><a href="index.jsp">홈으로</a></div>
        </nav>
        <section>
            <h3>예방접종통계</h3>
            <table>
            	<tr>
                    <th>백신코드</th>
                    <th>대상감염병</th>
                    <th>백신종류</th>
                    <th>정상접종횟수</th>
                </tr>
            <%
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery("SELECT a.vaccine_code, a.infectious_disease, a.vaccines, sum(b.vaccinate_round) FROM tbl_vaccine a right JOIN tbl_vaccination b ON a.vaccine_code = b.vaccinate_code group by a.vaccine_code, a.infectious_disease, a.vaccines order by a.vaccine_code");
			        while(rs.next()) {
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + rs.getString(3) + "</td>");
			            out.println("<td>" + rs.getString(4) + "회</td>");
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
            <address>
                HRDKOREA Copyright©2023 All rights reserved. Human Resources Development Service of Korea
            </address>
        </footer>
    </main>
</body>
</html>