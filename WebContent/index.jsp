<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <!-- reset css -->
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="assets/css/basic.css">
    <link rel="stylesheet" type="text/css" href="assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="assets/css/first.css">
    <link rel="stylesheet" type="text/css" href="assets/css/login/login.css">
    <link rel="stylesheet" type="text/css" href="assets/css/login/signup.css">
  </head>

  <body>
  	<%
  		String url = "";
  		if(request.getParameter("page") == null) {
  			url = "pages/first.jsp";
  		}else {
  			url = "pages/" + request.getParameter("page") + ".jsp";
  		}
  	%>
    <div id="topHeader">
      <ul>
        <li><a href="#">사이트맵</a></li>
        <li><a href="?page=login/signup">회원가입</a></li>
        <li><a href="?page=login/login">로그인</a></li>
      </ul>
    </div>
    <header>
      <h1 class="bg_set">
        <a href="?page=first">
          MyLib
        </a>
      </h1>
    </header>
    <nav>
      <ul class="mainMenu">
        <li>
          <a href="?page=home">홈페이지</a>
        </li>
        <li>
          <a href="?page=info">도서정보</a>
        </li>
        <li>
          <a href="?page=space">열린공간</a>
        </li>
        <li>
          <a href="?page=search">자료검색</a>
        </li>
      </ul>
    </nav>
	<main>
		<% System.out.println(url); %>
		<jsp:include page ="<%=url %>"  ></jsp:include>
	</main>
	<footer>
      <div id="top_footer">
        <div class="container">
          <ul>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보 처리방침</a></li>
            <li><a href="#">저작권보호정책</a></li>
            <li><a href="#">키보드보안프로그램설치안내</a></li>
          </ul>
        </div>
      </div>
      <div id="bottom_footer">
        <div class="container">
          <address>(46949) 부산광역시 사상구 사상로310번길 33(덕포동) 전화 051-310-5400 / 팩스 051-310-5429</address>
          <p>&copy; © 2020 Busan Metropolitan City Library, All rights reserved.</p>
        </div>
      </div>
    </footer>
  </body>

</html>