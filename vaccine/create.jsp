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
        input{padding-left: 10px; border: 1px solid black;}
        button{padding: 5px 10px; background-color: #fff; border: 1px solid black;}
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
            <h3>예방접종이력 공부</h3>
            <%
            	String number = "";
			    try {
			        Class.forName ("oracle.jdbc.OracleDriver");
			        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			        Statement stmt = con.createStatement();
			        ResultSet rs = stmt.executeQuery("SELECT max(vaccinate_no) FROM tbl_vaccination");
			        if(rs.next()) {
			            number = rs.getString(1);
		                String numbericPart = number.substring(1);
		                int numbericValue = Integer.parseInt(numbericPart) + 1;
		                number = "A0" + numbericValue;
			        }
			        rs.close();
			        stmt.close();
			        con.close();
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			%>
            	<form action="createProcess.jsp">
	            <table>
	            	<tr><th>접종이력번호</th><td><input type="text" name="vaccinate_no" id="vaccinate_no" value="<%=number%>"> 예) A001</td></tr>
	            	<tr><th>아이디</th><td><select name="people_id" id="people_id">
					    <option value="" disabled selected>아이디선택</option>
						<%
						    try {
						        Class.forName ("oracle.jdbc.OracleDriver");
						        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						        Statement stmt = con.createStatement();
						        ResultSet rs = stmt.executeQuery("SELECT DISTINCT PEOPLE_ID FROM tbl_vaccination order by PEOPLE_ID");
						        while(rs.next()) {
						            out.println("<option value='"+rs.getString(1)+"'>" + rs.getString(1) + "</option>");
						        }
						        stmt.close();
						        con.close();
						    } catch (Exception e) {
						        e.printStackTrace();
						    }
						%>
					</select> 예) C001</td></tr>
					<tr><th>백신코드</th><td>
					<select name="vaccinate_code" id="vaccinate_code">
					<option value="" disabled selected>백신코드</option>
						<%
						    try {
						        Class.forName ("oracle.jdbc.OracleDriver");
						        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						        Statement stmt = con.createStatement();
						        ResultSet rs = stmt.executeQuery("SELECT VACCINE_CODE, INFECTIOUS_DISEASE FROM TBL_VACCINE");
						        while(rs.next()) {
						            out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
						        }
						        stmt.close();
						        con.close();
						    } catch (Exception e) {
						        e.printStackTrace();
						    }
						%>
					</select> 예) [V007] 홍역</td></tr>
					<tr><th>접종일자</th><td><input type="text" name="vaccinate_date" id="vaccinate_date"> 예) 230701</td></tr>
					<tr><th>접종회차</th><td><input type="text" name="vaccinate_round" id="vaccinate_round"> 예) 1</td></tr>
	            	<tr><th>접종결과</th><td><select name="vaccinate_result" id="vaccinate_result">
					    <option value="" disabled selected>접종결과</option>
					    <option value="N">[N] 정상</option>
					    <option value="A">[A] 이상</option>
					</select> 예) [N] 정상</td></tr>
					<tr><th>기관코드</th><td><select name="visit_agency" id="visit_agency`">
					    <option value="" disabled selected>기관선택</option>
					    <%
						    try {
						        Class.forName ("oracle.jdbc.OracleDriver");
						        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						        Statement stmt = con.createStatement();
						        ResultSet rs = stmt.executeQuery("SELECT VISIT_AGENCY FROM TBL_INSTITUTIONAL");
						        while(rs.next()) {
						            out.println("<option value='"+rs.getString(1)+"'>" + rs.getString(1) + "</option>");
						        }
						        stmt.close();
						        con.close();
						    } catch (Exception e) {
						        e.printStackTrace();
						    }
						%>
					</select> 예) B023</td></tr>
					<tr><td colspan="2">
					<button type="submit">등록</button>
					<button type="reset">다시쓰기</button>
					</td></tr>
	            </table>
            	</form>
        </section>
        <footer>
            <address>
                HRDKOREA Copyright©2023 All rights reserved. Human Resources Development Service of Korea
            </address>
        </footer>
    </main>
</body>
</html>