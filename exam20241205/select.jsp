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
        *{padding: 0; margin: 0;}
        header{width: 100%; height: 70px; background-color: #111; color: #fff; text-align: center; align-content: center;}
        nav{width: 100%; height: 50px; display: flex; align-items: center; background-color: #666;}
        nav div{padding: 0 20px;}
        nav div a{text-decoration: none; color: inherit;}
        section{width: 100%; height: calc(100vh - 170px); position: relative;}
        section h2{text-align: center; line-height: 70px;}
        section p{padding-left: 20px; line-height: 50px;}
        section h1{position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%);}
        table{border-collapse: collapse; margin:0 auto;}
        th, td{padding: 10px 20px; border: 1px solid black; text-align:center;}
        .modal{width: 600px; height: 400px; padding: 20px; background-color: #fff; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1;}
        button{padding: 5px 10px; border: 1px solid black; background-color: #fff; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 2;}
        input{width: 200px; float: left;}
        footer{width: 100%; height: 50px; background-color: #111; color: #fff; text-align: center; align-content: center;}
    </style>
    <header><h1>(과정평가형 정보처리산업기사) 배드민턴 코드예약 관리프로그램 ver 2024-11</h1></header>
    <nav>
        <div><a href="sub1.jsp">코트예약</a></div>
        <div><a href="sub2.jsp">코트예약조회</a></div>
        <div><a href="sub3.jsp">사용일수조회</a></div>
        <div><a href="index.jsp">홈으로</a></div>
    </nav>
    <section>
    <h1>코드예약 정보가 존재하지 않습니다.</h1>
        <%
        String read = request.getParameter("read");
			try {
				Class.forName ("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT cust_no FROM tbl_cust_202301 WHERE cust_no = '"+read+"'");
				rs.next();
				if (rs.getString(1) != "") {
		%>
	        <div class="modal">
		        <h2>고객번호:<%=read%>님의 코드예약 조회</h2>   
			    <table>
			        <tr>
			            <th>고객번호</th>
			            <th>이름</th>
			            <th>코트사용일자</th>
			            <th>코트번호</th>
			        </tr>
			        <%
			        String sql = "SELECT a.CUST_NO, a.CUST_NAME, b.RESV_DATE, b.COURT_NO FROM TBL_CUST_202301 a JOIN TBL_RESV_202301 b ON a.CUST_NO = b.CUST_NO WHERE a.CUST_NO = '"+read+"'";
						try {
							Class.forName ("oracle.jdbc.OracleDriver");
							Connection con2 = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							Statement stmt2 = con2.createStatement();
							ResultSet ms = stmt2.executeQuery("SELECT a.CUST_NO, a.CUST_NAME, b.RESV_DATE, b.COURT_NO FROM TBL_CUST_202301 a JOIN TBL_RESV_202301 b ON a.CUST_NO = b.CUST_NO WHERE a.CUST_NO = '"+read+"'");
							while(ms.next()) {
								out.println("<tr><td>" + ms.getString(1) + "</td>");
								out.println("<td>" + ms.getString(2) + "</td>");
								out.println("<td>" + ms.getString(3).substring(0,4) + "년" + ms.getString(3).substring(4,6) + "월" + ms.getString(3).substring(6,8) + "일" +"</td>");
								out.println("<td>" + ms.getString(4) + "</td></tr>");
							}
							stmt.close();
							con.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
			    </table>
	        </div>
					
		<%
				} else {
					out.print("<p></p>");
				}
				out.print(rs.getString(1));
				
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	    <a href='sub2.jsp' class="btn"><button>돌아가기</button></a>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2024 All rights reserved. Human Resources Development Service of Korea</h2></footer>
</body>
</html>