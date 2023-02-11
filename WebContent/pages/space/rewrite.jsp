<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "Bbs" class = "beanData.BbsBean" />
<%@page import = "java.sql.*, localSQL.LocalMySql" %>
<%
	String id = request.getParameter("id");
	String sql = "select title, content from bbs where num=" + id;

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			Bbs.setTitle(rs.getString(1));
			Bbs.setContent(rs.getString(2));
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	System.out.println(Bbs.getTitle());
	System.out.println(Bbs.getContent());
%>
<div id="wrapper">
  <div class="over_section bg_set itm01">
    <h2>열린공간</h2>
  </div>
  <section id="write">
    <div class="container">
      <h3>자유게시판</h3>
      <form action="?page=space/update&prefix=data" method="post">
      	<input type = "hidden" name = "updateTarget" value="<%=id %>" />
        <table>
          <thead class="sr_only">
            <tr>
              <th>제목</th>
              <th>내용</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <label for="writeTitle">제목</label>
              </td>
              <td>
                <input type="text" name="writeText" id="writeTitle" value="<%=Bbs.getTitle() %>" placeholder="제목을 입력하세요" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="content">내용</label>
              </td>
              <td>
                <textarea name="content" id="content"><%=Bbs.getContent() %></textarea>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="btnBox">
          <button type="submit" class="bl_btn">수정하기</button>
          <button type="reset" class="wt_btn">취소하기</button>
        </div>
      </form>
    </div>
  </section>
</div>