<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20241128</title>
</head>
<body>
	<style>
		*{padding: 0; margin: 0;}
		header{width: 100%;height: 70px;background-color: #111;text-align: center;align-content: center;color: #fff;}
		nav{width: 100%;height: 50px;background-color: #666;color: #fff;display: flex;}
		nav div{padding: 0 20px; text-align: center; align-content: center;}
		a{color:inherit; text-decoration: none;}
		section{width: 100%;height: calc(100vh - 190px);background-color: #fff;}
		section h1{text-align: center; line-height: 150px;}
		section p{line-height: 70px; padding-left: 20px;}
		section h3{line-height: 50px; padding-left: 20px;}
		section table{border-collapse: collapse; margin: 0 auto;}
        th, td{border: 1px solid black; padding: 5px 10px;text-align: center;}
		footer{width: 100%;height: 70px;background-color: #000;color: #fff;text-align: center;align-content: center;}
	</style>
	<header>
		<h2>자격 관리 프로그램</h2>
	</header>
	<nav>
		<div><a href="sub01.jsp">학생등록</a></div>
		<div><a href="sub02.jsp">학생등록조회/수정</a></div>
		<div><a href="sub03.jsp">자격조회</a></div>
		<div><a href="index.jsp">홈으로</a></div>
	</nav>
	<section>
		<h1>수강생 수정</h1>
	            <%
	String sno = request.getParameter("sno");
	String sname = "";
	String tel = "";
	String bdate = "";
	    try {
	        Class.forName ("oracle.jdbc.OracleDriver");
	        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	        Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery("SELECT * from student where sno = '"+sno+"'");
	        while (rs.next()) {
	        	sname = rs.getString(2);
	        	tel = rs.getString(3);
	        	bdate = rs.getString(4).substring(0, 4) + rs.getString(4).substring(5,7) + rs.getString(4).substring(8, 10);
	        }
	        stmt.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	%>
		<form action="sub02Process.jsp">
	        <table>
	            <tr>
	                <th>학생번호</th>
	                <td><input type="text" name="sno" value="<%=sno%>"></td>
	            </tr>
	            <tr>
	                <th>학생이름</th>
	                <td><input type="text" name=sname value="<%=sname%>"></td>
	            </tr>
	            <tr>
	                <th>전화번호</th>
	                <td><input type="text" name="tel" value="<%=tel%>"></td>
	            </tr>
	            <tr>
	                <th>생년월일</th>
	                <td><input type="text" name="bdate" value="<%=bdate%>"></td>
	            </tr>
	            <tr>
	                <th>자격코드</th>
	                <td>
	                    <input type="radio" name="lino" id="" value="100" checked>정보처리기능사
	                    <input type="radio" name="lino" id="" value="200">정보처리산업기사<br>
	                    <input type="radio" name="lino" id="" value="300">웹디자인기능사
	                    <input type="radio" name="lino" id="" value="400">전자출판기능사
	                </td>
	            </tr>
	            <tr>
	                <th>합격여부</th>
	                <td>
	                    <input type="radio" name="status" id="" value="1" checked>필기합격
	                    <input type="radio" name="status" id="" value="2">실기합격
	                </td>
	            </tr>
	            <tr>
	                <th colspan="2">
	                    <button type="submit">수정</button>
	                    <a href="sub02.jsp"><button type="button">조회</button></a>
	                </th>
	            </tr>
	        </table>
	    </form>
	</section>
	<footer>
		<p>HRDKOREA Copyrightⓒ2023</p>
	</footer>
</body>
</html>