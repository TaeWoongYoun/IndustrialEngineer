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
        section{width: 100%; height: calc(100vh - 170px);}
        section h2{text-align: center; line-height: 70px;}
        section p{padding-left: 20px; line-height: 50px;}
        table{border-collapse: collapse; margin:0 auto;}
        th, td{padding: 10px 20px; border: 1px solid black; text-align:center;}
        button{padding: 5px 10px; border: 1px solid black; background-color: #fff;}
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
        <h2>사용일수집계</h2>   
	    <table>
	        <tr>
	            <th>고객번호</th>
	            <th>이름</th>
	            <th>사용일수</th>
	        </tr>
	        <%
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT a.CUST_NO, a.CUST_NAME, count(b.RESV_NO) FROM TBL_CUST_202301 a JOIN TBL_RESV_202301 b ON a.CUST_NO = b.CUST_NO GROUP BY a.CUST_NO, a.CUST_NAME ORDER BY a.CUST_NO");
					while(rs.next()) {
						out.println("<tr><td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td></tr>");
					}
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
	    </table>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2024 All rights reserved. Human Resources Development Service of Korea</h2></footer>
    
    <script>
	    const resv_no = document.getElementById('resv_no');
	    const resv_date = document.getElementById('resv_date');
	    const court_no = document.getElementById('court_no');
	    const cust_no = document.getElementById('cust_no');
	
	    document.getElementById('submit').addEventListener('click', (e) => {
	        if (resv_no.value === ""){
	            alert("예약번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            resv_no.focus();
	            return false;
	        }
	        if (cust_no.value === ""){
	            alert("고객번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            cust_no.focus();
	            return false;   
	        }
	        if (resv_date.value === ""){
	            alert("예약일자가 입력되지 않았습니다!");
	            e.preventDefault();
	            resv_date.focus();
	            return false;   
	        }
	        if (court_no.value === ""){
	            alert("코트번호가 입력되지 않았습니다!");
	            e.preventDefault();
	            court_no.focus();
	            return false;   
	        }
	        
	    })
	
	    document.getElementById('reset').addEventListener('click', () => {
	        alert("정보를 지우고 처음부터 다시 입력합니다.");
	        resv_no.focus();
	    })
    </script>
</body>
</html>