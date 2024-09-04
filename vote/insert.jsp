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
        section p{line-height: 30px;}
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
            <h2>투표하기</h2>
            <form action="insertProcess.jsp" method="get">
			    <table>
			        <tr><th>주민번호</th><th><input type="text" name="v_jumin" id="v_jumin">예 : 8906153154726</th></tr>
			        <tr><th>성명</th><th><input type="text" name="v_name" id="v_name"></th></tr>
			        <tr><th>투표번호</th><th>
			            <select name="m_no" id="m_no">
							<option value='' disabled selected></option>
			                <%
							    try {
							        Class.forName ("oracle.jdbc.OracleDriver");
							        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							        Statement stmt = con.createStatement();
							        ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_member_202005");
							        while(rs.next()) {
							            out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
							        }
							        stmt.close();
							        con.close();
							    } catch (Exception e) {
							        e.printStackTrace();
							    }
							%>
			            </select>
			        </th></tr>
			        <tr><th>투표시간</th><th><input type="text" name="v_time" id="v_time"></th></tr>
			        <tr><th>투표장소</th><th><input type="text" name="v_area" id="v_area"></th></tr>
			        <tr><th>유권자확인</th><th>
			            <input type="radio" name="v_confirm" value="Y" checked>확인
			            <input type="radio" name="v_confirm" value="N">미확인
			        </th></tr>
			        <tr><th colspan="2"><button type="submit" id="submit" style="margin-right: 10px;">투표하기</button> <button type="reset" id="reset">다시쓰기</button></th></tr>
			    </table>
			</form>
        </section>
        <footer>
            <address>HRDKOREA Copyrightⓒ2015 All right reserved. Human Rosourccs Development Service of Korea</address>
        </footer>
    </main>
    
    <script>
	    document.getElementById('submit').addEventListener('click', function(event){
	        const v_jumin = document.getElementById('v_jumin');
	        const v_name = document.getElementById('v_name');
	        const m_no = document.getElementById('m_no');
	        const v_time = document.getElementById('v_time');
	        const v_area = document.getElementById('v_area');
	        const v_confirm = document.getElementById('v_confirm');
	        const v_confirm2 = document.getElementById('v_confirm2');
	
	        if (v_jumin.value === "") {
	            alert('주민번호가 입력되지 않았습니다!');
	            v_jumin.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (v_name.value === "") {
	            alert('성명이 입력되지 않았습니다!');
	            v_name.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (m_no.value === "") {
	            alert('후보번호가 입력되지 않았습니다!');
	            m_no.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (v_time.value === "") {
	            alert('투표시간이 입력되지 않았습니다!');
	            v_time.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (v_area.value === "") {
	            alert('투표장소가 입력되지 않았습니다!');
	            v_area.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (v_confirm.value === "") {
	            alert('유권자확인이 선택되지 않았습니다!');
	            v_confirm.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (v_confirm2.value === "") {
	            alert('유권자확인이 선택되지 않았습니다!');
	            v_confirm2.focus();
	            event.preventDefault();
	            return false;
	        }
	    })
	    
	    document.getElementById('reset').addEventListener('click', function(){
	        alert('정보를 지우고 처음부터 다시 입력합니다!');
	        document.getElementById('v_jumin').focus();
	    })
	</script>
</body>
</html>