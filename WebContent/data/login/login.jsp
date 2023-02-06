
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <body>
    <jsp:useBean id = "User" class = "beanData.UserBean" scope = "session"/>
    <%@page import = "localSQL.LocalMySql, java.sql.*" %>
	<%! 
		// 로그인 체크 함수(관리자일 경우 ADMIN, 일반회원일 경우 GUEST 반환, 만약 둘다 아닐 경우 EMPTY 반환)
		String isLogin(String id, int userType) {
			if(id != null) {
				return userType == 1 ? "ADMIN" : "GUEST";
			}else {
				return "EMPTY";
			}
		}
	%>    
	
    <%
    	String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String result = "";
		String sql = "select id, nickname, email, address, typeid from userinfo where id='" + id + "' and pwd=aes_encrypt('" + pwd + "', sha2('key', 512))";
		System.out.println(sql);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = LocalMySql.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){ %>
			<jsp:setProperty property = "*" name = "User" />
			<%
				result = isLogin(rs.getString(1), rs.getInt(5));
				System.out.println("login.jsp: " + result);
				User.setId(rs.getString(1));
				User.setNickname(rs.getString(2));
				User.setEmail(rs.getString(3));
				User.setAddress(rs.getString(4));
				User.setTypeid(rs.getInt(5));
			}else {
				result = "EMPTY";
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("../../index.jsp?page=error/loginError");
		}finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
		if(result.equals("ADMIN") || result.equals("GUEST")) {
			response.sendRedirect("../../index.jsp");	
		}else if(result.equals("EMPTY")){
			response.sendRedirect("../../index.jsp?page=login/login&error=misinput");
				
		}

    %>
    </body>
