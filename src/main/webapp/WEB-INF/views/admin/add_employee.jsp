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
<!-- 제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<!-- 네비 CSS -->
<link rel="stylesheet" href="${path}/resources/css/erpNav.css" />
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" />
<!-- 부트스트랩 JS -->
<script src="${path}/resources/js/bootstrap.js"></script>
<!-- AJAX -->
<script src="//ajax.googleapis.com/ajax/libs/jquery.min.js"
	charset="UTF-8"></script>
<!-- 주소찾기 -->
<script src="${path}/resources/js/address.js" charset="UTF-8"></script>

<script>
$(document).ready(function(){
	//---  주소 검색 모달에서 주소 입력 시
		$('#getAddrBtn').click(function(){
			var postCode = $('#entry_postcode5').val();
			var doroAddr = $('#entry_address').val();
			var jibunAddr = $('#entry_extra_info').val();
			
			$('#addr1').val(postCode);
			$('#addr2').val(doroAddr + ' ' + jibunAddr);
		});
	
	// 부서 검색시 ajax
		$('#deptSelectBtn').click(function(){
			var dept_num = $('#selectDept').val();
			$.ajax({
				type : 'POST',
				url : './getUserNumCnt',
				data : {
					dept_num : dept_num
				},
				
				dataType : 'JSON',
				success : function(data) {
						$('#user_num').val(data.user_num);	
						$('#dept_num').val(data.dept_num);	
						$('#dept_name').val(data.dept_name);	
				}
			})
		});
	});
	
</script>
<script>

</script>
</head>
<body>
	<div id="wrap">
	<!-- 유저 네비게이션 -->
    <jsp:include page = "adminNav.jsp" />

	<!-- 사원등록 컨테이너(Bootstrap) -->
	<div id="contents" style="float: left; margin-top: 2%;">
		<div class="container">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="jumbotron" style="background-color: #F7FBFC; background-color: #f7fbfc; border: 2px solid #b9d7ea;">
					<form method="POST" action="./joinAction">
						<h3 style="text-align: center; margin: -5% 0 10% 0;">사원등록</h3>

						<!-- 사원번호 입력 -->
						<div class="row">
							<div class="form-group col-sm-9 col-md-9 col-lg-9">
								<input type="text" name="user_num" id="user_num"
									class="form-control" placeholder="사원번호" readonly>
							</div>
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<button type="button" class="btn btn-info btn-block"
									style="background-color: #B9D7EA; border: 1px solid #B9D7EA;"
									data-toggle="modal" data-target="#searchDeptModal">부서찾기</button>
							</div>
						</div>


						<!-- 부서번호 -->
						<div class="row">
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<input type="text" class="form-control" id="dept_num"
									name="dept_num" placeholder="부서코드" readonly>
							</div>
						</div>

						<!-- 부서명 -->
						<div class="row">
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<input type="text" class="form-control" id="dept_name"
									name="dept_name" placeholder="부서명" readonly>
							</div>
						</div>

						<!-- 비밀번호 입력 -->
						<div class="row">
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<input type="password" class="form-control" id="user_pw"
									name="user_pw" placeholder="비밀번호" value="erp1234" readonly>
							</div>
						</div>

						<!-- 이름 입력 -->
						<div class="row">
							<div class="form-group cols-sm12 col-md-12 col-lg-12">
								<input type="text" class="form-control" name="user_name"
									placeholder="이름">
							</div>
						</div>

						<!-- 전화번호 입력 -->
						<div class="row">
							<div class="form-group cols-sm12 col-md-12 col-lg-12">
								<input type="text" class="form-control" name="user_tel"
									placeholder="전화번호">
							</div>
						</div>

						<!-- 이메일 입력 -->
						<div class="row">
							<div class="form-group cols-sm12 col-md-12 col-lg-12">
								<input type="email" class="form-control" name="user_email"
									placeholder="이메일">
							</div>
						</div>

						<!-- 주소 입력 -->
						<div class="row">
							<!-- 우편번호 -->
							<div class="form-group col-sm-6 col-md-6 col-lg-6">
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="우편번호" readonly>
							</div>

							<div class="form-group col-sm-6 col-md-6 col-lg-6">
								<button type="button" class="btn btn-info btn-block" style="background-color: #B9D7EA; border: 1px solid #B9D7EA;"
									data-toggle="modal" data-target="#addrModal">주소검색</button>
							</div>

							<!-- 주소 -->
							<div class="form-group cols-sm12 col-md-12 col-lg-12">
								<input type="text" class="form-control" id="addr2" name="addr2" placeholder="주소" readonly>
							</div>

							<!-- 상세 주소 -->
							<div class="form-group cols-sm12 col-md-12 col-lg-12">
								<input type="text" class="form-control" id="addr3" name="addr3" placeholder="상세 주소">
							</div>
						</div>

						<!-- 제출 버튼 -->
						<div class="form-group">
							<input type="submit" class="btn btn-info form-control" value="사원등록" style="background-color: #769fcd; border: 1px solid #769fcd">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 부서 번호 검색 모달  -->
<div id="searchDeptModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<!-- &times; : 부트스트랩 x 아이콘 만들기 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">부서 검색</h4>
			</div>
			<div class="modal-body">
				<div class="row">
						<div class="form-group col-sm-6 col-md-6 col-lg-6">
							<select class="form-control selectpicker noborder"
								data-style="btn-info" name="selectDept" id="selectDept">
								<optgroup label="부서선택">
								
								<c:forEach var = 'dept'  items = "${dept_list}">
									<option value="${dept.dept_num }">${dept.dept_name}</option>
								</c:forEach>
								
								</optgroup>
							</select>
						</div>

						<div class="form-group col-sm-6 col-md-6 col-lg-6">
							<button type="button" class="btn btn-info btn-block" id = "deptSelectBtn"
								style="background-color: #B9D7EA; border: 1px solid #B9D7EA;"
								data-toggle="modal" data-target="Modal">부서선택</button>
						</div>
				

				</div>
			</div>
		</div>
	</div>
</div>
<!-- 부서 번호 검색 모달  종료 -->


<!-- 우편 번호 검색 모달 -->
<div id="addrModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class=modal-content>
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">주소 검색</h4>
			</div>
			<div class="modal-body">
				<div class="row" id="postcodify">
					<script>
						$('#postcodify')
								.postcodify(
										{
											insertPostcode5 : '#entry_postcode5',
											insertAddress : '#entry_address',
											insertExtraInfo : '#entry_extra_info',
											userFullJibeon : true,
											mapLinkProvider : 'google',

											ready : function() {
												$(
														'#postcodify div.postcode_search_status.empty')
														.hide();
											},

											beforeSearch : function() {
												$('#entry_box').hide();
											},

											afterSearch : function(
													selectedEntry) {
												$(
														'#postcodify div.postcode_search_result')
														.remove();
												$(
														'#postcodify div.postcode_search_status.summary')
														.hide();
												$('#entry_box').show();
												$('#entry_details').focus();
											}

										});
					</script>
				</div>
				<div>
					<p>
						<label for="entry_postcode5">우편번호</label> <input type="text"
							class="form-control" id="entry_postcode5" readonly>
					</p>
					<p>
						<label for="entry_address">도로명주소</label> <input type="text"
							class="form-control" id="entry_address" readonly>
					</p>
					<p>
						<label for="entry_extra_info">지명주소</label> <input type="text"
							class="form-control" id="entry_extra_info" readonly>
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="getAddrBtn" class="btn btn-primary" style="background-color: #769fcd; border: 1px solid #769fcd"
					data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<%-- 주소 검색 모달 종료--%>

</body>
</html>
