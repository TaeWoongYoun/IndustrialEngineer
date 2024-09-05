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
        section{width: 100%; padding-bottom: 50px;}
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
            <h2>개인성적등록</h2>
            <form action="sub02Process.jsp" method="get">
			    <table>
			        <tr><th>학번</th><td><input type="text" name="studentid" id="studentid"></td></tr>
			        <tr><th>과목코드</th><td><input type="text" name="subjectcode" id="subjectcode">예)S001</td></tr>
			        <tr><th>중간(30%)(0~100)</th><td><input type="text" name="mid" id="mid">점</td></tr>
			        <tr><th>기말(30%)(0~100)</th><td><input type="text" name="final2" id="final">점</td></tr>
			        <tr><th>출석(20%)(0~100)</th><td><input type="text" name="attend" id="attend">점</td></tr>
			        <tr><th>레포트(10%)(0~100)</th><td><input type="text" name="report" id="report">점</td></tr>
			        <tr><th>기타(10%)(0~100)</th><td><input type="text" name="etc" id="etc">점</td></tr>
			        <tr><td colspan="2"><button type="submit" style="margin-right: 10px;" id="submit">등록</button> <button type="reset" id="reset">다시쓰기</button></td></tr>
			    </table>
			</form>
			
        </section>
        <footer><h4>HRDKOREA Copyrightⓒ2022 All right reserved. Human Resources Development Service of Korea</h4></footer>
    </main>
	<script>
	    document.getElementById('submit').addEventListener('click', function(event){
	        const studentid = document.getElementById('studentid');
	        const subjectcode = document.getElementById('subjectcode');
	        const mid = document.getElementById('mid');
	        const final = document.getElementById('final');
	        const attend = document.getElementById('attend');
	        const report = document.getElementById('report');
	        const etc = document.getElementById('etc');
	
	        if (studentid.value === "") {
	            alert("학번이 입력되지 않았습니다!");
	            studentid.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (subjectcode.value === "") {
	            alert("과목코드가 입력되지 않았습니다!");
	            subjectcode.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (mid.value === "") {
	            alert("중간(30%)(0~100)이 입력되지 않았습니다!");
	            mid.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (final.value === "") {
	            alert("기말(30%)(0~100)이 입력되지 않았습니다!");
	            final.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (attend.value === "") {
	            alert("출석(20%)(0~100)이 입력되지 않았습니다!");
	            attend.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (report.value === "") {
	            alert("레포트(10%)(0~100)가 입력되지 않았습니다!");
	            report.focus();
	            event.preventDefault();
	            return false;
	        }
	        if (etc.value === "") {
	            alert("기타(10%)(0~100)가 입력되지 않았습니다!");
	            etc.focus();
	            event.preventDefault();
	            return false;
	        }
	    })
	
	    document.getElementById('reset').addEventListener('click', function(){
	        alert("정보를 지우고 처음부터 다시 입력합니다!");
	        document.getElementById('studentid').focus();
	    })
	</script>
</body>
</html>
