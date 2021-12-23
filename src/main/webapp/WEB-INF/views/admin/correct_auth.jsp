<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <!-- 네비 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
    <!-- 외부 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/correct_auth.css" />
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap-test.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
    <!-- 제이쿼리  -->
    <script src="${path}/resources/js/jquery.js"></script>

    <!-- font --------------------------------------------->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
      crossorigin="anonymous"
    />
    
    <script>
    $(function () {
    	  var current = 0;

    	  $("#box > label").click(function () {
    	    var i = $(this).index();

    	    $("#box > label").removeClass();
    	    $(this).addClass("on");
    	  });
    	});
    </script>
  </head>

  <body>
    <div id="wrap">
      <!-- nav 시작 -->
      <!-- 상단 bar -->
      <div id="topBar">
        <!-- 상단 제목 -->
        <h2>부서권한관리</h2>
      </div>

      <!-- nav bar -->
      <div id="nav">
        <!-- nav 상단부분 -->
        <div class="nav_top">
          <div class="profile"></div>
          <span>admin</span>
        </div>

        <!-- nav 하단부분 -->
        <div class="nav_bottom">
          <ul class="nav_list">
					<li><a href="adminMain">ERP_Project</a></li>
					<li><a href="search_employee">사원관리</a></li>
					<li><a href="add_employee">사원등록</a></li>
					<li><a href="search_dept">부서관리</a></li>
					<li  style="background-color: #b9d7ea; font-weight: bold; color: #fff; font-size: 20px">부서권한관리</li>
          </ul>
        </div>
      </div>
      <!-- nav 끝 -->
      <!-- contents 부분 -->
      <div
        id="contents"
        style="float: right; margin-top: 3%; width: 90%; height: 100%"
      >
        <div id="auth">
          <article id="box">
            <input id="tab1" type="radio" name="tabs" checked />
            <label for="tab1">영업부</label>
            <input id="tab2" type="radio" name="tabs" />
            <label for="tab2">인사부</label>
            <input id="tab3" type="radio" name="tabs" />
            <label for="tab3">구매관리부</label>
            <!-- <input id="tab4" type="radio" name="tabs" />
            <label for="tab4">부서미정</label> -->

			<c:forEach var = "auth_dept" items = "${auth_list}" >
            <section id="con${i}">
              <table width="300" height="400" cellpadding="0" cellspacing="0"  border="1"  >
                <tr class="table_head">
                  <td>테이블 명</td>
                  <td>수정</td>
                  <td>검색</td>
                </tr>
                <tr>
                  <td>영업</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>영업내역</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>고객</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>발주</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>공급처</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>제품</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>회계</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
              </table>
            </section>
            </c:forEach>
            
            
            <section id="con2">
              <table
                width="300"
                height="400"
                cellpadding="0"
                cellspacing="0"
                border="1"
              >
                <tr class="table_head">
                  <td>테이블 명</td>
                  <td>수정</td>
                  <td>검색</td>
                </tr>
                <tr>
                  <td>영업</td>
                  <td>
                    <input type="checkbox" />
                  </td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>영업내역</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>고객</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>발주</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>공급처</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>제품</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>회계</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
              </table>
            </section>
            <section id="con3">
              <table
                width="300"
                height="400"
                cellpadding="0"
                cellspacing="0"
                border="1"
              >
                <tr class="table_head">
                  <td>테이블 명</td>
                  <td>수정</td>
                  <td>검색</td>
                </tr>
                <tr>
                  <td>영업</td>
                  <td>
                    <input type="checkbox" />
                  </td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>영업내역</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>고객</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>발주</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>공급처</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>제품</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>회계</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
              </table>
            </section>
            <!-- <section id="con4">
              <table
                width="300"
                height="400"
                cellpadding="0"
                cellspacing="0"
                border="1"
              >
                <tr>
                  <td>테이블 명</td>
                  <td>수정</td>
                  <td>검색</td>
                </tr>
                <tr>
                  <td>영업</td>
                  <td>
                    <input type="checkbox" />
                  </td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>영업내역</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>고객</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>발주</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>공급처</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>제품</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
                <tr>
                  <td>회계</td>
                  <td><input type="checkbox" /></td>
                  <td><input type="checkbox" /></td>
                </tr>
              </table>
            </section> -->
          </article>
        </div>
      </div>
    </div>
  </body>
</html>
