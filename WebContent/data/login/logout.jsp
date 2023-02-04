<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<jsp:useBean id = "User" class = "beanData.UserBean" scope = "session"/>
	<jsp:setProperty property = "id" name = "User" value = "<%=null %>" />
	<jsp:setProperty property = "nickname" name = "User" value = "<%=null %>" />
	<jsp:setProperty property = "email" name = "User" value = "<%=null %>" />
	<jsp:setProperty property = "address" name = "User" value = "<%=null %>" />
	<jsp:setProperty property = "typeid" name = "User" value = "<%=0 %>" />
	<jsp:forward page = "../../index.jsp?page=first">
		<jsp:param name="prefix" value = "pages" />
	</jsp:forward>
</body>