<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
	int end = 0;
%>
<jsp:useBean id ="User" class = "beanData.UserBean" scope = "session" />
<div id="wrapper">
  <div class="over_section bg_set itm01">
    <h2>열린공간</h2>
  </div>
  <section id="openSpace">
    <div class="container">
      <div>
        <h3>자유게시판</h3>
        <p>온라인 도서관에서 자유로운 대화를 나눌 수 있습니다</p>
      </div>
      <div>
        <table>
          <thead>
            <tr>
              <th>번호</th>
              <th>글제목</th>
              <th>작성자</th>
              <th>작성일자</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><a href="?page=space/detail&prefix=id:1">1</a></td>
              <td><a href="?page=space/detail&prefix=id:1">안녕하세요</a></td>
              <td><a href="?page=space/detail&prefix=id:1">user01</a></td>
              <td><a href="?page=space/detail&prefix=id:1">2023.02.07</a></td>
              <td><a href="?page=space/detail&prefix=id:1">12</a></td>
            </tr>
          </tbody>
        </table>
        <% if(User.getId()!=null){ %>
        <div>
        	<a href="?page=space/write" class="bl_btn writeBtn">글쓰기</a>
        </div>
        <%} %>
        <div class="pagination">
          <ul>
            <li class="prev"><a href="#" class="bl_btn">prev</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li class="next"><a href="#" class="wt_btn">next</a></li>
          </ul>
        </div>
        <form action="#" method="GET">
          <select name="search">
            <option name="title">제목</option>
            <option name="content">내용</option>
            <option name="author">작성자</option>
            <option name="date">날짜</option>
          </select>
          <input type="search" name="search" placeholder="검색어를 입력하세요" required />
          <button type="submit" class="wt_btn">검색</button>
        </form>
      </div>
    </div>
  </section>
</div>