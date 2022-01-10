<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link 	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" /><!-- 기본 CSS -->
<link rel="stylesheet" href="${path}/resources/css/reset.css" /><!-- 네비 CSS -->
<link rel="stylesheet" href="${path}/resources/css/erpNav.css" /><!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" href="${path}/resources/css/bootstrap/custom.css" /><!-- 제이쿼리 -->
<script src="${path}/resources/js/bootstrap.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery.min.js" charset="UTF-8"></script><!-- AJAX -->
<style>
.table-responsive {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.table-responsive::-webkit-scrollbar {
	display: none;
}
</style>
<script>
	$(document).ready(function(){
			
			// 제품 이름으로 제품 검색 ajax 

				$('#searchProductBtn').click(function() {
					var pro_name = $('#pro_name').val();
					$.ajax({
						type : 'POST',
						url : './searchProduct',
						data : {
							pro_name : pro_name
						},
						dataType : 'JSON',
						success : function(data) {
							$('#productListTable').empty();
							var str = '';
							str += '<table style="width: 100%; height: auto; text-align: center" class="table table-hover">';
							for (var i = 0; i < data.length; i++) {
								str += '<tr>';
								str += '<td style="width: 5%; text-align: center; line-height: 30px"><label><input type="checkbox" value="" /></label></td>';
								str += '<td style="width: 20%; text-align: center; line-height: 30px">'+ data[i].pro_num + '</td>';
								str += '<td style="width: 20%; text-align: center; line-height: 30px">'+ data[i].pro_name + '</td>';
								str += '<td style="width: 15%; text-align: center; line-height: 30px">'+ data[i].pro_color + '</td>';
								str += '<td style="width: 15%; text-align: center; line-height: 30px">'+ data[i].pro_count + '</td>';
								str += '<td style="width: 20%; text-align: center; line-height: 30px">'+ data[i].pro_note + '</td>';
								str += '<td style="width: 5%; text-align: center; line-height: 30px"><button type="button" class="btn btn-info btn-block">수정</button></td>';
								str += '</tr>';
							}
							str += '</table>';
							$('#productListTable').append(str);
						},
						error : function(){
							alert('등록되지 않은 제품입니다.');
							return;
						}
					});
				});
				
				// 제품 등록 기능 ajax
				$('#addProAction').click(function(){
					var pro_num 		= $('#pro_num').val();
					var pro_name 	= $('#pro_name').val();
					var pro_color  	= $('#pro_color').val();
					var pro_count 	= $('#pro_count').val();
					var pro_note  	= $('pro_note').val(); 
					
					$.ajax({
						type : 'POST',
						url : './addProductAction',
						data : {
							pro_num		 : pro_num,
							pro_name 	 : pro_name,
							pro_color 	 : pro_color,
							pro_count 	 : pro_count,
							pro_note 	 : pro_note
						},
						dataType : 'JSON',
						success : function(data) {
							$('#addProModal').modal('hide');
							alert('제품 추가 완료');
							$('#productListTable').empty();
							var str = '';
								str += '<table style="width: 85vw; height: auto; text-align: center" class="table table-hover"  id="productListTable">';
								for(var i = 0; i < data.length; i++){
									str += '<tr>';
										str += '<td style="width: 4.5vw; text-align: center; line-height: 30px">';
										str += '<label><input type="checkbox" name="table_product_id" value="' + data[i].pro_num + '" /></label></td>';
										str += '<td style="width: 16.5vw; text-align: center; line-height: 30px">' + data[i].pro_num + '</td>';
										str += '<td style="width: 16.5vw; text-align: center; line-height: 30px">' + data[i].pro_name + '</td>';
										str += '<td style="width: 13.5vw; text-align: center; line-height: 30px">'+ data[i].pro_color + '</td>';
										str += '<td style="width: 13.5vw; text-align: center; line-height: 30px">'+ data[i].pro_count + '</td>';
										str += '<td style="width: 16vw; text-align: center; line-height: 30px">'+ data[i].pro_note + '</td>';
										str += '<td style="width: 4.5vw; text-align: center; line-height: 30px">';
										str += '<button type="button" class="btn btn-info btn-block">수정</button></td>';
									str += '</tr>';
								}
								str += '</table>';
							$('#productListTable').append(str);
							
							// 완료 후 input 값 빈칸으로 만들기
							$('#pro_num').val('');
							$('#pro_name').val('');
							$('#pro_color').val('');
							$('#pro_count').val('');
							$('#pro_note').val('비고');
						},
						error : function(){
							//DB오류(PK중복)
							alert('중복된 제품은 등록하실수 없습니다.');
							return;
						}
					});
					// 제품 등록 ajax 종료
				});
				
			});
</script>

</head>
<body>
	<div id="wrap">
		<!-- 유저 네비게이션 -->
		<jsp:include page="userNav.jsp" />
		<%--
      <!-- nav bar -->
      <div id="nav">
        <!-- nav 상단부분 -->
        <div class="nav_top">
          <div class="profile"></div>
          <span>user</span>
        </div>

        <!-- nav 하단부분 -->
        <div class="nav_bottom">
          <ul class="nav_list">
            <li><a href="main ">ERP_Project</a></li>
            <li><a href="myPage ">마이페이지</a></li>
            <li style="background-color: #b9d7ea">
              <a href="product ">제품관리</a>
            </li>
            <li><a href="salesList ">영업관리</a></li>
            <li><a href="supplier ">공급처관리</a></li>
            <li><a href="clients ">고객관리</a></li>
            <li><a href="orders ">발주관리</a></li>
            <li><a href="">회계</a></li>
          </ul>
        </div>
      </div>

      <!-- 상단 bar -->
      <div id="topBar">
        <!-- 상단 제목 -->
        <h2>제품관리</h2>
      </div>
  
    <!-- nav 끝 -->
 --%>
		<!-- contents 부분 -->
		<div id="contents" style="float: right; width: 88vw; height: 88vh">
			<div>
				<!-- 검색 폼 -->
				<div style="width: 600px; display: block">
					<form style="margin: 5% 0 -5% 4%">
						<!-- 검색어 입력 -->
						<div class="row">
							<div class="form-group col-sm-4 col-md-4 col-lg-4">
								<input type="text" name="pro_name" class="form-control"
									placeholder="제품 검색" id="pro_name" />
							</div>

							<!-- 검색버튼 -->
							<div class="form-group col-sm-2 col-md-2 col-lg-2">
								<button type="button" class="btn btn-info btn-block"
									id="searchProductBtn"
									style="background-color: #b9d7ea; border: 1px solid #b9d7ea">
									검색</button>
							</div>

							<!-- 제품등록 -->
							<div class="form-group col-sm-2 col-md-2 col-lg-2">
								<button type="button" class="btn btn-info btn-block"
									style="background-color: #769fcd; border: 1px solid #769fcd"
									data-toggle="modal" data-target="#addProModal">
									등록</button>
							</div>

							

							<!-- 제품삭제 -->
							<div class="form-group col-sm-2 col-md-2 col-lg-2">
								<button type="button" class="btn btn-danger btn-block">
									삭제</button>
							</div>

							<!-- 제품수정 -->
							<div class="form-group col-sm-2 col-md-2 col-lg-2">
								<button type="button" class="btn btn-warning btn-block">
									수정</button>
							</div>
						</div>
					</form>
				</div>

<!-- 제품 등록 모달  -->
						
							<div id="addProModal" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										
										<div class="modal-header">
											<!-- &times; : 부트스트랩 x 아이콘 만들기 -->
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">제품 등록</h4>
										</div>
									
										<div class="modal-body">

											<!-- 공급처 ID -->
											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
													<label class="form-group">제품 번호</label> <input
														type="text" class="form-control" name="pro_num" id="pro_num">
												</div>
											</div>

											<!-- 공급처 주소 -->
											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
													<label class="form-group">제품명</label> <input type="text"
														class="form-control" name="pro_name" id="pro_name">
												</div>
											</div>

											<!-- 공급처 전화번호 -->
											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
													<label class="form-group">색상</label> <input
														type="text" class="form-control" name="pro_color" id="pro_color">
												</div>
											</div>

											<!-- 담당자(사원 번호)	 -->
											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
													<label class="form-group">재고수량</label> <input
														type="text" class="form-control" name="pro_count" id="pro_count">
												</div>
											</div>

											<!-- 공급처 메모
											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
												<label class="form-group">공급처 메모</label>
												<input type="text" class = "form-control" name = "" id ="">
												</div>
											</div>	 -->

											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
													<label class="form-group">제품 메모</label>
													<!-- textarea 는 .val() 이 아닌 .text()로 값을 받아와야 한다. -->
													<textarea class="form-control" name="pro_note" id="pro_note"
														style="width: 100%; height: 15vh; overflow: visible; resize: none" placeholder="비고"></textarea>
												</div>
											</div>

											<div class="row">
												<div class="form-group col-sm-12 col-md-12 col-lg-12">
													<button type="button" class="btn btn-info btn-block" id="addProAction"
														style="background-color: #B9D7EA; border: 1px solid #B9D7EA;">제품 등록</button>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<!-- 제품 등록 모달  종료 --> 





				<!-- 테이블 항목 -->
				<div class="table-responsive"
					style="width: 85vw; height: auto; display: block; background-color: #f7fbfc; margin: 2% 0 0 1.5vw; border-top: 3px ridge #f9f9f9; border-bottom: 3px ridge #f9f9f9; box-sizing: border-box;">
					<table
						style="width: 85vw; height: auto; margin: 0 0 0 0; text-align: center;"
						class="table borderless">
						<tr style="font-weight: 700">
							<td style="width: 4.5vw; text-align: center">선택</td>
							<td style="width: 16.5vw; text-align: center">제품번호</td>
							<td style="width: 16.5vw; text-align: center">제품명</td>
							<td style="width: 13.5vw; text-align: center">색상</td>
							<td style="width: 13.5vw; text-align: center">재고수량</td>
							<td style="width: 16vw; text-align: center">비고</td>
							<td style="width: 4.5vw; text-align: center">수정</td>
						</tr>
					</table>
				</div>
				<!-- 제품 목록 -->

				<div class="table-responsive"
					style="border-bottom: 3px ridge #f9f9f9; width: 85vw; height: 70vh; margin-left: 1.5vw; overflow: scroll-y;">
					
						<table style="width: 85vw; height: auto; text-align: center"
							class="table table-hover"  id="productListTable">
							<c:forEach var="product" items="${product_List }">
								<tr>
									<td style="width: 4.5vw; text-align: center; line-height: 30px">
										<label><input type="checkbox" name="table_product_id" value="${product.pro_num }" /></label>
									</td>
									<td
										style="width: 16.5vw; text-align: center; line-height: 30px">
										${product.pro_num }</td>
									<td
										style="width: 16.5vw; text-align: center; line-height: 30px">${product.pro_name }</td>
									<td
										style="width: 13.5vw; text-align: center; line-height: 30px">${product.pro_color }</td>
									<td
										style="width: 13.5vw; text-align: center; line-height: 30px">${product.pro_count }</td>
									<td style="width: 16vw; text-align: center; line-height: 30px">${product.pro_note }</td>
									<td style="width: 4.5vw; text-align: center; line-height: 30px">
										<button type="button" class="btn btn-info btn-block">
											수정</button>
									</td>
								</tr>
							</c:forEach>

						</table>
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>
