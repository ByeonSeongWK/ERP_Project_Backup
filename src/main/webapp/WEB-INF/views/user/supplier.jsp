<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP Project</title>
	<style>
	.table-responsive{
		-ms-overflow-style: none; scrollbar-width: none;
	}
	.table-responsive::-webkit-scrollbar {
		display: none;
	}
	</style>
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
<script>
$(document).ready(function(){
	
	// 공급처 이름으로 공급처 검색 ajax	
	$('#searchSuppBtn').click(function(){
		var supp_name	= $('#searchSuppName').val();
		
			$.ajax({
				type: 'POST',
				url: './searchSupplier',
				data: {
				 	supp_name	: supp_name
				},
				dataType: 'JSON',
				success : function(data) {
					$('#suppTableList').empty();
					var str = '';
						str +='<table  style="width: 85vw; height: auto; text-align: center" class="table table-hover" id="suppTableList" >';
			          			for(var i = 0; i < data.length; i++) {
			          				str += '<tr>';
				          				str += '<td style="width: 2vw; text-align: center; line-height: 30px">';
				          				str += '<label><input type="checkbox" value="'+data[i].supp_id+'"/></label></td>';
				          				str += '<td style="width: 6.5vw; text-align: center; line-height: 30px">'+data[i].supp_id+'</td>';
				          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].supp_name+'</td>';
				          				str += '<td style="width: 15vw; text-align: center; line-height: 30px">'+data[i].supp_addr+'</td>';
				          				str += '<td style="width: 9vw; text-align: center; line-height: 30px">'+data[i].supp_tel+'</td>';
				          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].user_num+'</td>';
				          				str += '<td style="width: 9vw; text-align: center; line-height: 30px">'+data[i].user_tel+'</td>';
				          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].supp_type+'</td>';
				          				str += '<td style="width: 15vw; text-align: center; line-height: 30px">'+data[i].supp_note+'</td>';
				          				str += '<td style="width: 4.5vw; text-align: center; line-height: 30px">';
				          				str += '<button type="button" class="btn btn-info btn-block" id = "updateSuppBtn"' 
				          				str += 'onclick="getSuppID('+data[i].supp_id+')" data-toggle="modal" data-target="#updateSuppModal"> 수정</button>'
			          				str += '</tr>';
									}
		      				str += '</table>';
						$('#suppTableList').append(str); 
						
				}
			}
			
		});
		
	});
	// 공급처 검색 ajax 종료
	
	
	
	//공급처 등록 ajax
	$('#addSuppAction').click(function(){
		var supp_id		= $('#supp_id').val();
		var supp_name	= $('#supp_name').val();
	 	var supp_addr	= $('#supp_addr').val();
		var supp_tel		= $('#supp_tel').val();
		var user_num		= $('#user_num').val();
		var user_tel		= $('#user_tel').val();
		var supp_type	= $('#supp_type').val();
		var supp_note	= $('#supp_note').val();
		
		$.ajax({
			
			type: 'POST',
			url: './addSupplierAction',
			data: {
			 	supp_id		: supp_id,
			 	supp_name	: supp_name,
				supp_addr	: supp_addr,
				supp_tel		: supp_tel,
				user_num	: user_num,
				user_tel		: user_tel,
				supp_type	: supp_type,
				supp_note	: supp_note
			},
			dataType: 'JSON',
			
			success : function(data) {
				$('#addSuppModal').modal('hide');
				alert('공급처 추가 완료');
				$('#suppTableList').empty();
				var str = '';
					str +='<table  style="width: 85vw; height: auto; text-align: center" class="table table-hover" id="suppTableList" >';
		          			for(var i = 0; i < data.length; i++) {
		          				str += '<tr>';
			          				str += '<td style="width: 2vw; text-align: center; line-height: 30px">';
			          				str += '<label><input type="checkbox" value="'+data[i].supp_id+'"/></label></td>';
			          				str += '<td style="width: 6.5vw; text-align: center; line-height: 30px">'+data[i].supp_id+'</td>';
			          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].supp_name+'</td>';
			          				str += '<td style="width: 15vw; text-align: center; line-height: 30px">'+data[i].supp_addr+'</td>';
			          				str += '<td style="width: 9vw; text-align: center; line-height: 30px">'+data[i].supp_tel+'</td>';
			          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].user_num+'</td>';
			          				str += '<td style="width: 9vw; text-align: center; line-height: 30px">'+data[i].user_tel+'</td>';
			          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].supp_type+'</td>';
			          				str += '<td style="width: 15vw; text-align: center; line-height: 30px">'+data[i].supp_note+'</td>';
			          				str += '<td style="width: 4.5vw; text-align: center; line-height: 30px">';
			          				str += '<button type="button" class="btn btn-info btn-block" id ="updateSuppAction"'
			          				str += '<button type="button" class="btn btn-info btn-block" id = "updateSuppBtn"' 
		          					str += '<button type="button" class="btn btn-info btn-block" id = "updateSuppBtn"' 
			          				str += 'onclick="getSuppID('+data[i].supp_id+')" data-toggle="modal" data-target="#updateSuppModal"> 수정</button>'
		          				str += '</tr>';
								}
	      				str += '</table>';
					$('#suppTableList').append(str); 
					
					// 완료 후 input 값 빈칸으로 만들기
					$('#supp_id').val('');
					$('#supp_name').val('');
				 	$('#supp_addr').val('');
					$('#supp_tel').val('');
					$('#user_num').val('');
					$('#user_tel').val('');
					$('#supp_type').val('');
					$('#supp_note').val('비고');
			},
			error : function(){
				alert('중복된 공급처 ID는 등록할 수 없습니다!');
				location.reload();

			}
			
		});
		// 공급처 등록 ajax 종료
	});
	
	
	// 삭제 버튼 눌렀을 때 ajax(checkbox 선택)
	$('#deleteSuppBtn').click(function(){
		
		var check = confirm('정말 삭제하시겠습니까?');
		
		if(check != true) {
			
			return;
		}
		else {
			// 체크한 목록들을 배열로 만들어서 배열로 받아옴
			var supp_id = [] ; 
			
			$('input[name="table_supp_id"]:checked').each(function(){
				supp_id.push($(this).val());
				
			});
			
			// 삭제 ajax 시작
			$.ajax({
				url: './deleteSupplier',
				type: 'POST',
				data: {
					supp_id : supp_id
				},
				
				dataType: "JSON",
				success : function(data){
					
					alert('선택한 공급처 삭제 완료');
					$('#suppTableList').empty();
					var str = '';
						str +='<table  style="width: 85vw; height: auto; text-align: center" class="table table-hover" id="suppTableList" >';
			          			for(var i = 0; i < data.length; i++) {
			          				str += '<tr>';
				          				str += '<td style="width: 2vw; text-align: center; line-height: 30px">';
				          				str += '<label><input type="checkbox" value="'+data[i].supp_id+'"/></label></td>';
				          				str += '<td style="width: 6.5vw; text-align: center; line-height: 30px">'+data[i].supp_id+'</td>';
				          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].supp_name+'</td>';
				          				str += '<td style="width: 15vw; text-align: center; line-height: 30px">'+data[i].supp_addr+'</td>';
				          				str += '<td style="width: 9vw; text-align: center; line-height: 30px">'+data[i].supp_tel+'</td>';
				          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].user_num+'</td>';
				          				str += '<td style="width: 9vw; text-align: center; line-height: 30px">'+data[i].user_tel+'</td>';
				          				str += '<td style="width: 8vw; text-align: center; line-height: 30px">'+data[i].supp_type+'</td>';
				          				str += '<td style="width: 15vw; text-align: center; line-height: 30px">'+data[i].supp_note+'</td>';
				          				str += '<td style="width: 4.5vw; text-align: center; line-height: 30px">';
				          				str += '<button type="button" class="btn btn-info btn-block" id ="updateSuppAction"'
				          				str += '<button type="button" class="btn btn-info btn-block" id = "updateSuppBtn"' 
			          					str += '<button type="button" class="btn btn-info btn-block" id = "updateSuppBtn"' 
				          				str += 'onclick="getSuppID('+data[i].supp_id+')" data-toggle="modal" data-target="#updateSuppModal"> 수정</button>'
			          				str += '</tr>';
									}
		      				str += '</table>';
						$('#suppTableList').append(str); 
					
				},
				error: function(){
					location.reload();
				}
			
			});
			
		}// else
		
	});

});

