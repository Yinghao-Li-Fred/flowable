<%@page import="cn.ybzy.jdbc.DBUtils"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phoneNo = request.getParameter("phoneNo");
		String address = request.getParameter("address");
		
		String sql = "INSERT INTO users (username, password, phone_no, address, "
				+ "reg_date) VALUES ('"+ username +"', '"+ password +"', '"+ phoneNo +"', '"+ address 
				+"', '"+ new java.sql.Date(new java.util.Date().getTime()) +"');";
		
		int count = DBUtils.IUD(sql);

		if (count > 0) {
			out.print("insert success!");
		}
	%>
</body>
</html>