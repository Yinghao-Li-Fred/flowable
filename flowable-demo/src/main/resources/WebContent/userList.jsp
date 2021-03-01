<%@page import="cn.ybzy.jdbc.DBUtils" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	query the database
	<%
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			String sql = "select id, username, password, phone_no, address, reg_date " +
						 "from users where id =1;";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String phoneNo = rs.getString("phone_no");
				String address = rs.getString("address");
				String regDate = rs.getDate("reg_date").toString();
				
				out.print(id + "---" + username + "---" + password + "---" + phoneNo + "---" + address + "---" + regDate);
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(conn, stat, rs);
		}
	
	%>
</body>
</html>