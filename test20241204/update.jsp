<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <style>
        *{margin: 0;padding: 0;}
        header{width: 100%; height: 70px; background-color: black; color: #fff; text-align: center; align-content: center;}
        nav{width: 100%; height: 50px; background-color: #777; color: #fff; display: flex;}
        nav div{padding: 0 20px; align-content: center;}
        a{text-decoration: none; color: inherit;}
        section{width: 100%; height: calc(100vh - 170px); background-color: #fff;}
        section h2{line-height: 100px; text-align: center;}
        table{border-collapse: collapse; margin: 0 auto;}
		th, td{padding: 5px 10px; border: 1px solid black;}
        input{width: 200px; padding-left: 10px;}
        select{width: 210px;}
        button{padding: 5px 10px; margin: 0 5px;}
        footer{width: 100%; height: 50px; background-color: black; color: #fff; text-align: center; align-content: center;}
    </style>
    <header>
        <h1>골프연습장 회원관리 프로그램 ver 1.0</h1>
    </header>
    <nav>
        <div><a href="sub1.jsp">강사조회</a></div>
        <div><a href="sub2.jsp">수강신청</a></div>
        <div><a href="sub3.jsp">학원정보조회</a></div>
        <div><a href="sub4.jsp">강사매출현황</a></div>
        <div><a href="index.jsp">홈으로</a></div>
    </nav>
    <section>
        <h2>강사조회</h2>
		<form action="updateProcess.jsp">
			<table>
		        <tr>
		            <th>강사코드</th>
		            <th>강사명</th>
		            <th>강의명</th>
		            <th>수강료</th>
		            <th>강사자격취득일</th>
		            <th>등록</th>
		        </tr>
		        	<%
					String teacher_code = request.getParameter("id");
		        	String teacher_name = "";
		        	String class_name = "";
		        	String class_price = "";
		        	String teacher_regist_date = "";
						try {
							Class.forName ("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_teacher_202201 WHERE teacher_code = '"+teacher_code+"'");
							while(rs.next()) {
								teacher_name = rs.getString(2);
								class_name = rs.getString(3);
								class_price = rs.getString(4);
								teacher_regist_date = rs.getString(5);
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				<tr>
					<td><input type="text" value='<%=teacher_code%>' name='teacher_code'></td>
					<td><input type="text" value='<%=teacher_name%>' name='teacher_name'></td>
					<td><input type="text" value='<%=class_name%>' name='class_name'></td>
					<td><input type="text" value='<%=class_price%>' name='class_price'></td>
					<td><input type="text" value='<%=teacher_regist_date%>' name='teacher_regist_date'></td>
					<td><button type='submit'>수정</button></td>
				</tr>
		    </table>
		</form>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2015 All right reserved.</h2></footer>
</body>
</html>