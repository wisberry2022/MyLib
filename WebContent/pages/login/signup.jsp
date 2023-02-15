<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type = "text/javascript">
	var modalFrame, modal;
	var form;
	var ipBox, warn;
	var pw, re;
	
	$(function() {
		modalFrame = $('#back');
		modal = modalFrame.children();
		form = $('#signupBox form').eq(0);
		pw = $('#signupBox .inputBox #pwd');
		re = $('#signupBox .inputBox #re');
		
		// 팝업창 이벤트1
		modalFrame
			.hide()
			.click(function(e) {
				e.stopPropagation();
				modal.find('.bl_btn').click();
			});
		
		// 팝업창 이벤트2
		modal
			.children('.btnBox')
			.find('.bl_btn')
			.click(function(e) {
				e.stopPropagation();
				modalFrame.hide();
				// 모달창 닫은 뒤 비밀번호/비밀번호 재확인 창 
				pw.val('');
				re.val('');
			});
		
		
		// 필수입력칸 
		$('#signupBox .inputBox').each(function(idx,ele) {
			// 필수입력 칸 비어있을 경우 경고창 표시
			if(idx < 5) {
				warn = $('<span>').text('필수입력 사항입니다').addClass('warn');
				$(ele).append($(warn));
				ipBox = $(ele).find('input');
				ipBox.keyup(function(e) {
					$(ele).find('.warn').hide();
					if(idx == 2) {
						if(!$(this).val() || $(this).val() != pw.val()) $(ele).find('.warn').text('비밀번호가 일치하지 않습니다').show();	
					}else {
						if(!$(this).val()) $(ele).find('.warn').show();
					}
					 
				})	
			}	
		});
		
		// 프론트단 validation check
		form.submit(function(e) {
			var cnt = 0;
			$('.warn').each(function(idx, ele) {
				if($(ele).css('display') == 'none') cnt+=1;
			})
			if(pw.val() != re.val()) {
				modalFrame.show();	
				return false;
			}
			if(cnt == 5) {
				return true;
			}
			else return false;
		})
		
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
<div id="back">
  <div class="modal">
    <div>
      <h3>비밀번호 확인</h3>
      <p>비밀번호가 일치하지 않습니다. 다시 확인해주세요</p>
    </div>
    <div class="btnBox">
      <button type="button" class="bl_btn">확인</button>
    </div>
  </div>
</div>