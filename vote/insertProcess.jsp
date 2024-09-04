<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</title>
</head>
<body>
	<%
		String v_jumin = request.getParameter("v_jumin");
		String v_name = request.getParameter("v_name");
		String m_no = request.getParameter("m_no");
		String v_time = request.getParameter("v_time");
		String v_area = request.getParameter("v_area");
		String v_confirm = request.getParameter("v_confirm");
		String sql = "INSERT INTO tbl_vote_202005 VALUES ('"+v_jumin+"', '"+v_name+"', '"+m_no+"', '"+v_time+"', '"+v_area+"', '"+v_confirm+"')";
	    try {
	        Class.forName ("oracle.jdbc.OracleDriver");
	        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	        Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);
	        rs.next();
	        stmt.close();
	        con.close();
	    } catch (Exception e) {
	        out.println(e);
	    }
	%>
	
	<script>
	    alert('투표하기 정보가 정상적으로 등록 되었습니다!');
	    location.href = 'index.jsp';
	</script>
</body>
</html>