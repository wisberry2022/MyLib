<%@page import="localSQL.LocalMySql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <body>
    <%@page import = "localSQL.LocalMySql.*, java.sql.*, java.util.*" %>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	
    	if(request.getParameter("pwd").equals(request.getParameter("re"))) {
    		String sql = "insert into userinfo values(";
        	sql += "'" + request.getParameter("id") + "', sha2('" + request.getParameter("pwd") + "', 512), '" + request.getParameter("nickname") + "', '" + request.getParameter("email") + "', '" + request.getParameter("address") + "', 2)";
        	System.out.println(sql);
        	
        	try{
        		Connection conn = LocalMySql.getConnection();
            	Statement stmt = conn.createStatement();
            	
            	stmt.executeUpdate(sql);
        		
        		if(conn != null) conn.close();
        		
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	response.sendRedirect("../../index.jsp?page=login/login");
    	}else {
    		response.sendRedirect("../../index.jsp?page=login/signup");
    	}
    %>
    </body>
    