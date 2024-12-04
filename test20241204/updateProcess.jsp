<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	String teacher_code = request.getParameter("teacher_code");
	String teacher_name = request.getParameter("teacher_name");
	String class_name = request.getParameter("class_name");
	String class_price = request.getParameter("class_price");
	String teacher_regist_date = request.getParameter("teacher_regist_date");
	String sql = "UPDATE TBL_TEACHER_202201 SET teacher_code = '"+teacher_code+"', teacher_name = '"+teacher_name+"', class_name = '"+class_name+"', class_price = '"+class_price+"', teacher_regist_date = '"+teacher_regist_date+"' WHERE teacher_code = '"+teacher_code+"'";
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
</body>
</html>