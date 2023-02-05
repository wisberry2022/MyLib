# 도서 정보 관리 시스템

온라인으로 도서정보를 확인하고, 원하는 도서를 관리할 수 있는 웹페이지를 구현하기 위해 시작한 프로젝트입니다.

***

## 사용 기술 스택
- Java & JSP
- MySQL
- HTML/CSS/JAVASCRIPT

***

## 버전 업데이트

- 2023.01.31 (Ver0.1.0)
  - Index.jsp화면 구성
  - First.jsp(최초 접속 시 등장하는 화면) 구현 완료

<br />

- 2023.02.01 (Ver0.2.0)
  - 로그인 화면 구현 완료

<br />

- 2023.02.03 (Ver0.3.0)
  - 회원가입 화면 구현 완료
  - 회원정보를 담기 위한 userinfo, usertype 테이블 스키마 구성

<br />

- 2023.02.04 (Ver0.4.0)
  - MySQL과 프로젝트 연동 
  - 신규회원가입, 로그인 기능 구현 완료
  - 로그인 시 아이디, 비밀번호 일치하지 않을 시 모달 창 생성(JS이용)

<br />

- 2023.02.05 (Ver0.5.1)
  - 회원가입, 로그인 시 DB 연결해제를 더욱 안전하게 진행할 수 있도록 처리(finally 처리)
  - 관리자 페이지 구현(유저 관리 페이지 구현)
    - 회원 목록 출력(userManage)
        -  페이지네이션 기능 구현 완료
        -  detail.jsp를 위한 중간 기능 구현 완료
  
  * Bug Fixed
    - userinfo 테이블 스키마에서 nickname 누락되어 있는 것을 확인 -> nickname field 추가

  * ETC
    - 회원정보 목록 출력을 위한 더미 Insert Data 추가(test/dummy_test.txt)

  * 향후 추가사항
      - ~~페이지네이션 기능 구현 완료(2023.02.05 17:32분경 구현 완료)~~
      - 회원 정보 수정, 삭제, 삽입을 위한 추가기능 구현 필요

<br />

  ***

<br />

  ## 수정해야 할 Bug
  
    - data/login/signup.jsp
	    - response.sendRedirect("../../index.jsp?page=login/signup&error=dberror");
	      - db error 시 관리자 문의 에러페이지로 넘어가게 구성
	    - response.sendRedirect("../../index.jsp?page=login/signup&error=error");
	      - 비밀번호/확인 비밀번호(re field) 맞지 않았을 때 모달 창 뜨게하기