// 수정버튼 눌렀을때 그 줄에 해당하는 supp_id 값 가져오기
function getSuppID(supp_id) {
	
	var supp_id = supp_id;
	
	$.ajax({
		type: 'POST',
		url: './getSearchSupplier',
		data: {
			supp_id: supp_id
		} ,
		dataType: "JSON",
		// function(data)의 data는 컨트롤러에서 받아온 값이다!!!
		success: function(data){
			alert('통신 성공!');
			console.log(data);
			alert(data.supp_id);
			$('#supp_id_up').val(data.supp_id);
			$('#supp_name_up').val(data.supp_name);
			$('#supp_addr_up').val(data.supp_addr);
			$('#supp_tel_up').val(data.supp_tel);
			$('#user_num_up').val(data.user_num);
			$('#user_tel_up').val(data.user_tel);
			$('#supp_type_up').val(data.supp_type);
			$('#supp_note_up').val(data.supp_note);
		},
		error: function(){
			alert('수정 실패! 다시 시도 해주세요!');
			location.reload();
		}
		
			
	});
	
}



	// 수정 ajax 
	function updateSupplier() {
		
	var supp_id 		= $('#supp_id_up').val();
	var supp_name 	= $('#supp_name_up').val();
	var supp_addr 	= $('#supp_addr_up').val();
	var supp_tel 		= $('#supp_tel_up').val();
	var user_num 	= $('#user_num_up').val();
	var user_tel 		= $('#user_tel_up').val();
	var supp_type 	= $('#supp_type_up').val();
	var supp_note 	= $('#supp_note_up').val();

	$.ajax({
		url: './updateSupplier',
		type: 'POST',
		data: {
			supp_name	: supp_name,
			supp_addr 	: supp_addr,
			supp_tel 		: supp_tel,
			user_num 	: user_num,
			user_tel 		: user_tel,
			supp_type	: supp_type,
			supp_note 	: supp_note,
			supp_id		: supp_id
		},
		success : function(){
	         $('#updateSuppModal').modal('hide');
	         alert(supp_name + ' 공급처 수정 완료');
	    },
		error : function() {
			alert('수정 실패');
		}
		
	});
}	

