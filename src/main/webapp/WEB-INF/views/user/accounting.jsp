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
    <!-- 회계 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/account.css" />
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
    <!-- 제이쿼리  -->
    <script src="${path}/resources/js/jquery.js"></script>

	<!-- font 링크--------------------------------------------->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>
<body>
<div id="wrap">
    
    <!-- 유저 네비게이션 -->
    <jsp:include page = "userNav.jsp" />
    
	<!-- contents 부분 -->
	<div id="contents"
		style="float: right; margin-top: 0%; width: 88%; height: 100%; background-color: #fff;">
			<h3>전표입력</h3>
			<!-- 테이블 항목 -->
			<div class="table-responsive"
				style="width: 100%; height: auto; display: block;
	/* background-color: #f7fbfc; */
	/* margin-left: 1%; */ box-sizing: border-box;">
				<!-- 전표입력부분 -->
				<ul id="add_Acc">
					<li>
						<ul id="add_con">
							<li>회계단위</li>
							<li class="acc_search"><input type="text" disabled /> <i
								class="fas fa-search-plus"></i></li>
							<li><input type="text" disabled /></li>
						</ul>
					</li>
					<li>
						<ul id="add_con">
							<li>작성자</li>
							<li class="acc_search"><input type="text" disabled /> <i
								class="fas fa-search-plus"></i></li>
							<li><input type="text" disabled /></li>
						</ul>
					</li>
					<li>
						<ul id="add_conday">
							<li>작성일자</li>
							<li class="acc_searchday"><input type="date" /></li>
						</ul>
					</li>
				</ul>
				<!-- 전표입력 종료 -->
				<!-- 조회 탭 -->
				<div class="read_table"
					style="width: 1630px; height: 500px; margin-left: 1%; margin-top: 1%; text-align: center; border: 2px solid #000;">
					<!-- 제목 -->
					<div class="table_title" style="height: 25px">
						<div style="width: 50px; text-align: center; margin: 0">
							<i class="fas fa-tasks"></i>
						</div>
						<div style="width: 55px; text-align: center">차/대</div>
						<div style="width: 150px; text-align: center">항목</div>
						<div style="width: 195px; text-align: center">발생일</div>
						<div style="width: 165px; text-align: center">금액</div>
						<div style="width: 165px; text-align: center">발생위치</div>
						<div style="width: 165px; text-align: center">작업자</div>
						<div style="width: 680px; text-align: center">비고</div>
					</div>
					<!-- 내용 -->
					<div class="read_all"
						style="width: 100% -10px; height: 475px; overflow-y: scroll">
						<div class="table_con" style="height: 25px">
							<div style="width: 50px; text-align: center; margin: 0">
								<input type="checkbox" name="check" value="check" />
							</div>
							<div style="width: 55px; text-align: center"></div>
							<div style="width: 150px; text-align: center"></div>
							<div style="width: 195px; text-align: center"></div>
							<div style="width: 165px; text-align: center"></div>
							<div style="width: 165px; text-align: center"></div>
							<div style="width: 165px; text-align: center"></div>
							<div style="width: 663px; text-align: center"></div>
						</div>
					</div>
				</div>
				<div class="add_table"
					style="width: 1630px; height: 200px; margin-left: 1%; margin-top: 1%; text-align: center; border: 2px solid #000;">
					<!-- 제목 -->
					<div class="table_title" style="height: 25px">
						<div style="width: 3%; text-align: center">순번</div>
						<div style="width: 5%; text-align: center">차/대</div>
						<div style="width: 15%; text-align: center">항목</div>
						<div style="width: 12%; text-align: center">발생일</div>
						<div style="width: 10%; text-align: center">금액</div>
						<div style="width: 10%; text-align: center">발생위치</div>
						<div style="width: 45%; text-align: center">비고</div>
					</div>
					<div class="table_con" style="height: 25px">
						<div style="width: 3%; text-align: center">1</div>
						<div style="width: 5%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 15%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 12%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 10%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 10%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 45%; text-align: center">
							<input type="text" />
						</div>
					</div>
					<div class="table_con" style="height: 25px">
						<div style="width: 3%; text-align: center">2</div>
						<div style="width: 5%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 15%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 12%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 10%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 10%; text-align: center">
							<input type="text" />
						</div>
						<div style="width: 45%; text-align: center">
							<input type="text" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>