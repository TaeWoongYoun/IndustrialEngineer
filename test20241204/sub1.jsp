<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <style>
        *{margin: 0;padding: 0;}
        header{width: 100%; height: 70px; background-color: black; color: #fff; text-align: center; align-content: center;}
        nav{width: 100%; height: 50px; background-color: #777; color: #fff; display: flex;}
        nav div{padding: 0 20px; align-content: center;}
        a{text-decoration: none; color: inherit;}
        section{width: 100%; height: calc(100vh - 170px); background-color: #fff;}
        section h2{line-height: 100px; text-align: center;}
        table{border-collapse: collapse; margin: 0 auto;}
        th, td{padding: 5px 10px; border: 1px solid black; text-align:center;}
        footer{width: 100%; height: 50px; background-color: black; color: #fff; text-align: center; align-content: center;}
    </style>
    <header>
        <h1>���������� ȸ������ ���α׷� ver 1.0</h1>
    </header>
    <nav>
        <div><a href="sub1.jsp">������ȸ</a></div>
        <div><a href="sub2.jsp">������û</a></div>
        <div><a href="sub3.jsp">�п�������ȸ</a></div>
        <div><a href="sub4.jsp">���������Ȳ</a></div>
        <div><a href="index.jsp">Ȩ����</a></div>
    </nav>
    <section>
        <h2>������ȸ</h2>
		<table>
	        <tr>
	            <th>�����ڵ�</th>
	            <th>�����</th>
	            <th>���Ǹ�</th>
	            <th>������</th>
	            <th>�����ڰ������</th>
	            <th>����</th>
	        </tr>
	        	<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_teacher_202201");
						while(rs.next()) {
							out.println("<tr><td>" + rs.getString(1) + "</td>");
							out.println("    <td>" + rs.getString(2) + "</td>");
							out.println("    <td>" + rs.getString(3) + "</td>");
							out.println("    <td>��" + String.format("%,d", rs.getInt(4)) + "</td>");
							out.println("    <td>" + rs.getString(5).substring(0,4) + "��" + rs.getString(5).substring(4,6) + "��" + rs.getString(5).substring(6,8) + "��" + "</td>");
							out.println("    <td><a href='update.jsp?id="+rs.getString(1)+"'><button>����</button></a></td></tr>");
						}
						stmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
	    </table>
    </section>
    <footer><h2>HRDKOREA Copyright��2015 All right reserved.</h2></footer>
</body>
</html>