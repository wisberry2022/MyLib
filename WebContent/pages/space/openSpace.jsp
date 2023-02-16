<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*, localSQL.LocalMySql, java.sql.*" %>
<jsp:useBean id = "Bbs" class = "beanData.BbsBean" />
<% 
	String searchType = request.getParameter("searchType") == null ? null : request.getParameter("searchType");
	String target = request.getParameter("target") == null ? null : request.getParameter("target");
	
	int pageCriteria = 4;
	int dataCriteria = 10;

	int start = request.getParameter("start") == null ? 0 : Integer.parseInt(request.getParameter("start"));
	int end = 0;
	
	int dataStart = request.getParameter("count") == null ? 0 : Integer.parseInt(request.getParameter("count"));
	int dataEnd = 0;
	
	int total = 0;
	
	String sql = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	List<String[]> bbsList = new ArrayList();
	
	if((searchType != null) && (target != null)) {
		// 특수문자 입력을 통한 SQL Injection 방지를 위한 특수문자 replace
		target = target.replace('<', '〈');
		target = target.replace('>', '〉');
		target = target.replace('-', '─');
		target = target.replace('"', '˝');
		target = target.replace('\'', '＇');
		
		System.out.println(target);
		
		sql = "select num, title, author, writeDate, viewcnt from bbs where " + searchType + " like '%" + target + "%' order by num desc" ;
	}else {
		sql = "select num, title, author, writeDate, viewcnt from bbs order by num desc";
	}
	
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
	
	// 페이지네이션 개수
	total = (int)Math.ceil(bbsList.size()*1.0/dataCriteria*1.0);
	end = start + pageCriteria >= total ? total : start+pageCriteria; 
	dataEnd = dataStart + dataCriteria > bbsList.size() ? bbsList.size() : dataStart + dataCriteria;
// 	System.out.println("전체 데이터 개수:"+ bbsList.size() + "\t" + (bbsList.size()*1.0/5*1.0));
// 	System.out.println("전체 페이지네이션:"+ total);
// 	System.out.println("페이지네이션 시작점 - 끝점:" + start + " ~ " + end);
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
            	for(int i = dataStart; i<dataEnd; i++){
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
        <% if((searchType != null) && (target != null)){ %>
	        <ul>
	            <li class="prev">
	            	<a href="?page=space/openSpace&searchType=<%=searchType %>&target=<%=target %>&start=<%=start == 0 ? 0 : start-pageCriteria %>" class="bl_btn">prev</a>
	            </li>
	            <% for(int i = start; i<end; i++){ %>
	            <li><a href="?page=space/openSpace&searchType=<%=searchType %>&target=<%=target %>&start=<%=start %>&count=<%=(i*dataCriteria) %>"><%=i+1 %></a></li>
	            <%} %>
	            <li class="next">
	            	<a href="?page=space/openSpace&searchType=<%=searchType %>&target=<%=target %>start=<%=end != total ? start+pageCriteria : start %>&count=<%=end != total? dataStart+dataCriteria : dataStart %>" class="wt_btn">next</a>
	            </li>	
	        </ul>
        <% }else{%>
	        <ul>
	            <li class="prev">
	            	<a href="?page=space/openSpace&start=<%=start == 0 ? 0 : start-pageCriteria %>" class="bl_btn">prev</a>
	            </li>
	            <% for(int i = start; i<end; i++){ %>
	            <li><a href="?page=space/openSpace&start=<%=start %>&count=<%=(i*dataCriteria) %>"><%=i+1 %></a></li>
	            <%} %>
	            <li class="next">
	            	<a href="?page=space/openSpace&start=<%=end != total ? start+pageCriteria : start %>&count=<%=end != total? dataStart+dataCriteria : dataStart %>" class="wt_btn">next</a>
	            </li>	
	        </ul>
          <%} %>
        </div>
        <form action="?page=space/openSpace" method="POST">
          <select name="searchType">
            <option name="title" value = "title">제목</option>
            <option name="content" value = "content">내용</option>
            <option name="author" value = "author">작성자</option>
          </select>
          <input type="search" name="target" placeholder="검색어를 입력하세요" required />
          <button type="submit" class="wt_btn">검색</button>
        </form>
      </div>
    </div>
  </section>
</div>