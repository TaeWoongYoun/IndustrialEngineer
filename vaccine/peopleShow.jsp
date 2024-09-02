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
            <h3>예방접종이력조회</h3>
            <table>
            	<tr>
                    <th>접종이력<br>번호</th>
                    <th>아이디</th>
                    <th>성명</th>
                    <th>백신코드</th>
                    <th>백신종류</th>
                    <th>백신권장</th>
                    <th>접종<br>일자</th>
                    <th>접종<br>회차</th>
                    <th>접종<br>결과</th>
                    <th>기관이름</th>
                </tr>
            <%
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery("SELECT a.vaccinate_no, a.people_id, c.people_name, a.vaccinate_code, b.vaccines, b.vaccine_recommendation, a.vaccinate_date, a.vaccinate_round, a.vaccinate_result, d.institutional_name FROM tbl_vaccination a LEFT JOIN tbl_vaccine b ON a.vaccinate_code = b.vaccine_code JOIN tbl_people c ON a.people_id = c.people_id JOIN tbl_institutional d ON a.visit_agency = d.visit_agency order by a.vaccinate_no");
			        while(rs.next()) {
			            out.println("<tr><td>" + rs.getString(1) + "</td>");
			            out.println("<td>" + rs.getString(2) + "</td>");
			            out.println("<td>" + rs.getString(3) + "</td>");
			            out.println("<td>" + rs.getString(4) + "</td>");
			            out.println("<td>" + rs.getString(5) + "</td>");
			            out.println("<td>");
			            if ("1".equals(rs.getString(6))) out.println("연령권장");
			            else out.println("위험군권장");
			            out.println("</td>");
			            out.println("<td>" + rs.getString(7) + "</td>");
			            out.println("<td>" + rs.getString(8) + "회차</td>");
			            out.println("<td>");
			            if ("N".equals(rs.getString(9))) out.println("정상");
			            else out.println("이상");
			            out.println("</td>");
			            out.println("<td>" + rs.getString(10) + "</td></tr>");
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