<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자조회</title>
</head>
<body>
	<style>
		*{padding: 0; margin: 0;}
		header{width: 100%;height: 70px;background-color: #111;text-align: center;align-content: center;color: #fff;}
		nav{width: 100%;height: 50px;background-color: #666;color: #fff;display: flex;}
		nav div{padding: 0 20px; text-align: center; align-content: center;}
		nav div a{color:inherit; text-decoration: none;}
		section{width: 100%;height: calc(100vh - 190px);background-color: #fff;display: grid;place-content: center;}
		section h1{text-align: center; line-height: 100px;}  
		section h3{line-height: 50px; padding-left: 20px;}
		footer{width: 100%;height: 70px;background-color: #000;color: #fff;text-align: center;align-content: center;}
		table{border-collapse: collapse;}  
		th, td {border: 1px solid black;padding: 5px 20px;font-size: 24px;text-align: center;}
		td {display: flex;align-items: center;justify-content: space-betwee}
		label {display: flex;align-items: center;margin-left:10px;}
		select{width:100%; height: 35px; font-size: 24px;}
		input[type="text"]{width:100%; height: 35px; font-size: 24px;}  
	</style>
	<header>
		<h2>(과정평가형 정보처리산업기사) 진단검사 프로그램 ver 2020-04</h2>
	</header>
	<nav>
		<div><a href="sub01.jsp">환자조회</a></div>
		<div><a href="sub02.jsp">검사결과입력</a></div>
		<div><a href="sub03.jsp">검사결과조회</a></div>
		<div><a href="sub04.jsp">지역별검사건수</a></div>
		<div><a href="index.jsp">홈으로</a></div>
	</nav>
	<section>
		<h1>환자조회</h1>
		<form action="sub02Process.jsp">
			<table>
				<tr>
					<th>환자번호</th>
					<td><input type="text" placeholder="" name="test1" id="test1"> 예)1001</td>
				</tr>
				<tr>
					<th>검사코드</th>
					<td>
						<select name="test2" id="test2">
					      	<option value="" selected disabled>검사명</option>
							<%
							    try {
							        Class.forName ("oracle.jdbc.OracleDriver");
							        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							        Statement stmt = con.createStatement();
							        ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_LAB_TEST_202004");
							        while(rs.next()) {
							            out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "]" + rs.getString(2) + "</option>");
							            
							        }
							        stmt.close();
							        con.close();
							    } catch (Exception e) {
							        e.printStackTrace();
							    }
							%>
					    </select>
					</td>
				</tr>
				<tr>
					<th>검사시작일자</th>
					<td><input type="text" placeholder="" name="test3" id="test3"> 예)20200101</td>
				</tr>
				<tr>
					<th>검사상태</th>
					<td>
				        <label><input type="radio" name="sub02" value="1" id="test4"> 검사중</label>
				        <label><input type="radio" name="sub02" value="2"> 검사완료</label>
				    </td>
				<tr>
					<th>검사완료일자</th>
					<td><input type="text" placeholder="" name="test5" id="test5"> 예)20200101</td>
				</tr>
				<tr>
					<th>검사결과</th>
					<td>
				        <label><input type="radio" name="sub022" value="X" id=""> 미입력</label>
				        <label><input type="radio" name="sub022" value="P"> 양성</label>
				        <label><input type="radio" name="sub022" value="N"> 음성</label>
				    </td>
				</tr>
				<tr>
					<th colspan="2"><button type="submit" id="submit">검사결과등록</button> <button type="reset" id="reset">다시쓰기</button></th>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyrightⓒ2020 ALL roghts reserved. Human Resources Development Service of Korea</p>
	</footer>
	
<script>
    document.getElementById("submit").addEventListener('click', function(e){
        const test1 = document.getElementById('test1');
        const test2 = document.getElementById('test2');
        const test3 = document.getElementById('test3');
        const test4 = document.querySelector('input[name="sub02"]:checked');
        const test5 = document.getElementById('test5');
        const test6 = document.querySelector('input[name="sub022"]:checked');

        if (test1.value === "") {
            alert("환자번호가 입력되지 않았습니다!")
            e.preventDefault();
            test1.focus();
            return false;
        }

        if (test2.value === "") {
            alert("검색코드가 선택되지 않았습니다!")
            e.preventDefault();
            test2.focus();
            return false;
        }

        if (test3.value === "") {
            alert("검사시작일자가 입력되지 않았습니다!")
            e.preventDefault();
            test3.focus();
            return false;
        }

        if (!test4) {
            alert("검사상태가 선택되지 않았습니다!")
            e.preventDefault();
            document.getElementById('test4').focus();
            return false;
        }

        if (test5.value === "") {
            alert("검사완료일자가 입력되지 않았습니다!")
            e.preventDefault();
            test5.focus();
            return false;
        }

        if (!test6) {
            alert("검사결과가 선택되지 않았습니다!")
            e.preventDefault();
            document.getElementById('test6').focus();
            return false;
        }
    })

    document.getElementById('reset').addEventListener("click", function(){
        alert("정보를 지우고 처음부터 다시 입력 합니다!")
    })
</script>
</body>
</html>