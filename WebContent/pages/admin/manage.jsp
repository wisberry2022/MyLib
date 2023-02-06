<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String aUrl = request.getParameter("sub") == null ? "userManage" : request.getParameter("sub");
	String total = "";
	if(aUrl.contains("id")) total = aUrl.split("\\?")[0] + "?" + aUrl.split("\\?")[1];
	else total = aUrl + ".jsp";
	System.out.println(aUrl + "\t" + total);
%>    
<div id="adminWrapper">
  <figure class="bg_set item01">
    <h2>관리자 페이지</h2>
  </figure>
  <section id="adminMain">
    <div class="container">
      <ul class="f_left">
        <li><a href="?page=admin/manage&sub=userManage">회원 관리</a></li>
        <li><a href="?page=admin/manage&sub=boardManage">게시물 관리</a></li>
        <li><a href="?page=admin/manage&sub=bookManage">도서정보 관리</a></li>
      </ul>
      <div id="contentsBox" class="f_left">
		<jsp:include page = "<%=total %>" />
      </div>
    </div>
  </section>
</div>
