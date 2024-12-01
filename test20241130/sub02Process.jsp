<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20241130</title>
</head>
<body>
<%
String date = request.getParameter("date");
String item_code = request.getParameter("item_code");
String number = request.getParameter("number");
String price = request.getParameter("price");
String dept_code = request.getParameter("dept_code");
String sql = "INSERT INTO tbl_buy_stock VALUES ('"+date+"', '"+item_code+"', '"+number+"', '"+price+"', '"+dept_code+"')";
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