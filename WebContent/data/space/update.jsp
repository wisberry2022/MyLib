<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, localSQL.LocalMySql" %>
<%
	String id = request.getParameter("updateTarget");
	System.out.println(id);
	String title = request.getParameter("writeText");
	String content = request.getParameter("content");
	
	System.out.println(id);
	System.out.println(title);
	System.out.println(content);
	
	Connection conn = null;
	Statement stmt = null;
	String sql = "update bbs set ";
	sql += "title = '" + title + "', content = '" + content + "', writeDate=now() ";
	sql += "where num=" + id;
	
	System.out.println(sql);
	
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