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
	<%
	   	String inno = "";
	    try {
	        Class.forName ("oracle.jdbc.OracleDriver");
	        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	        Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery("SELECT max(inno)+1 FROM institute");
	        rs.next();      	
	        inno = rs.getString(1);
	        stmt.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	%>
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
                <h3>수강생등록</h3>
                <form action="createProcess.jsp" method="get">
				    <table>
				        <tr><th>수강생번호</th><td><input type="text" name="inno" id="inno" value="<%=inno%>"></td></tr>
				        <tr><th>수강생이름</th><td><input type="text" name="inname" id="inname"></td></tr>
				        <tr><th>전화번호</th><td><input type="text" name="tel" id="tel"></td></tr>
				        <tr><th>생년월일</th><td><input type="text" name="bdate" id="bdate"></td></tr>
				        <tr><th>등록코스</th><td>
				            <input type="radio" name="course" value="1" checked> 시스템분석
				            <input type="radio" name="course" value="2"> 전산개론
				            <input type="radio" name="course" value="3"> 마케팅개론
				        </td></tr>
				        <tr><th>등록상태</th><td>
				            <input type="radio" name="status" value="1" checked> 수강
				            <input type="radio" name="status" value="2"> 미수강
				        </td></tr>
				        <tr><th colspan="2"><button type="submit" id="submit">입력</button> <button><a href="update.jsp">조회</a></button></th></tr>
				    </table>
				</form>
            </section>
            <footer>
                <address>HRDKOREA Copyrightⓒ2023</address>
            </footer>
        </main>
    </div>
    
    <script>
	    document.getElementById('submit').addEventListener('click', function(event){
	        const inno = document.getElementById('inno');
	        const inname = document.getElementById('inname');
	        const tel = document.getElementById('tel');
	        const bdate = document.getElementById('bdate');
	
	        if (inno.value === "") {
	            alert('수강생번호가 입력되지 않았습니다')
	            inno.focus();
	            event.preventDefault();
	            return false;
	        } 
	        if (inname.value === "") {
	        	alert('수강생이름이 입력되지 않았습니다')  
	            inname.focus();
	            event.preventDefault();
	            return false;
	        } 
	        if (tel.value === "") {
	        	alert('전화번호가 입력되지 않았습니다')
	            tel.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (bdate.value === "") {
	        	alert('생년월일이 입력되지 않았습니다')
	            bdate.focus();
	            event.preventDefault();
	            return false;
	        }
	    })
	</script>
</body>
</html>