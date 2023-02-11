<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, localSQL.LocalMySql" %>
<%
	String id = request.getParameter("id");
	System.out.println(request.getParameter("id"));
	
	Connection conn = null;
	Statement stmt = null;
	String sql = "delete from bbs where num="+id;
	System.out.println(sql);
	
	try{
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}	
%>

<jsp:forward page = "../../index.jsp?page=space/openSpace&prefix=pages">
	<jsp:param name = "parent" value ="pages" />
</jsp:forward>