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
        <h2>ȸ��������ȸ</h2>
		<table>
	        <tr>
	            <th>������</th>
	            <th>ȸ����ȣ</th>
	            <th>ȸ����</th>
	            <th>���Ǹ�</th>
	            <th>�������</th>
	            <th>������</th>
	            <th>���</th>
	        </tr>
	        	<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(" SELECT a.REGIST_MONTH, a.C_NO, b.c_NAME, c.CLASS_NAME, a.CLASS_AREA, a.TUITION, b.GRADE FROM TBL_CLASS_202201 a JOIN TBL_MEMBER_202201 b ON a.C_NO = b.C_NO JOIN tbl_teacher_202201 c ON a.teacher_code = c.teacher_code");
						while(rs.next()) {
							out.println("<tr><td>" + rs.getString(1).substring(0, 4) + "��" + rs.getString(1).substring(4, 6) + "��" + "</td>");
							out.println("    <td>" + rs.getString(2) + "</td>");
							out.println("    <td>" + rs.getString(3) + "</td>");
							out.println("    <td>" + rs.getString(4) + "</td>");
							out.println("    <td>" + rs.getString(5) + "</td>");
							out.println("    <td>��" + String.format("%,d", rs.getInt(6)) + "</td>");
							out.println("    <td>" + rs.getString(7) + "</td></tr>");
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