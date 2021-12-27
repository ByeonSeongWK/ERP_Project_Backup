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
    <!-- 네비 CSS -->
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
    <!-- 제이쿼리  -->
    <script src="${path}/resources/js/jquery.js"></script>
	<script>
      $(document).ready(function () {
        $("#nav .nav_list > li ").click(function () {
          $("#nav .nav_list > li").removeClass();
          $(this).addClass("on");
        });
      });
      </script>
</head>

  <body>
      <div id="nav">
        <!-- nav 상단부분 -->
        <div class="nav_top">
          <div class="profile"></div>
          <span>user</span>
        </div>

        <!-- nav 하단부분 -->
        <div class="nav_bottom">
          <ul class="nav_list">
            <li><a href="main">ERP_Project</a></li>
            <li><a href="myPage">마이페이지</a></li>
            <li><a href="product">제품관리</a></li>
            <li><a href="salesList">영업관리</a></li>
            <li><a href="supplier">공급처관리</a></li>
            <li><a href="clients">고객관리</a></li>
            <li><a href="orders">발주관리</a></li>
            <li><a href="accounting">회계</a></li>
          </ul>
        </div>
      </div>

      <!-- 상단 bar -->
      <div id="topBar">
        <!-- 상단 제목 -->
        <h2>USER PAGE</h2>
      </div>
    
  </body>
</html>
