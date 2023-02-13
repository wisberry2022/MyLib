<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type = "text/javascript">
	var id, pwd, re, nick, email, address;
	var warn;
	
	$(function() {
		$('#signupBox .inputBox').each(function(idx,ele) {
			if(idx < 5) {
				warn = $('<span>').text('필수입력 사항입니다').addClass('warn');
				$(ele).append($(warn))	
			}
			
		});
		
	});
</script>
<div id="wrapper">
  <section id="signupBox">
    <div class="container">
      <div>
        <figure class="bg_set itm01"></figure>
        <h3>회원가입하기</h3>
      </div>
      <form action="data/login/signup.jsp" method="post">
        <div>
          <div class="inputBox">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" required />
          </div>
          <div class="inputBox">
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" required />
          </div>
          <div class="inputBox">
            <label for="re">비밀번호 확인</label>
            <input type="password" id="re" name="re" required />
          </div>
          <div class="inputBox">
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" required />
          </div>
          <div class="inputBox">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required />
          </div>
          <div class="inputBox">
            <label for="address">주소</label>
            <input type="text" id="address" name="address" />
          </div>
        </div>
        <button class="bl_btn">회원가입하기</button>
      </form>
    </div>
  </section>
</div>