</script>

</head>

  <body>
    <div id="wrap">
      <!-- nav 시작 -->
      <jsp:include page = "userNav.jsp"/>

    <!-- contents 부분 -->
    <div id="contents" style="float: right; width: 88%; height: 88vh">
      <div>
        <!-- 검색 폼 -->
        <div style="width: 500px">
          <form style="margin: 5% 0 0 4%">
            <!-- 검색어 입력 -->
            <div class="row">
              <div class="form-group col-sm-6 col-md-6 col-lg-6">
                <input
                  type="text"
                  name="dept_name"
                  class="form-control"
                  placeholder="공급처 검색"
                  id="searchSuppName"
                />
              </div>

              <!-- 검색버튼 -->
              <div class="form-group col-sm-2 col-md-2 col-lg-2">
                <button
                  type="button"
                  class="btn btn-info btn-block"
                  style="background-color: #b9d7ea; border: 1px solid #b9d7ea"
                  id="searchSuppBtn"
                >
                  검색
                </button>
              </div>

              <!-- 공급처 등록 -->
              <div class="form-group col-sm-2 col-md-2 col-lg-2">
                <button
                  type="button"
                  class="btn btn-info btn-block"
                  style="background-color: #769fcd; border: 1px solid #769fcd"
                  data-toggle="modal" data-target="#addSuppModal"
                >
                  등록
                </button>
              </div>

              <!-- 공급처 삭제 -->
              <div class="form-group col-sm-2 col-md-2 col-lg-2">
                <button type="button" class="btn btn-danger btn-block" id="deleteSuppBtn">
                  삭제
                </button>
              </div>
            </div>
          </form>
        </div>
        <!-- 테이블 항목 -->
        <div
          class="table-responsive"
          style="
            width: 85vw;
            height: auto;
            background-color: #f7fbfc;
            margin-left: 1.5vw;
            border-top: 3px ridge #f9f9f9;
            border-bottom: 3px ridge #f9f9f9;
            box-sizing: border-box;
          "
        >
          <table
            style="
              width: 85vw;
              height: auto;
              margin: 0 0 0 0;
              text-align: center;
            "
            class="table borderless"
          >
            <tr style="font-weight: 700">
              <td style="width: 8.5vw; text-align: center" colspan="2">공급처ID</td>
              <td style="width: 8vw; text-align: center">공급처 이름</td>
              <td style="width: 15vw; text-align: center">공급처 주소</td>
              <td style="width: 9vw; text-align: center">공급처 전화번호</td>
              <td style="width: 8vw; text-align: center">담당자</td>
              <td style="width: 9vw; text-align: center">담당자 전화번호</td>
              <td style="width: 8vw; text-align: center">업종</td>
              <td style="width: 15vw; text-align: center">메모</td>
              <td style="width: 4.5vw; text-align: center">수정</td>
            </tr>
          </table>
        </div>

        <!-- 목록 -->
        <div
          class="table-responsive"
          style="
            border-bottom: 3px ridge #f9f9f9;
            width: 85vw;
            height: 70vh;
            margin-left: 1.5vw;
            overflow: scroll-y;
          "
        >
	          <table
	            style="width: 85vw; height: auto; text-align: center"
	            class="table table-hover" id="suppTableList" >	
	          	<!-- 공급처 리스트 불러오기 -->
	           	<c:forEach var="supp" items="${supp_list}">
					<tr>
			              <td style="width: 2vw; text-align: center; line-height: 30px">
			                <label><input type="checkbox" name="table_supp_id" value="${supp.supp_id}" /></label>
			              </td>
			              <td style="width: 6.5vw; text-align: center; line-height: 30px">
			                ${supp.supp_id}
			              </td>
			              <td style="width: 8vw; text-align: center; line-height: 30px">
			                ${supp.supp_name}
			              </td>
			              <td style="width: 15vw; text-align: center; line-height: 30px">
			                ${supp.supp_addr}
			              </td>
			              <td style="width: 9vw; text-align: center; line-height: 30px">
			                ${supp.supp_tel}
			              </td>
			              <td style="width: 8vw; text-align: center; line-height: 30px">
			                ${supp.user_num}
			              </td>
			              <td style="width: 9vw; text-align: center; line-height: 30px">
			                ${supp.user_tel}
			              </td>
			              <td style="width: 8vw; text-align: center; line-height: 30px">
			                ${supp.supp_type}
			              </td>
			              <td style="width: 15vw; text-align: center; line-height: 30px">
			                ${supp.supp_note}
			              </td>
			              <td style="width: 4.5vw; text-align: center; line-height: 30px">
			                <button type="button" class="btn btn-info btn-block" id = "updateSuppBtn" 
			                onclick="getSuppID('${supp.supp_id}')" data-toggle="modal" data-target="#updateSuppModal"> 수정</button>
			              </td>
			          	</tr>
					</c:forEach>
          	</table>
        </div>
      </div>
    </div>
    <!-- 테이블 끝 -->
  </div>
  
