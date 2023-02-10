<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*, localSQL.LocalMySql, java.sql.*" %>
<jsp:useBean id = "Bbs" class = "beanData.BbsBean" />
<% 
	int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
	int end = 0;
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	List<String[]> bbsList = new ArrayList();
	
	String sql = "select num, title, author, writeDate, viewcnt from bbs order by num desc";
	System.out.println(sql);
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String[] rawData = new String[5];
			rawData[0] = String.valueOf(rs.getInt(1));
			rawData[1] = rs.getString(2);
			rawData[2] = rs.getString(3);
			rawData[3] = rs.getDate(4).toLocalDate().toString();
			rawData[4] = String.valueOf(rs.getInt(5));
			bbsList.add(rawData);
		}
	}finally {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
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
            <% 
            	for(int i = 0; i<bbsList.size(); i++){
            		String[] data = bbsList.get(i);	
            %>
              <td><a href="?page=space/detail&prefix=id:<%=data[0] %>"><%=data[0] %></a></td>
              <td><a href="?page=space/detail&prefix=id:<%=data[0] %>"><%=data[1] %></a></td>
              <td><a href="?page=space/detail&prefix=id:<%=data[0] %>"><%=data[2] %></a></td>
              <td><a href="?page=space/detail&prefix=id:<%=data[0] %>"><%=data[3] %></a></td>
              <td><a href="?page=space/detail&prefix=id:<%=data[0] %>"><%=data[4] %></a></td>
            </tr>
            <%} %>
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