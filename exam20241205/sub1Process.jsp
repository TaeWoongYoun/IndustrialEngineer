<%@ page language="java"
         contentType="text/html; charset=UTF-8"   
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String resv_no = request.getParameter("resv_no");
	String resv_date = request.getParameter("resv_date");
	String court_no = request.getParameter("court_no");
	String cust_no = request.getParameter("cust_no");
	String sql = "INSERT INTO TBL_RESV_202301 VALUES ('"+resv_no+"', '"+resv_date+"', '"+court_no+"', '"+cust_no+"')";
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
    alert('코트예약정보가 등록되었습니다');
    location.href = 'index.jsp'
</script>
</body>
</html>