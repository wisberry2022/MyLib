<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type = "text/javascript">
// <!-- <p>
// <textarea name="updateContent" class="updater"></textarea>
// </p> -->
// <!--                     <button href="#" class="bl_btn">확인</button> -->

	var leftBox, ta, updateBox;
	var arr = [];
	var targetBtn;
	
	var updateCallback = function(targetBtn) {
			var leftBox = targetBtn.parent().siblings();
			ta = $('<textarea>').addClass('updater').attr('name', 'updateContent').text(leftBox.text().trim());
			updateBox = $('<p>').append(ta);
			leftBox.text("");
			return updateBox;
	}
	
	$(function() {
		$('#board .commentContent .btnBox')
			.each(function(idx, ele) {
				if($(ele).children('button').length) arr.push($(ele));
			})
			
		arr.forEach(function(ele,idx){
			$(ele).children().eq(1).hide();
			if($(ele).children().eq(0).text() == '수정하기') {
				$(ele).children().eq(0).on('click', function(e) {
					targetBtn = $(e.target);
					leftBox = targetBtn.parent().siblings();
					leftBox.append(updateCallback(targetBtn));
					targetBtn.hide();
					$(ele).children().eq(1).show();
					
				})
			};
		})
		
	});

</script>
<jsp:useBean id = "User" class = "beanData.UserBean" scope = "session"/>
<jsp:useBean id = "Bbs" class = "beanData.BbsBean" scope = "page" />
<jsp:useBean id = "Cmt" class = "beanData.CmtBean" />
<%@page import = "java.sql.*, localSQL.LocalMySql, java.util.*" %>
<%
	String id = request.getParameter("id");
// 	System.out.println("detail.jsp: " + id);
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
	
	
	String csql = "select num, author, writeDate, content from comment where bbs_num = " + id + " order by num desc";
	System.out.println(csql);
	List<String[]> cmtList = new ArrayList();
	// 자신의 댓글을 찾기 위한 리스트 -> 댓글의 Author와 현재 접속 중인 유저의 닉네임이 같을 경우 1을 추가, 그렇지 않을 경우 0을 추가한다.
	// 이후 화면에서 for문을 통해 cmtList를 뿌릴 때, myList의 원소가 1일 경우, 자신의 댓글로 판단하여 수정하기, 삭제하기 버튼을 출력
	List<Integer> myList = new ArrayList();
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(csql);
		int idx;
		
		while(rs.next()) {
			idx = 0;
			String[] cmts = new String[4];
			if((User.getNickname() != null) && User.getNickname().equals(rs.getString(2))) {
				Cmt.setAuthor(rs.getString(1));
				idx=1;
			}
			cmts[0] = String.valueOf(rs.getInt(1));
			cmts[1] = rs.getString(2);
			cmts[2] = rs.getDate(3).toLocalDate().toString();
			cmts[3] = rs.getString(4);
			cmtList.add(cmts);
			myList.add(idx);
		}
		
		System.out.println(myList);
		
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
//     		System.out.println("댓글 데이터: " + data[0] + "\t" + data[1] + "\t" + data[2]);
    %>
    <form action="?page=cmt/cmtUpdate&prefix=data" method="post">
      <input type = "hidden" name = "bid" value ="<%=id %>" />
      <input type = "hidden" name = "cid" value ="<%=data[0] %>" />
      <div class="commentList container">
        <div class="comment">
          <div>
            <span>작성자: <%=data[1] %></span>
            <span>작성일자: <%=data[2] %></span>
          </div>
          <div class="commentContent">
            <p>
              	<%=data[3] %>
            </p>
<!--             <p> -->
<!--               <textarea name="updateContent" class="updater"></textarea> -->
<!--             </p> -->
            <!-- 로그인 및 본인 댓글일 시 -->
            <div class="btnBox">
              <% 
              if(User.getId() != null){
            	  if(myList.get(i) == 1) {
              %>
              <button type = "button" class="bl_btn">수정하기</button>
              <button type="submit" class="bl_btn">확인</button>
              <button type="button" class="wt_btn"><a href = "?page=cmt/cmtDelete&prefix=id:<%=id %>&parent=data&cmtNum=<%=data[0] %>">삭제하기</a></button>
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
