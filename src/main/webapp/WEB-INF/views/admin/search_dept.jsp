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

<!-- search_dept - JS파일 -->
<%-- <script src="${path}/resources/js/search_dept.js"></script> --%>
<script>
/**
 *  사원 관리 페이지 JS
 */


$(document).ready(function() {	
		
		// 페이지가 준비되면 수정 제목, 수정 버튼을 숨겨라(기본창 : 등록)	
		$('#dept_update').hide();
		$('#updateBtn').hide();
		
		
		// ajax 로 리스트 받아오기
		$('#searchNameBtn').click(function() {
				var user_name = $('#dept_name').val();
				$.ajax({ // ajax 는 데이터를 받아오는거 url받아오는거 아님 
							type : 'GET',
							url : './searchName',
							data : {
								// 문자열 : 변수값...
								user_name : user_name
							},
							dataType : 'JSON',
							success : function(data) {
								//아이디에 해당하는 태그 자손들이 모두 삭제 
								$('#deptListTable')
										.empty();
								var str = '';
								str += '<table style="width: 100%; height: auto; text-align: center" class="table table-hover">';
								for (var i = 0; i < data.length; i++) {
	
									str += '<tr>';
									str += '<td style="width: 10%; text-align: center">'
											+ data[i].user_num
											+ '</td>';
									str += '<td style="width: 10%; text-align: center">********</td>';
									str += '<td style="width: 10%; text-align: center">'
											+ data[i].user_name
											+ '</td>';
	
									str += '</tr>';
	
								}
								str += '</table>';
								$('#usersListTable')
										.append(str);
							}
	
						});
	
			});
		
		
		// 부서 등록 하기 ajax
		$('#addBtn').click(function(){
			var dept_num = $('#dept_num').val();
			var dept_name = $('#dept_name').val();
			var dept_tel = $('#dept_tel').val();
			
			if(dept_num == "" ) { 
				alert('부서 번호는 필수 입니다!');
				$('#dept_num').focus(); 
				return;
			}
			else if(dept_name == "" ) {
				alert('부서명은 필수 입니다!');
				$('#dept_name').focus(); 
				return;
			}
			else {
			$.ajax({
				type : 'POST',
				url : './addDeptAction',
				data : {
					dept_num : dept_num,
					dept_name : dept_name,
					dept_tel : dept_tel
				},
				dataType : "JSON",
				success : function(data) {
					$('#deptListTable').empty();
					var str = '';
					str += '<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;"class="table table-hover">';
					for(var i = 0; i < data.length; i++) {
						str += '<tr>';
							str += '<td style="width: 20%; text-align: center">';
							str += '<input type ="radio" name = "table_dept_num" value = "' + data[i].dept_num + '" /></td>';
							str += '<td style="width: 30%; text-align: center">' + data[i].dept_name +'</td>';
							str += '<td style="width: 20%; text-align: center">' + data[i].dept_num +'</td>';
							str += '<td style="width: 30%; text-align: center">' + data[i].dept_tel +'</td>';
						str += '</tr>';
					}
					str += '</table>';
 					$('#deptListTable').append(str); 
					
 					// 수정이 완료되면
 					$('#dept_num').val('');
					$('#dept_name').val('');
					$('#dept_tel').val('');
					alert('부서 등록이 완료되었습니다!');
					
					
				},
				error : function() {
					alert('부서등록 실패');
				}
				
				
			});
			}
		});
		
		
		// radio 버튼으로 선택해서 수정을 눌렀을 때(왼쪽 리스트) ajax
		$('#table_update_btn').click(function(){
			
			var dept_num = $('input[name="table_dept_num"]:checked').val();
			
			$.ajax({
				type : 'POST',
				url : './getDepartment',
				data : {
					dept_num : dept_num
				},
				dataType : "JSON",
				success : function(data) {
					$('#dept_num').val(data.dept_num);
					$('#dept_name').val(data.dept_name);
					$('#dept_tel').val(data.dept_tel);
					$('#updateBtn').show();
					$('#dept_update').show();
					$('#addBtn').hide();
					$('#dept_add').hide();
					$('#dept_num').attr('readonly', true);
				}
				
			});
			
			
			
		});
		
		
		// 수정 버튼을 눌렀을 때 ajax(오른쪽 수정 칸)
		$('#updateBtn').click(function(){
			
			var dept_num = $('#dept_num').val();
			var dept_name = $('#dept_name').val();
			var dept_tel = $('#dept_tel').val();
			
			$.ajax({
				type : 'POST',
				url : './updateDeptAction',
				data : {
					dept_num : dept_num,
					dept_name : dept_name,
					dept_tel : dept_tel
				},
				dataType : "JSON",
				success : function(data) {
					$('#deptListTable').empty();
					// 수정이 완료 되면 리스트를 전체 삭제 후 다시 불러와서 재 정렬한다.	
					var str = '';
					str += '<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;"class="table table-hover">';
					for(var i = 0; i < data.length; i++) {
						str += '<tr>';
							str += '<td style="width: 20%; text-align: center">';
							str += '<input type ="radio" name = "table_dept_num" value = "' + data[i].dept_num + '" /></td>';
							str += '<td style="width: 30%; text-align: center">' + data[i].dept_name +'</td>';
							str += '<td style="width: 20%; text-align: center">' + data[i].dept_num +'</td>';
							str += '<td style="width: 30%; text-align: center">' + data[i].dept_tel +'</td>';
						str += '</tr>';
					}
					str += '</table>';
 					$('#deptListTable').append(str); 
					
 					// 수정이 완료되면
 					$('#dept_num').val('');
					$('#dept_name').val('');
					$('#dept_tel').val('');
					$('#updateBtn').hide();
					$('#dept_update').hide();
					$('#addBtn').show();
					$('#dept_add').show();
					$('#dept_num').removeAttr('readonly');
					// 빈문자열을 넣어줘야빈값을 넣어준다는 뜻이고 아무 것도 없이 	val() 면 거기 있는 값을 가져오는 것이다.	
				}
			});
			
		});
		
		
		// 삭제 버튼을 눌렀을 때 ajax
		$('#delete_btn').click(function(){
			
			var dept_num = $('input[name="table_dept_num"]:checked').val(); // radio 버튼을 눌렀을때 체크에 해당하는 name값을 가져온다.	
			var dept_tel = $('#dept_tel').val();
			var dept_id = '#' + dept_num;
			var dept_name = $(dept_id).val();
			
			var delete_check = confirm(dept_name +'를 삭제 하시겠습니까?');
	
			if(delete_check == false) {
				return;
			}
			else {
					$.ajax({
						type : 'POST',
						url : './deleteDeptAction',
						data : {
							dept_num : dept_num,
							dept_name : dept_name,
							dept_tel : dept_tel
						},
						dataType : "JSON",
						success : function(data) {
							$('#deptListTable').empty();
							var str = '';
							str += '<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;"class="table table-hover">';
							for(var i = 0; i < data.length; i++) {
								str += '<tr>';
									str += '<td style="width: 20%; text-align: center">';
									str += '<input type ="radio" name = "table_dept_num" value = "' + data[i].dept_num + '" /></td>';
									str += '<td style="width: 30%; text-align: center">' + data[i].dept_name +'</td>';
									str += '<td style="width: 20%; text-align: center">' + data[i].dept_num +'</td>';
									str += '<td style="width: 30%; text-align: center">' + data[i].dept_tel +'</td>';
								str += '</tr>';
							}
							str += '</table>';
		 					$('#deptListTable').append(str); 
							
						}
					});
				}
			});
		
		
		// 검색을 했을 때 ajax
		$('#searchDeptBtn').click(function(){
			
			var dept_name = $('#search_dept_name').val();
	
					$.ajax({
						type : 'POST',
						url : './searchDeptAction',
						data : {
							dept_name : dept_name
						},
						dataType : "JSON",
						success : function(data) {
							$('#deptListTable').empty();
							var str = '';
							str += '<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;"class="table table-hover">';
							for(var i = 0; i < data.length; i++) {
								str += '<tr>';
									str += '<td style="width: 20%; text-align: center">';
									str += '<input type ="radio" name = "table_dept_num" value = "' + data[i].dept_num + '" /></td>';
									str += '<td style="width: 30%; text-align: center">' + data[i].dept_name +'</td>';
									str += '<td style="width: 20%; text-align: center">' + data[i].dept_num +'</td>';
									str += '<td style="width: 30%; text-align: center">' + data[i].dept_tel +'</td>';
								str += '</tr>';
							}
							str += '</table>';
		 					$('#deptListTable').append(str); 
							
						}
					});
				
			});
});

