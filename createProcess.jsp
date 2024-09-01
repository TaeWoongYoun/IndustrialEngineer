<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예방접종 프로그램</title>
</head>
<body>
    <%
	    String vaccinate_no = request.getParameter("vaccinate_no");
	    String people_id = request.getParameter("people_id");
	    String vaccinate_code = request.getParameter("vaccinate_code");
	    String vaccinate_date = request.getParameter("vaccinate_date");
	    String vaccinate_round = request.getParameter("vaccinate_round");
	    String vaccinate_result = request.getParameter("vaccinate_result");
	    String visit_agency = request.getParameter("visit_agency");
	    String sql = "INSERT INTO tbl_vaccination VALUES ('"+vaccinate_no+"', '"+people_id+"', '"+vaccinate_code+"', '"+vaccinate_date+"', '"+vaccinate_round+"', '"+vaccinate_result+"', '"+visit_agency+"')";
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