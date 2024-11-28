<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
String sno = request.getParameter("sno");
String sname = request.getParameter("sname");
String tel = request.getParameter("tel");
String bdate = request.getParameter("bdate");
String lino = request.getParameter("lino");
String status = request.getParameter("status");
String sql = "UPDATE student SET sno = '"+sno+"', sname = '"+sname+"', tel = '"+tel+"', bdate = '"+bdate+"', lino = '"+lino+"', status = '"+status+"' WHERE sno = '"+sno+"'";
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
alert("수정이 완료 되었습니다.");
location.href = "sub02.jsp"
</script>
</body>
</html>