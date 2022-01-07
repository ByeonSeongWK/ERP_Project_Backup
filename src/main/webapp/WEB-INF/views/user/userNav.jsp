<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
    <!-- 네비 CSS -->
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
	
</head>

  <body>
      <div id="nav">
        <!-- nav 상단부분 -->
        <div class="nav_top">
        	<!-- 로고 이미지 -->
          <div class="logo">
            <img src="${path}/resources/images/logo.png" alt="" />
          </div>
          <!-- 오른쪽 텍스트 영역 -->
          <div class="profile">
            <div class="pofile_user">
       		  <span class="user_num">SAL-001</span>
       		  <span class="user_name">홍길동 </span>
       		</div>
          	<a class="mypage_btn" href="myPage">마이페이지</a>
          	<a class="logout_btn" href="/logout">로그아웃</a>
          </div>
        </div>

        <!-- nav 하단부분 -->
        <div class="nav_bottom">
          <ul class="nav_list">
            <li><a id="mainNavItem" href="userMain">ERP_Program</a></li>
            <li><a id="productNavItem" href="product">제품관리</a></li>
            <li><a id="salesListNavItem" href="salesList">영업관리</a></li>
            <li><a id="supplierNavItem" href="supplier">공급처관리</a></li>
            <li><a id="clientsNavItem" href="clients">고객관리</a></li>
            <li><a id="ordersNavItem" href="orders">발주관리</a></li>
            <li><a id="accountingNavItem" href="accounting">회계</a></li>
          </ul>
        </div>
      </div>

      <!-- 상단 bar -->
      <div id="topBar">
        <!-- 상단 제목 -->
        <h2>USER PAGE</h2>
      </div>

  </body>
      <script>
      $(document).ready(function () {
      	var url = window.location.pathname;
      	if(url == '/userMain') $('#mainNavItem').addClass('on');
      	else if(url == '/user/product') $('#productNavItem').addClass('on');
      	else if(url == '/user/salesList') $('#salesListNavItem').addClass('on');
      	else if(url == '/user/supplier') $('#supplierNavItem').addClass('on');
      	else if(url == '/user/clients') $('#clientsNavItem').addClass('on');
      	else if(url == '/user/orders') $('#ordersNavItem').addClass('on');
      	else if(url == '/user/accounting') $('#accountingNavItem').addClass('on');
      });
      </script>
</html>
