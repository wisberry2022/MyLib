<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <td colspan="4" class="title">부산지역도서관 "시민에게 원화의 맛을, 그림책의 맛을" 행사 안내</td>
                  </tr>
                  <tr>
                    <td>작성자: 도서관 협력팀</td>
                    <td>작성일: 2022.02.08</td>
                    <td>댓글: 0</td>
                    <td>조회수: 512</td>
                  </tr>
                </tbody>
              </table>
              <div class="mainContent">
                안녕하세요
              </div>
            </div>
            <div class="btnBox">
              <a href="?page=space/rewrite" class="bl_btn">수정하기</a>
              <a href="#" class="wt_btn">삭제하기</a>
            </div>
          </div>
          <div class="commentBox container">
            <h4>댓글</h4>
            <!-- 로그인 후 -->
            <!-- <strong>user01님</strong>
            <div>
              <form action="#" method="POST">
                <textarea></textarea>
                <div>
                  <button type="submit" class="wt_btn">댓글 달기</button>
                </div>
              </form>
            </div> -->
            <!-- 로그인 후 -->
            <!-- 로그인 전 -->
            <div class="unlogin">
              <h5>로그인을 하신 후 댓글을 작성하실 수 있습니다</h5>
            </div>
            <!-- 로그인 전 -->
          </div>
          <form action="#" method="post">
            <div class="commentList container">
              <div class="comment">
                <div>
                  <span>작성자: user03</span>
                  <span>작성일자: 2023.02.12</span>
                </div>
                <div class="commentContent">
                  <p>
                    안녕하세요
                  </p>
                  <!-- <p>
                    <textarea name="updateContent" class="updater"></textarea>
                  </p> -->
                  <!-- 로그인 및 본인 댓글일 시 -->
                  <div class="btnBox">
                    <button type="button" class="bl_btn">수정하기</button>
<!--                     <button href="#" class="bl_btn">확인</button> -->
                    <button type="submit" class="wt_btn">삭제하기</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
          <form action="#" method="post">
            <div class="commentList container">
              <div class="comment">
                <div>
                  <span>작성자: user03</span>
                  <span>작성일자: 2023.02.12</span>
                </div>
                <div class="commentContent">
                  <p>
                    안녕하세요
                  </p>
                  <!-- <p>
                    <textarea name="updateContent" class="updater"></textarea>
                  </p> -->
                  <!-- 로그인 및 본인 댓글일 시
                  <div class="btnBox">
                    <button type="button" class="bl_btn">수정하기</button>
                    <button href="#" class="bl_btn">확인</button>
                    <button type="submit" class="wt_btn">삭제하기</button>
                  </div> -->
                </div>
              </div>
            </div>
          </form>
        </section>
      </div>
