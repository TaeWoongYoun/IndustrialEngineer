<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정평가형 정보처리산업기사(v4.0) 성적관리 프로그램 ver2022-05</title>
</head>
<body>
	<% 	String studentid = request.getParameter("studentid");
		String subjectcode = request.getParameter("subjectcode");
		String mid = request.getParameter("mid");
		String final2 = request.getParameter("final");
		String attend = request.getParameter("attend");
		String report = request.getParameter("report");
		String etc = request.getParameter("etc");
		try {
			Class.forName ("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("INSERT INTO tbl_grade_202205 VALUES ('"+studentid+"', '"+subjectcode+"', '"+mid+"', '"+final2+"', '"+attend+"', '"+report+"', '"+etc+"')");
			rs.next();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
	
	<script>
	    alert("개인성적정보가 등록 되었습니다!");
	    location.href='index.jsp'
	</script>
</body>
</html>
