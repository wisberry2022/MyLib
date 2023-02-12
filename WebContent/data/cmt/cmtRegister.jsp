<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, localSQL.LocalMySql " %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id = "User" class = "beanData.UserBean" scope="session" />
<%
	String id = request.getParameter("before");
	String comment = request.getParameter("comment");
	System.out.println("cmtRegister: " + id + "\t" + comment);
	
	String sql = "insert into comment(bbs_num, author, writeDate, content) values(";
	sql += id + ", '" + User.getNickname() + "', now(), '" + comment + "')";
	
	System.out.println(sql);
	
	Connection conn = null;
	Statement stmt = null;
	
	try{
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
%>

<jsp:forward page = "../../index.jsp?page=space/detail&prefix=pages">
	<jsp:param name = "id" value="<%=id %>" />
	<jsp:param name = "parent" value="pages" />
</jsp:forward>