<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "User" class = "beanData.UserBean" scope = "session"/>
<jsp:useBean id = "Bbs" class = "beanData.BbsBean" scope = "page" />
<jsp:useBean id = "Cmt" class = "beanData.CmtBean" />
<%@page import = "java.sql.*, localSQL.LocalMySql, java.util.*" %>
<%
	String id = request.getParameter("id");
	System.out.println("detail.jsp: " + id);
	String sql = "select num, title, author, writeDate, content, viewcnt, (select count(bbs_num) from comment where bbs.num = comment.bbs_num) as cmtcnt from bbs where num=" + id + "";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int viewcnt=0;
	
	try{
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			Bbs.setNum(rs.getInt(1));
			Bbs.setTitle(rs.getString(2));
			Bbs.setAuthor(rs.getString(3));
			Bbs.setWriteDate(rs.getDate(4));
			Bbs.setContent(rs.getString(5));
			Bbs.setViewcnt(rs.getInt(6));
			Bbs.setCmtcnt(rs.getInt(7));
			viewcnt = rs.getInt(6);
			String usql = "update bbs set viewcnt=" + (viewcnt + 1) + " where num=" + id;
			stmt.executeUpdate(usql);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	
	String csql = "select author, writeDate, content from comment where bbs_num = " + id + " order by num desc";
	System.out.println(csql);
	List<String[]> cmtList = new ArrayList();
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(csql);
		
		while(rs.next()) {
			String[] cmts = new String[3];
			cmts[0] = rs.getString(1);
			cmts[1] = rs.getDate(2).toLocalDate().toString();
			cmts[2] = rs.getString(3);
			Cmt.setAuthor(rs.getString(1));
			cmtList.add(cmts);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
%>
<div id="wrapper">
  <div class="over_section bg_set itm01">
    <h2>열린공간</h2>
  </div>
  <section id="board">
    <div class="boardBox container">
      <h3>자유게시판</h3>
      <div id="boardContent">
        <table>
          <thead class="sr_only">
            <tr>
              <th>제목</th>
              <th>글쓴이</th>
              <th>조회수</th>
              <th>작성일자</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="4" class="title"><%=Bbs.getTitle() %></td>
            </tr>
            <tr>
              <td>작성자: <%=Bbs.getAuthor() %></td>
              <td>작성일: <%=Bbs.getWriteDate().toString() %></td>
              <td>댓글: <%=Bbs.getCmtcnt() %></td>
              <td>조회수: <%=Bbs.getViewcnt() %></td>
            </tr>
          </tbody>
        </table>
        <div class="mainContent">
          <%=Bbs.getContent() %>
        </div>
      </div>
      <div class="btnBox">
      <% 
      if(User.getId() != null) {
      	if((User.getId().equals("admin")) || (User.getNickname().equals(Bbs.getAuthor()))){ %>
	        <a href="?page=space/rewrite&prefix=id:<%=Bbs.getNum() %>" class="bl_btn">수정하기</a>
	        <a href="?page=space/delete&prefix=id:<%=Bbs.getNum() %>&parent=data" class="wt_btn">삭제하기</a>
	  <%}} %>      
      </div>
    </div>
    <div class="commentBox container">
      <h4>댓글</h4>
      <% if(User.getNickname() != null){ %>
      <strong><%=User.getNickname() %>님</strong>
      <div>
        <form action="?page=cmt/cmtRegister&prefix=data" method="POST">
          <input type = "hidden" name = "before" value = "<%=id %>" />
          <textarea name = "comment"></textarea>
          <div>
            <button type="submit" class="wt_btn">댓글 달기</button>
          </div>
        </form>
      </div>
      <%}else{ %>
      <div class="unlogin">
        <h5>로그인을 하신 후 댓글을 작성하실 수 있습니다</h5>
      </div>
      <%} %>
    </div>
    <% 
    	for(int i = 0; i<cmtList.size(); i++){ 
    		String[] data = cmtList.get(i);	
    %>
    <form action="#" method="post">
      <div class="commentList container">
        <div class="comment">
          <div>
            <span>작성자: <%=data[0] %></span>
            <span>작성일자: <%=data[1] %></span>
          </div>
          <div class="commentContent">
            <p>
              	<%=data[2] %>
            </p>
            <!-- <p>
              <textarea name="updateContent" class="updater"></textarea>
            </p> -->
            <!-- 로그인 및 본인 댓글일 시 -->
            <div class="btnBox">
              <% 
              if(User.getId() != null){
            	  if(User.getNickname().equals(Cmt.getAuthor())) {
              %>
              <button type="button" class="bl_btn">수정하기</button>
<!--                     <button href="#" class="bl_btn">확인</button> -->
              <button type="submit" class="wt_btn">삭제하기</button>
              <%
            	 }
            	  } %>
            </div>	
          </div>
        </div>
      </div>
    </form>
    <%} %>
  </section>
</div>