</script>
</head>

<body>
	<div id="wrap">
		<!-- nav 시작 -->

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
					<li style="background-color: #b9d7ea; font-weight: bold; color: #fff; font-size: 20px">부서관리</li>
					<li><a href="correct_auth">부서권한관리</a></li>
				</ul>
			</div>
			
		</div>

		<!-- 상단 bar -->
		<div id="topBar">
			<!-- 상단 제목 -->
			<h2>부서등록</h2>
		</div>
		
	</div>
	<!-- nav 끝 -->

	<!-- contents 부분 -->
	<div id="contents" style="float: right; width: 88%; height: 100%;">

		<div class="container" style="margin-top: 5%;">
			<!--  전체 기준 그리드 -->
			

			<!-- 두 번째 row칸 시작 -->
			<div class="row">
			<!-- 테이블 항목(왼쪽) -->
				<div class="form-group col-sm-6 col-md-6 col-lg-6" class="table-responsive"	style="width: 570px; height: 700px; margin-left: 1%;">
					
					<div class="jumbotron" style="background-color: #f7fbfc; border: 2px solid #b9d7ea;">
					
					
					
					
					

				<!-- 검색 폼, 테이블 -->
				
					
						<!-- 검색어 입력 -->
						<div class="row">
							<div class="form-group col-sm-6 col-md-6 col-lg-6">
								<input type="text" name="search_dept_name" class="form-control"
									placeholder="부서명 검색" id="search_dept_name" />
							</div>

							<!-- 검색 버튼(이름 기준)	 -->
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<button type="button" class="btn btn-info btn-block"
									style="background-color: #b9d7ea; border: 1px solid #b9d7ea"
									id="searchDeptBtn">검색</button>
							</div>
							<button type ="button" id = "delete_btn" class = "btn btn-warning">삭제</button>
											<button type ="button" id = "table_update_btn" class = "btn btn-info">수정</button>

							<!-- 권한 관리 -->
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
							</div>
						
						
					
					
				</div>
			
			
			
			
			
						<!-- 부서목록 제목 -->
						<h4 style="text-align: center; font-size: 20px; margin-bottom: 10%">부서 목록</h4>
						
						<!-- 테이블 항목 표시 -->
						<div>
							<table style="width: 100%; height: auto; text-align: center;" class="table borderless">
								<tr>
									<td style="width: 20%; text-align: center">선택</td>
									<td style="width: 30%; text-align: center">부서명</td>
									<td style="width: 20%; text-align: center">부서코드</td>
									<td style="width: 30%; text-align: center">부서전화번호</td>
								</tr>
							</table>
						</div>

						<!-- 부서 목록 -->
						<div class="table-responsive" style="width: 100%; height: 380px;">
							<div id="deptListTable">
								<table style="width: 100%; height: auto; text-align: center; overflow: scroll-y;"
									class="table table-hover">
									<c:forEach var="dept" items="${dept_list}">
															 <!--  controller에서 받아옴 -->
										<tr>
											<td style="width: 20%; text-align: center">
												<input type ="radio" name = "table_dept_num" value = "${dept.dept_num}" />
												<input type = "hidden" id = "${dept.dept_num}" value="${dept.dept_name }"/>
											</td>
											<td style="width: 30%; text-align: center">${dept.dept_name }</td>
											<td style="width: 20%; text-align: center">${dept.dept_num }</td>
											<td style="width: 30%; text-align: center">${dept.dept_tel }</td>
										</tr>
										
									</c:forEach>
								</table>
									
							</div>
						</div>
								<!-- 삭제, 수정 버튼 -->
								<div style = "width: 100%; height: 30px;">
											
								</div>
								
					</div>
				</div>


				<!-- 등록, 수정 하는 화면(오른쪽) -->
				<div class="form-group col-sm-6 col-md-6 col-lg-6" style="height: 700px">
			
					<div class="jumbotron" style="width: 100%; height: 647px; background-color: #f7fbfc; border: 2px solid #b9d7ea">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<div style = "width: 100%; height: 49px"></div>
					</div>
						<h4 style="text-align: center; font-size: 20px" id = "dept_add">부서 등록</h4>
						<h4 style="text-align: center; font-size: 20px" id = "dept_update">부서 수정</h4>
						
						<div class="row">

							<div class="row" style="margin-top: 7%">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<p style="font-size: 16px">부서명</p>
									<input type="text" class="form-control" name = "dept_name" id = "dept_name" >
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<p style="font-size: 16px">부서번호</p>
									<input type="text" class="form-control" name = "dept_num" id = "dept_num">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<p style="font-size: 16px">부서 전화번호</p>
									<input type="text" class="form-control" name = "dept_tel" id = "dept_tel" >
								</div>
							</div>

							<div class="row" style="margin-top: 35%">
								<div class="form-group col-sm-12 col-md-12 col-lg-12">
									<button type="button" class="btn btn-success form-control" id = "updateBtn">수정</button>
									<button type="button" class="btn btn-info form-control" id = "addBtn">등록</button>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
			</div>
			<!-- 두 번째 row칸  끝 -->
		</div>
	</div>

</body>
</html>
