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
	String regist_month = request.getParameter("regist_month");
	String c_no = request.getParameter("c_no");
	String class_area = request.getParameter("class_area");
	String tuition = request.getParameter("tuition");
	String teacher_code = request.getParameter("teacher_code");
	String sql = "INSERT INTO TBL_CLASS_202201 VALUES ('"+regist_month+"', '"+c_no+"','"+class_area+"','"+tuition+"','"+teacher_code+"')";
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