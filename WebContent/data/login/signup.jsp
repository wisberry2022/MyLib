<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <body>
    <%@page import = "localSQL.LocalMySql, java.sql.*, java.util.*" %>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	Connection conn = null;
    	Statement stmt = null;
    	
    	if(request.getParameter("pwd").equals(request.getParameter("re"))) {
    		String sql = "insert into userinfo values(";
//         	sql += "'" + request.getParameter("id") + "', sha2('" + request.getParameter("pwd") + "', 512), sha2('" + request.getParameter("re") + "', 512), '" + request.getParameter("nickname") + "', '" + request.getParameter("email") + "', '" + request.getParameter("address") + "', 2)";
        	sql += "'" + request.getParameter("id") + "', aes_encrypt('" + request.getParameter("pwd") + "', sha2('key', 512)), aes_encrypt('" + request.getParameter("re") + "', sha2('key', 512)), '" + request.getParameter("nickname") + "', '" + request.getParameter("email") + "', '" + request.getParameter("address") + "', 2)";  
        	System.out.println(sql);
        	
        	try{
        		conn = LocalMySql.getConnection();
            	stmt = conn.createStatement();
            	
            	stmt.executeUpdate(sql);
        				
        	}catch(Exception e) {
        		e.printStackTrace();
        		response.sendRedirect("../../index.jsp?page=login/signup&error=dberror");
        		return;
        	}finally {
        		if(stmt != null) stmt.close();
        		if(conn != null) conn.close();
        	}
        	response.sendRedirect("../../index.jsp?page=login/login");
        	return;
    	}else {
    		response.sendRedirect("../../index.jsp?page=login/signup&error=error");
    	}
    %>
    </body>
    