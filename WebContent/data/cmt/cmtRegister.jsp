<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("hihi");
	String id = request.getParameter("before");
	System.out.println("cmtRegister: " + id);
%>

<jsp:forward page = "../../index.jsp?page=space/detail&prefix=pages">
	<jsp:param name = "id" value="<%=id %>" />
	<jsp:param name = "parent" value="pages" />
</jsp:forward>