<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h2>회원정보</h2>
				<br /> <br /> <br />
				<div>
					<!--  검색 영역 -->
						<form action="../admin/userList" method="get" style="float: right;">
							<fieldset> 
								<div class="input-group">
									<select name="searchType" id="searchType" size="1">
										<option value="MEMNUM"<c:if test="${searchType == 'MEMNUM'}">selected</c:if>>회원번호</option>
										<option value="ID"<c:if test="${searchType == 'ID'}">selected</c:if>>아이디</option>
										<option value="NAME"<c:if test="${searchType == 'NAME'}">selected</c:if>>이름</option>
										<option value="EMAIL"<c:if test="${searchType == 'EMAIL'}">selected</c:if>>이메일</option>
									</select>
									<input class="form-control" type="text" name="keyword" id="keyword" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d"><i class="fas fa-search"></i>
				                    	<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
								</div>
							</fieldset>
						</form>
					<br/> <br/> <hr />
					<!-- 리스트 -->
					<div id="reviewTable" align="center" class="container"
						align="center">
						<table class="table table-hover"
							style="width: 90%; text-align: center;">
							<colgroup>
								<col style="min-width: 75px;" width="15%">
								<col style="min-width: 50px;" width="10%">
								<col style="min-width: 50px;" width="10%">
								<col style="min-width: 100px;" width="20%">
								<col style="min-width: 75px;" width="10%">
								<col style="min-width: 100px;" width="20%">
								<col style="min-width: 75px;" width="15%">
							</colgroup>
							<thead>
								<tr
									style="width: 100%; height: 34px; background-color: #212629; color: white;">
									<th>회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>회원등급</th>
									<th>가입일</th>
									<th>탈퇴여부</th>
								</tr>
							</thead>
						</table>
						<table class="table table-hover"
							style="width: 90%; text-align: center;">
							<tbody id="userTbody">
							</tbody>
						</table>
					</div>
				</div>
				<hr />
					

				<!-- 페이징 -->
				<div class="page_wrap">
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> 
				</div> </div>
				<br /> <br />
			<br /> <br /> <br /> <br /> <br />
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript"> 
		$(document).ready(function(){ 
			fn_selectUserList(1);
			
			$("[id^=userInfo]").on("click", function(e){ 
				e.preventDefault(); 
				fn_openUserDetail($(this)); 
			});
			
		}); 
		
		function fn_openUserDetail(obj){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/admin/userDetail' />");
			comSubmit.addParam("NUM", obj.children().find("[id^=NUM]").val());
			comSubmit.submit(); 
		} 

		function fn_selectUserList(pageNo){ 
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/admin/selectUserList' />"); 
			comAjax.setCallback("fn_selectUserListCallback"); 
			comAjax.addParam("keyword", $('#keyword').val()); 
			comAjax.addParam("searchType", $('#searchType').val()); 
			comAjax.addParam("PAGE_INDEX",pageNo); 
			comAjax.addParam("PAGE_ROW", 15); 
			comAjax.ajax(); 
			} 
		
		function fn_selectUserListCallback(data){ 
			var total = data.TOTAL; 
			var body = $("#userTbody"); 
			body.empty(); 
			if(total == 0){ 
				var str = "<tr>" + "<td colspan='7'>조회된 결과가 없습니다.</td>" + "</tr>"; 
				body.append(str); 
				} else{ 
					var params = { 
						divId : "PAGE_NAVI", 
						pageIndex : "PAGE_INDEX", 
						totalCount : total, 
						eventName : "fn_selectList" }; 
				gfn_renderPaging(params); 
				var str = ""; 
				$.each(data.list, function(key, value){ 
					str +=
					"<tr id='userInfo" + value.MEMBER_NUM + "' onclick=\"location.href = '#this'\">" + 
						"<td>" + value.MEMBER_NUM + 
							"<input type='hidden' id='NUM" + value.MEMBER_NUM + "' value='"+ value.MEMBER_NUM + "'>" + 
						"</td>" + 
						"<td>" + value.MEMBER_ID + "</td>" + 
						"<td>" + value.MEMBER_NAME + "</td>" + 
						"<td>" + value.MEMBER_EMAIL + "</td>" + 
						"<td>";
						if(value.MEMBER_RANK == 0) {
							str += "관리자";
						}else if(value.MEMBER_RANK == 1){
							str += "일반회원";
						}
					str += 
						"</td>" + 
						"<td>" + value.MEMBER_DATE + "</td>" + 
						"<td>";
						if(value.MEMBER_DEL == 0) {
							str += "가입중";
						}else if(value.MEMBER_DEL == 1){
							str += "탈퇴함";
						}
					str +=
						"</td>" + 
					"</tr>";
				});
				body.append(str);
				
				/*$("[id^=userInfo]").on("click", function(e){ 
					e.preventDefault(); 
					fn_openUserDetail($(this)); 
				});*/ 
				
				$('table tbody tr').on('click', function() {
				    location.href = $(this).children('.title').children('a').attr('href');
				    return false;
				});
			}
		}

	</script>
</body>
</html>