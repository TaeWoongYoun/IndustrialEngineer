<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식 매수 관리 프로그램</title>
</head>
<body>
	<style>
        *{padding: 0; margin: 0;}
        main{width: 1000px; margin: 0 auto;}
        header{width: 100%; height: 70px; background-color: #6666FF; color: #fff; display: flex; align-items: center; justify-content: center;}
        nav{width: 100%; height: 50px; background-color: skyblue; color: #fff; display: flex; align-items: center;}
        nav div{padding: 0 20px;}
        nav div a{text-decoration: none; color: inherit;}
        section{width: 100%; background-color: #fff; padding-bottom: 20px;}
        section h3{text-align: center; line-height: 80px;}
        section p{padding: 10px;}
        footer{width: 100%; height: 50px; background-color: #6666FF; color: #fff; text-align: center; line-height: 50px;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{padding: 5px 10px; border: 1px solid black;}
    </style>
    <main>
        <header><h1>주식 매수 관리 프로그램</h1></header>
        <nav>
            <div><a href="stockRead.jsp">주식종목조회</a></div>
            <div><a href="create.jsp">주식매수등록</a></div>
            <div><a href="buyRead.jsp">주식매수내역조회</a></div>
            <div><a href="data.jsp">부서별주식매수통계</a></div>
            <div><a href="index.jsp">홈으로</a></div>
        </nav>
        <section>
            <h3>주식 매수 등록</h3>
            <form action="createProcess.jsp" method="get">
			    <table>
			        <tr><th>매수일자</th><td><input type="text" name="buy_date" id="buy_date">예)20220302</td></tr>
			        <tr><th>종목명</th><td>
			            <select name="stock_item_code" id="stock_item_code">
			                <option value="" disabled selected>종목명</option>
			                <%
							    try {
							        Class.forName ("oracle.jdbc.OracleDriver");
							        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							        Statement stmt = con.createStatement();
							        ResultSet rs = stmt.executeQuery("SELECT stock_item_code, stock_item_name FROM tbl_stock_item");
							        while(rs.next()) {
							            out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "]" + rs.getString(2) + "</option>");
							        }
							        stmt.close();
							        con.close();
							    } catch (Exception e) {
							        e.printStackTrace();
							    }
							%>
			            </select>
			        </td></tr>
			        <tr><th>종목코드</th><td><input type="text" name="stock_item_code2" id="stock_item_code2">예)100001</td></tr>
			        <tr><th>매수수량</th><td><input type="text" name="buy_number" id="buy_number">주</td></tr>
			        <tr><th>매수가격</th><td><input type="text" name="buy_price" id="buy_price">원</td></tr>
			        <tr><th>부서코드</th><td>
			            <select name="dept_code" id="dept_code">
			                <option value="" disabled selected>부서</option>
			                <%
							    try {
							        Class.forName ("oracle.jdbc.OracleDriver");
							        Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
							        Statement stmt = con.createStatement();
							        ResultSet rs = stmt.executeQuery("SELECT dept_code, dept_name FROM tbl_dept");
							        while(rs.next()) {
							            out.println("<option value='"+rs.getString(1)+"'>" + "[" + rs.getString(1) + "]" + rs.getString(2) + "</option>");
							        }
							        stmt.close();
							        con.close();
							    } catch (Exception e) {
							        e.printStackTrace();
							    }
							%>
			            </select>
			        </td></tr>
			        <tr><th colspan="2"><button type="submit" id="submit">주식매수등록</button><button type="reset" id="reset">다시쓰기</button></th></tr>
			    </table>
			</form>
        </section>
        <footer>
            <address>HRDKOREA Copyright©2023</address>
        </footer>
    </main>
    
<script>
    document.getElementById('submit').addEventListener('click', function(event){
        const buyDate = document.getElementById('buy_date');
        const stockItemCode = document.getElementById('stock_item_code');
        const stockItemCode2 = document.getElementById('stock_item_code2');
        const buyNumber = document.getElementById('buy_number');
        const buyPrice = document.getElementById('buy_price');
        const deptCode = document.getElementById('dept_code');

        if (buyDate.value === "") {
            alert('매수일자가 입력되지 않았습니다.');
            buyDate.focus();
            event.preventDefault();
            return false;
        }
        if (stockItemCode.value === "") {
            alert('종목명이 입력되지 않았습니다.');
            stockItemCode.focus();
            event.preventDefault();
            return false;
        }
        if (stockItemCode2.value === "") {
            alert('종목코드가 입력되지 않았습니다.');
            stockItemCode2.focus();
            event.preventDefault();
            return false;
        }
        if (buyNumber.value === "") {
            alert('매수수량이 입력되지 않았습니다.');
            buyNumber.focus();
            event.preventDefault();
            return false;
        }
        if (buyPrice.value === "") {
            alert('매수가격이 입력되지 않았습니다.');
            buyPrice.focus();
            event.preventDefault();
            return false;
        }
        if (deptCode.value === "") {
            alert('부서코드가 입력되지 않았습니다.');
            deptCode.focus();
            event.preventDefault();
            return false;
        }
    })
    document.getElementById('reset').addEventListener('click', function(){
        alert('모든 내용이 초기화 됩니다!')
    })
</script>
</body>
</html>