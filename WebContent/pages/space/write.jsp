<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
  <div class="over_section bg_set itm01">
    <h2>열린공간</h2>
  </div>
  <section id="write">
    <div class="container">
      <h3>자유게시판</h3>
      <form actoin="#" method="post">
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
                <input type="text" name="wrtieText" id="writeTitle" placeholder="제목을 입력하세요" />
              </td>
            </tr>
            <tr>
              <td>
                <label for="content">내용</label>
              </td>
              <td>
                <textarea name="content" id="content"></textarea>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="btnBox">
          <button type="submit" class="bl_btn">등록하기</button>
          <button type="reset" class="wt_btn">취소하기</button>
        </div>
      </form>
    </div>
  </section>
</div>