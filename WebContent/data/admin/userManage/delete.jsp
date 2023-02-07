<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "localSQL.LocalMySql, java.sql.*" %>
<% 
	Connection conn = null;
	Statement stmt = null;
	String sql = "delete from userinfo where id=";	

	String[] targets = request.getParameterValues("target");
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		
		for(int i = 0; i<targets.length; i++) {
			stmt.executeUpdate(sql+"'"+targets[i] + "'");
		}	
		
	}catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("../../../index.jsp?page=admin/manage&sub=userManage");
	}finally {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();	
	}
	
	response.sendRedirect("../../../index.jsp?page=admin/manage&sub=userManage");
	
%>