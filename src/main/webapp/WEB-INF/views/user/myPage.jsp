<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
<!-- 기본 CSS -->
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<!-- 네비 CSS -->
<link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
<!-- 부트스트랩 CSS -->
<link rel="stylesheet"
	href="${path}/resources/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
<!-- 제이쿼리  -->
<script src="${path}/resources/js/jquery.js"></script>

</head>
<body>
	<div id="wrap">
		<!-- 유저 네비게이션 -->
		<jsp:include page="userNav.jsp" />


		<!-- contents 부분 -->
		<div id="contents"
			style="float: left; margin-left: 12%; margin-top: 2%">
			<!-- 내용적는 부분 -->
			<div class="container">
				<div class="col-lg-6">
					<div class="jumbotron" style="background-color: #f7fbfc">
						<form method="POST" action="./user_mypage">
							<h3
								style="text-align: center; font-size: 30px; font-weight: 600; padding-bottom: 5%;">
								개인정보 수정</h3>

							<!-- 사원번호 입력 -->
							<div class="row">
								<div class="form-group col-sm-4 col-md-4 col-lg-4">
									<input type="text" name="user_id" class="form-control"
										placeholder="사원번호" readonly />
								</div>

								<!-- 부서번호 -->

								<div class="form-group col-sm-4 col-md-4 col-lg-4">
									<input type="text" class="form-control" id="dept_num"
										name="dept_num" placeholder="부서코드" readonly />
								</div>

								<!-- 부서명 -->

								<div class="form-group col-sm-4 col-md-4 col-lg-4">
									<input type="text" class="form-control" id="dept_name"
										name="dept_name" placeholder="부서명" readonly />
								</div>
							</div>

							<!-- 이름 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" name="user_name"
										placeholder="이름" />
								</div>
							</div>

							<!-- 전화번호 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" name="user_tel"
										placeholder="전화번호" />
								</div>
							</div>

							<!-- 현재 비밀번호 입력 -->
							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<input type="password" class="form-control" id="user_pw"
										name="user_pw" placeholder="현재 비밀번호" />
								</div>
							</div>

							<!-- 변경 비밀번호 입력 -->
							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<input type="password" class="form-control" id="update_user_pw"
										name="update_user_pw" placeholder="변경 할 비밀번호" />
								</div>
							</div>

							<!-- 변경 비밀번호 확인 -->
							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<input type="password" class="form-control"
										id="update_user_pw2" name="update_user_pw2"
										placeholder="변경 할 비밀번호 확인" />
								</div>
							</div>

							<!-- 비밀번호 체크 -->
							<div class="row">
								<div class="form-group col-sm12 col-md-12 col-lg-12">
									<h6 id="diff_pw" class="text-danger" style="display: none">
										변경 할 비밀번호가 서로 다릅니다.</h6>
									<h6 id="equal_pw" class="text-success" style="display: none">
										확인되었습니다.</h6>
								</div>
							</div>

							<!-- 이메일 입력 -->
							<div class="row">
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="email" class="form-control" name="user_email"
										placeholder="이메일" />
								</div>
							</div>

							<!-- 주소 입력 -->
							<div class="row">
								<!-- 우편번호 -->
								<div class="form-group col-sm-6 col-md-6 col-lg-6">
									<input type="text" class="form-control" id="addr1" name="addr1"
										placeholder="우편번호" readonly />
								</div>

								<div class="form-group col-sm-6 col-md-6 col-lg-6">
									<button type="button" class="btn btn-info btn-block"
										style="background-color: #b9d7ea; border: 1px solid #b9d7ea;"
										data-toggle="modal"
										;
                      data-target="#addrModal">
										주소검색</button>
								</div>

								<!-- 주소 -->
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" id="addr2" name="addr2"
										placeholder="주소" readonly />
								</div>

								<!-- 상세 주소 -->
								<div class="form-group cols-sm12 col-md-12 col-lg-12">
									<input type="text" class="form-control" id="addr3" name="addr3"
										placeholder="상세 주소" />
								</div>
							</div>

							<!-- 제출 버튼 -->
							<div class="form-group">
								<input type="submit" class="btn btn-info form-control"
									value="정보변경" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
