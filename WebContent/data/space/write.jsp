<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, localSQL.LocalMySql" %>
<jsp:useBean id = "User" class = "beanData.UserBean" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("writeText");
	String content = request.getParameter("content");
	String sql = "insert into bbs(title,author,writeDate,content) values(";
	sql += "'" + title + "', '" + User.getNickname() + "', now(), '" + content + "')";
	System.out.println(sql);
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
	}finally {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
%>

<jsp:forward page = "../../index.jsp?page=space/openSpace">
		<jsp:param name="prefix" value = "pages" />
</jsp:forward>