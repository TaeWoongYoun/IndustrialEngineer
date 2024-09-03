<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식 매수 관리 프로그램</title>
</head>
<body>
	<%
	String buy_date = request.getParameter("buy_date");
	String stock_item_code = request.getParameter("stock_item_code");
	String buy_number = request.getParameter("buy_number");
	String buy_price = request.getParameter("buy_price");
	String dept_code = request.getParameter("dept_code");
    try {
        Class.forName ("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("INSERT INTO tbl_buy_stock VALUES ('"+buy_date+"', '"+stock_item_code+"', '"+buy_number+"', '"+buy_price+"', '"+dept_code+"')");
        rs.next();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
<script>
    alert('주식 매수 등록이 완료 되었습니다!');
    location.href = "buyRead.jsp";
</script>
</body>
</html>