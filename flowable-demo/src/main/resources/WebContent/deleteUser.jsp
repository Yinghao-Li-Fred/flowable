<%@page import="java.sql.*"%>
<%@page import="cn.ybzy.jdbc.DBUtils"%>
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
	Connection conn = null;
	Statement stat = null;
	int count = 0;
	try {
		conn = DBUtils.getConnection();
		String sql = "delete from users where id=3;";
		stat = conn.createStatement();
		count = stat.executeUpdate(sql);
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(stat != null) stat.close();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		try {
			if(conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}

	if (count > 0) {
		out.print("delete success!");
	}
	%>

</body>
</html>