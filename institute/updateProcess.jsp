<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSTITUTE</title>
</head>
<body>
    <%
    String inno = request.getParameter("inno");
    String inname = request.getParameter("inname");
    String tel = request.getParameter("tel");
    String bdate = request.getParameter("bdate");
    String course = request.getParameter("course");
    String status = request.getParameter("status");
    String sql = "UPDATE institute SET inno = '"+inno+"', inname = '"+inname+"', tel = '"+tel+"', bdate = '"+bdate+"', course = '"+course+"', status = '"+status+"' WHERE inno = '"+inno+"'";
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
    alert('수정이 완료 되었습니다.');
    location.href = "update.jsp";
</script>
</body>
</html>