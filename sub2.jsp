<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
        <h2>수강신청</h2>
	    <form action="sub2Process.jsp">
	        <table>
		        <tr>
		            <th>수강월</th>
		            <td><input type="text" name="regist_month" id="regist_month">2022년01월 예)202203</td>
		        </tr>
		        <tr>
		            <th>회원명</th>
		            <td>
		                <select name="" id="c_no2">
		                    <option value="">홍길동</option>
		                    <option value="">장발장</option>
		                    <option value="">임꺽정</option>
		                    <option value="">성춘향</option>
		                    <option value="">이몽룡</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>회원번호</th>
		            <td><input type="text" name="c_no" id="c_no">예)10001</td>
		        </tr>
		        <tr>
		            <th>강의장소</th>
		            <td>
		                <select name="class_area" id="class_area">
		                    <option value="">강의장소</option>
						<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT CLASS_AREA FROM tbl_class_202201");
								while(rs.next()) {
									out.println("<option value='"+rs.getString(1)+"'>" + rs.getString(1) + "</option>");
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
		            <th>강의명</th>
		            <td>
		                <select name="teacher_code" id="teacher_code">
		                    <option value="">강의신청</option>
						<%
							try {
								Class.forName ("oracle.jdbc.OracleDriver");
								Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT distinct TEAChER_CODE FROM tbl_class_202201");
								while(rs.next()) {
									if ("100".equals(rs.getString(1))){
										out.println("<option value='"+rs.getString(1)+"'>초급반</option>");										
									} else if ("200".equals(rs.getString(1))){
										out.println("<option value='"+rs.getString(1)+"'>중급반</option>");										
									} else if ("300".equals(rs.getString(1))){
										out.println("<option value='"+rs.getString(1)+"'>고급반</option>");										
									} else if ("400".equals(rs.getString(1))){
										out.println("<option value='"+rs.getString(1)+"'>심화반</option>");
									}
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
		            <th>수강료</th>
		            <td><input type="text" name="tuition" id="tuition">원</td>
		        </tr>
		        <tr>
		            <th colspan="2">
		            	<button type="submit" id="submit">제출</button>
		            	<button type="reset" id="reset">취소</button>
		            </th>
		        </tr>
	        </table>
	    </form>
    </section>
    <footer><h2>HRDKOREA Copyrightⓒ2015 All right reserved.</h2></footer>
    
        <script>
        const regist_month = document.getElementById("regist_month");
        const c_no2 = document.getElementById("c_no2");
        const c_no = document.getElementById("c_no");
        const class_area = document.getElementById("class_area");
        const teacher_code = document.getElementById("teacher_code");
        const tuition = document.getElementById("tuition");

        document.getElementById('submit').addEventListener('click', (e) => {
            if(regist_month.value === ""){
                alert("수강월이 입력되지 않았습니다.");
                e.preventDefault();
                regist_month.focus();
                return false;
            }
            if(c_no2.value === ""){
                alert("회원명이 입력되지 않았습니다.");
                e.preventDefault();
                c_no2.focus();
                return false;
            }
            if(c_no.value === ""){
                alert("회원번호가 입력되지 않았습니다.");
                e.preventDefault();
                c_no.focus();
                return false;
            }
            if(class_area.value === ""){
                alert("강의장소가 입력되지 않았습니다.");
                e.preventDefault();
                class_area.focus();
                return false;
            }
            if(teacher_code.value === ""){
                alert("강의명이 입력되지 않았습니다.");
                e.preventDefault();
                teacher_code.focus();
                return false;
            }
            if(tuition.value === ""){
                alert("수강료가 입력되지 않았습니다.");
                e.preventDefault();
                tuition.focus();
                return false;
            }
        })
    </script>
</body>
</html>