<!-- 공급처 등록 모달  -->
<div id="addSuppModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<!-- &times; : 부트스트랩 x 아이콘 만들기 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="text-align: center; font-size: 1.3em">공급처 등록</h4>
			</div>
			
			<div class="modal-body">
			
				<!-- 공급처 ID -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 ID	</label>
						<input type="text" class = "form-control" name = "supp_id" id ="supp_id">
					</div>
				</div>	
			
				<!-- 공급처 이름 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 이름</label>
						<input type="text" class = "form-control" name = "supp_name" id ="supp_name">
					</div>
				</div>	
				
				<!-- 공급처 주소 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 주소</label>
						<input type="text" class = "form-control" name = "supp_addr" id ="supp_addr">
					</div>
				</div>	
				
				<!-- 공급처 전화번호 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 전화번호</label>
						<input type="text" class = "form-control" name = "supp_tel" id ="supp_tel">
					</div>
				</div>	
				
				<!-- 담당자(사원 번호)	 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">담당자(사원 번호)</label>
						<input type="text" class = "form-control" name = "user_num" id ="user_num">
					</div>
				</div>	
				
				<!-- 담당자 전화번호 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">담당자 전화번호</label>
						<input type="text" class = "form-control" name = "user_tel" id ="user_tel">
					</div>
				</div>	
				
				<!-- 공급처 업종 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">업종</label>
						<input type="text" class = "form-control" name = "supp_type" id ="supp_type">
					</div>
				</div>	

				<!-- 공급처 메모 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 메모</label>
						<!-- textarea 는 .val() 이 아닌 .text()로 값을 받아와야 한다. -->
						<textarea class="form-control" name="supp_note" id="supp_note"style="width:100%; height: 15vh; overflow: visible; resize: none">비고</textarea>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<button type="button" class="btn btn-info btn-block" id ="addSuppAction"
							style="background-color: #B9D7EA; border: 1px solid #B9D7EA;"> 공급처 등록</button>
					</div>
				</div>
				
			</div>
			
			
		</div>
	</div>
