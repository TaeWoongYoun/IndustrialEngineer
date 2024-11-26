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
	<%
	String test1 = request.getParameter("test1");
	String test2 = request.getParameter("test2");
	String test3 = request.getParameter("test3");
	String sub02 = request.getParameter("sub02");
	String test5 = request.getParameter("test5");
	String sub022 = request.getParameter("sub022");
	String sql = "insert into TBL_RESULT_202004 VALUES ('"+test1+"', '"+test2+"', '"+test3+"', '"+sub02+"', '"+test5+"', '"+sub022+"')";
	    try {
	        Class.forName ("oracle.jdbc.OracleDriver");
	        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	        Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);
	        rs.next();
	        stmt.close();
	        con.close();
	    } catch (Exception e) {
	        out.print(e);
	    }
	%>
	
<script>
	alert("검사결과가 정상적으로 등록 되었습니다");
	location.href = "sub03.jsp"
</script>
</body>
</html>