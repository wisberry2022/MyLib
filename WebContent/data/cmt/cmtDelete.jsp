<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, localSQL.LocalMySql" %>
<%
	String cid = request.getParameter("cmtNum");
	String bid = request.getParameter("id");
	String sql = "delete from comment where num="+cid;
	
	System.out.println("삭제해야되는 댓글 번호: " + cid + " 이전 페이지 번호:" + bid);
	
	
	System.out.println(sql);
	
	Connection conn = null;
	Statement stmt = null;
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	
%>

<jsp:forward page = "../../index.jsp?page=space/detail" >
	<jsp:param name = "parent" value = "pages" />
</jsp:forward>

