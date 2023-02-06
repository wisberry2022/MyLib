<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "localSQL.LocalMySql, java.util.*, java.sql.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	Statement stmt = null;
	
	String sql = "update userinfo";
	
	sql += " set id='" + request.getParameter("id") + "', pwd=aes_encrypt('" + request.getParameter("pwd") + "', sha2('key', 512)), re=aes_encrypt('" + request.getParameter("pwd") + "', sha2('key', 512)), nickname='" + request.getParameter("nickname") + "', email='" + request.getParameter("email") + "', address='" + request.getParameter("address") + "', typeid=" + request.getParameter("typeid");
	sql += " where id='" + request.getParameter("origin") + "'";
	System.out.println(sql);
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		
	}catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("../../../index.jsp?page=admin/manage&sub=userManage");
	}finally {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	response.sendRedirect("../../../index.jsp?page=admin/manage&sub=userManage");
%>


