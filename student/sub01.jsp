<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정평가형 정보처리산업기사(v4.0) 성적관리 프로그램 ver2022-05</title>
</head>
<body>
	<style>
		*{margin:0 ; padding: 0;}
        main{width: 1000px; margin: 0 auto;}
        header{width: 100%; height: 70px; background-color: blue; color: #fff; text-align: center; line-height: 70px;}
        nav{width: 100%; height: 50px; display: flex; align-items: center; background-color: skyblue;}
        nav div{padding: 0 20px;}
        nav a{text-decoration: none; color: inherit;}
        section{width: 100%; padding-bottom: 100px;}
        section h2{line-height: 70px; text-align: center;}
        section p{padding: 5px 0;}
        footer{width: 100%; height: 50px; background-color: blue; color: #fff; text-align: center; line-height: 50px;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{border: 1px solid black; text-align: center; padding: 5px 10px;}
    </style>

    <main>
        <header><h2>과정평가형 정보처리산업기사(v4.0) 성적관리 프로그램 ver2022-05</h2></header>
        <nav>
            <div><a href="sub01.jsp">전체성적조회</a></div>
            <div><a href="sub02.jsp">개인성적등록</a></div>
            <div><a href="sub03.jsp">개인별성적통계</a></div>
            <div><a href="index.jsp">홈으로</a></div>
        </nav>
        <section>
            <h2>전체성적조회</h2>
            <table>
			    <tr>
			        <th>학번</th>
			        <th>성명</th>
			        <th>성별</th>
			        <th>과목명</th>
			        <th>전공구분</th>
			        <th>담당교수</th>
			        <th>중간</th>
			        <th>기말</th>
			        <th>출석</th>
			        <th>레포트</th>
			        <th>기타</th>
			        <th>점수</th>
			        <th>등급</th>
			    </tr>
            	<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT a.studentid, a.studentname, a.jumin, c.subjectname, c.classification, c.professorname, b.mid, b.final, b.attend, b.report, b.etc,  sum(b.mid*0.3 + b.final*0.3 + b.attend*0.2 + b.report*0.1 + b.etc*0.1) FROM tbl_student_202205 a JOIN tbl_grade_202205 b ON a.studentid = b.studentid JOIN tbl_subject_202205 c ON b.subjectcode = c.subjectcode group by a.studentid, a.studentname, a.jumin, c.subjectname, c.classification, c.professorname, b.mid, b.final, b.attend, b.report, b.etc order by c.subjectname, a.studentid");
						while(rs.next()) {
							out.println("<tr><td>" + rs.getString(1) + "</td>");
							out.println("<td>" + rs.getString(2) + "</td>");
							out.println("<td>");
							if (rs.getString(3).substring(7,8).equals("1")) out.println("남");
							else if (rs.getString(3).substring(7,8).equals("2")) out.println("여");
							else if (rs.getString(3).substring(7,8).equals("3")) out.println("남");
							else out.println("여");
							out.println("</td>");
							out.println("<td>" + rs.getString(4) + "</td>");
							out.println("<td>");
							if (rs.getString(5).equals("01")) out.println("전공필수");
							else if (rs.getString(5).equals("02")) out.println("전공선택");
							else if (rs.getString(5).equals("03")) out.println("교양필수");
							else out.println("교양선택");
							out.println("<td>" + rs.getString(6) + "</td>");
							out.println("<td>" + rs.getString(7) + "</td>");
							out.println("<td>" + rs.getString(8) + "</td>");
							out.println("<td>" + rs.getString(9) + "</td>");
							out.println("<td>" + rs.getString(10) + "</td>");
							out.println("<td>" + rs.getString(11) + "</td>");
							out.println("<td>" + rs.getString(12) + "</td>");
							out.println("<td>");
							if (rs.getInt(12) >= 90) out.println("A");
							else if (rs.getInt(12) >= 80) out.println("B");
							else if (rs.getInt(12) >= 70) out.println("C");
							else if (rs.getInt(12) >= 60) out.println("D");
							else out.println("F");
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
        <footer><h4>HRDKOREA Copyrightⓒ2022 All right reserved. Human Resources Development Service of Korea</h4></footer>
    </main>
</body>
</html>