</div>
<!-- 공급처 등록 모달  종료 -->
  
  
  
<!-- 공급처 수정 모달  -->
<div id="updateSuppModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<div class="modal-header">
				<!-- &times; : 부트스트랩 x 아이콘 만들기 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="text-align: center; font-size: 1.3em">공급처 수정</h4>
			</div>
			
			<div class="modal-body">
			
				<!-- 공급처 ID -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 ID	</label>
						<input type="text" class = "form-control" name = "supp_id_up" id ="supp_id_up" readonly>
					</div>
				</div>	
			
				<!-- 공급처 이름 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 이름</label>
						<input type="text" class = "form-control" name = "supp_name_up" id ="supp_name_up">
					</div>
				</div>	
				
				<!-- 공급처 주소 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 주소</label>
						<input type="text" class = "form-control" name = "supp_addr_up" id ="supp_addr_up">
					</div>
				</div>	
				
				<!-- 공급처 전화번호 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 전화번호</label>
						<input type="text" class = "form-control" name = "supp_tel_up" id ="supp_tel_up">
					</div>
				</div>	
				
				<!-- 담당자(사원 번호)	 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">담당자(사원 번호)</label>
						<input type="text" class = "form-control" name = "user_num_up" id ="user_num_up">
					</div>
				</div>	
				
				<!-- 담당자 전화번호 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">담당자 전화번호</label>
						<input type="text" class = "form-control" name = "user_tel_up" id ="user_tel_up">
					</div>
				</div>	
				
				<!-- 공급처 업종 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">업종</label>
						<input type="text" class = "form-control" name = "supp_type_up" id ="supp_type_up">
					</div>
				</div>	

				<!-- 공급처 메모 -->
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<label class="form-group">공급처 메모</label>
						<!-- textarea 는 .val() 이 아닌 .text()로 값을 받아와야 한다. -->
						<textarea class="form-control" name="supp_note_up" id="supp_note_up" style="width:100%; height: 15vh; overflow: visible; resize: none">비고</textarea>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-sm-12 col-md-12 col-lg-12">
						<button type="button" class="btn btn-info btn-block" id ="updateSuppAction"
							style="background-color: #B9D7EA; border: 1px solid #B9D7EA;"  onclick="updateSupplier()"> 공급처 수정</button>
					</div>
				</div>
				
			</div>
			
			
		</div>
	</div>
</div>
<!-- 공급처 수정 모달  종료 -->

</body>
</html>
