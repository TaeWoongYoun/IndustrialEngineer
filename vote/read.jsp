<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</title>
</head>
<body>
<style>
        *{margin: 0; padding: 0;}
        main{width: 1000px; margin: 0 auto;}
        header{width: 100%; height: 80px; background-color: blue; color: #fff; display: flex; align-items: center; justify-content: center;}
        nav{width: 100%; height: 50px; display: flex; align-items: center; background-color: skyblue; color: #fff;}
        nav div{padding: 0 20px;}
        nav div a{color: inherit; text-decoration: none;}
        section{width: 100%; background-color: #fff; padding-bottom:60px;}
        section h2{text-align: center; line-height: 70px;}
        section h4{line-height: 60px;}
        section p{line-height: 20px; padding: 10px;}
        footer{width: 100%; height: 50px; background-color: blue; color: #fff; display: flex; align-items: center; justify-content: center;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{border: 1px solid black; padding: 5px 10px;}
    </style>
    <main>
        <header><h3>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h3></header>
        <nav>
            <div><a href="memberRead.jsp">후보조회</a></div>
            <div><a href="insert.jsp">투표하기</a></div>
            <div><a href="read.jsp">투표검수조회</a></div>
            <div><a href="num.jsp">후보자등수</a></div>
            <div><a href="index.jsp">홈으로</a></div>
        </nav>
        <section>
            <h2>후보조회</h2>
            <table>
			    <tr>
			        <th>성명</th>
			        <th>생년월일</th>
			        <th>나이</th>
			        <th>성별</th>
			        <th>후보번호</th>
			        <th>투표시간</th>
			        <th>유권자확인</th>
			    </tr>
			    <%
				    try {
				        Class.forName ("oracle.jdbc.OracleDriver");
				        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				        Statement stmt = con.createStatement();
				        ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_vote_202005");
				        while(rs.next()) {
				        	String age = rs.getString(1).substring(0, 2);
				        	int newAge = Integer.parseInt(age);
				        	int newnewAge = 100 - newAge + 20;
				            out.println("<tr><td>" + rs.getString(2) + "</td>");
				            out.println("<td>" + "19" + rs.getString(1).substring(0, 2) + "년" + rs.getString(1).substring(2, 4) + "월" + rs.getString(1).substring(4, 6) + "일생" + "</td>");
				            out.println("<td>만 " + newnewAge + "세</td>");
				            out.println("<td>");
				            if (rs.getString(1).substring(6,7).equals("1")) out.println("남");
				            else if (rs.getString(1).substring(6,7).equals("2")) out.println("여");
				            else if (rs.getString(1).substring(6,7).equals("3")) out.println("남");
				            else out.println("여");
				            out.println("</td>");
				            out.println("<td>" + rs.getString(3) + "</td>");
				            out.println("<td>" + rs.getString(4).substring(0,2) + ":" + rs.getString(4).substring(2,4) + "</td>");
				            out.println("<td>");
				            if (rs.getString(6).equals("Y")) out.println("확인");
				            else out.println("미확인");
				            out.println("</td></tr>");
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
            <address>HRDKOREA Copyrightⓒ2015 All right reserved. Human Rosourccs Development Service of Korea</address>
        </footer>
    </main>
</body>
</html>