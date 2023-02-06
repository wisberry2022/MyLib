<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "localSQL.LocalMySql, java.util.*, java.sql.*" %>

<%
	String id = request.getParameter("id") != null ? request.getParameter("id") : "exam";
	String sql = "select id, convert(aes_decrypt(pwd, sha2('key', 512)) using UTF8) as pwd,email,nickname,address,typeid from userinfo where id='" + id + "'";
	System.out.println(sql);
	String[] datas = new String[6];
	System.out.println(sql);
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		conn = LocalMySql.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			datas[0] = rs.getString(1);
			datas[1] = rs.getString(2);
			datas[2] = rs.getString(3);
			datas[3] = rs.getString(4);
			datas[4] = rs.getString(5);
			datas[5] = String.valueOf(rs.getInt(6));
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	
%>
<div id="detailBox">
  <div>
    <h3>회원정보 수정</h3>
  </div>
  <form action="data/admin/userManage/update.jsp" method="POST">
  	<input type = "hidden" name = "origin" value = "<%=datas[0] %>" />
    <table>
      <thead class="sr_only">
        <tr>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>닉네임</th>
          <th>이메일</th>
          <th>주소</th>
          <th>회원 유형</th>
        </tr>
      </thead>
      <tbody>
        <tr class="singleCell">
          <td class="title">아이디</td>
          <td><input type="text" name="id" value="<%=datas[0] %>" /></td>
          <td class="title">비밀번호</td>
          <td><input type="password" name="pwd" value = "<%=datas[1] %>" /></td>
        </tr>
        <tr class="singleCell">
          <td class="title">이메일</td>
          <td><input type="email" name="email" value = "<%=datas[2]%>"/></td>
          <td class="title">닉네임</td>
          <td><input type="text" name="nickname" value = "<%=datas[3]%>" /></td>
        </tr>
        <tr class="doubleCell">
          <td class="title">주소</td>
          <td><input type="text" name="address" value = "<%=datas[4]%>"  /></td>
          <td class="title">회원 유형</td>
          <td>
            <select name="typeid">
              <option value="1">관리자</option>
              <option value="2" selected="selected">일반회원</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="btnBox">
<!--     <input type = "submit" value = "수정하기" /> -->
      <button type = "submit" class="bl_btn">수정하기</button>
      <button class="wt_btn">취소하기</button>
    </div>
  </form>
</div>
