<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<%@page import = "localSQL.LocalMySql, java.sql.*, java.util.*" %>
<%
	int total = 0;
	int criteria = 5;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "select id, email, nickname, typeid from userinfo where typeid = 2";
	List<String[]> userList = new ArrayList<String[]>();
	
	
	try {	
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String[] data = new String[4];
			data[0] = rs.getString(1);
			data[1] = rs.getString(2);
			data[2] = rs.getString(3);
			data[3] = rs.getString(4);
			userList.add(data);
		}
		
	}catch(Exception e) {
		e.printStackTrace();	
	}finally {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// 페이지 네이션 개수
	total = (int)Math.ceil(userList.size()*1.0/criteria*1.0);
%>
 <div class="innerBox">
     <div>
       <h3>회원 관리하기</h3>
       <p>도서정보시스템에 가입된 회원들을 통합관리할 수 있습니다</p>
     </div>
     <table>
       <thead>
         <tr>
           <th>아이디</th>
           <th>이메일</th>
           <th>닉네임</th>
           <th>회원유형</th>
         </tr>
       </thead>
       <tbody>
       <% for(int i = 0; i<userList.size(); i++) {
    	   String[] data = userList.get(i);
    	   %>
         <tr>
           <td><a href="#"><%=data[0] %></a></td>
           <td><a href="#"><%=data[1] %></a></td>
           <td><a href="#"><%=data[2] %></a></td>
           <td><a href="#"><%=data[3].equals("2") ? "일반회원" : "기타" %></a></td>
         </tr>
        <%
    	   } %>
       </tbody>
     </table>
     <div class="pagination">
       <ul>
         <li class="prev">
           <button type="button" class="bl_btn">prev</button>
         </li>
         <li><a href="#">1</a></li>
         <li class="next">
           <button type="button" class="wt_btn next">next</button>
         </li>
       </ul>
     </div>
   </div>
</body>
