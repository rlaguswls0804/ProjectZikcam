<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<h3>후기내역</h3>
				<br/> <br/> <br/>
				
				<!-- 필터 영역 -->
						<div id="PQDivision" align="left" style="margin-right: 75px;">
							<form action="../admin/reviewList" method="get">
								<input type="hidden" id="sortType" value="${sortType }" />
							</form>
							<button class="btn btn-outline-dgray"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
								name="sortType" value="ALL">전체</button>
							<button class="btn btn-outline-dgray"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
								name="sortType" value="TENT">텐트/타프</button>
							<button class="btn btn-outline-dgray"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
								name="sortType" value="MAT">매트/침낭</button>
							<button class="btn btn-outline-dgray"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
								name="sortType" value="CHAIR">테이블/체어</button>
							<button class="btn btn-outline-dgray"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
								name="sortType" value="ETC">기타</button>
						</div>
						<br />


						<!--  검색 영역 -->
						<form action="../admin/reviewList" method="get"
							style="float: right;">
							<fieldset>
								<div class="input-group">
									<select name="searchType" id="searchType" size="1">
										<option value="CT"
											<c:if test="${searchType == 'ALL'}">selected</c:if>>제목+내용</option>
										<option value="TITLE"
											<c:if test="${searchType == 'TITLE'}">selected</c:if>>제목</option>
										<option value="CONTENT"
											<c:if test="${searchType == 'CONTENT'}">selected</c:if>>내용</option>
										<option value="PNAME"
											<c:if test="${searchType == 'PNAME'}">selected</c:if>>상품명</option>
									</select> 
										<input class="form-control" type="text" name="keyword"
												id="keyword" value="${keyword}" aria-label="Search for..."
												aria-describedby="btnNavbarSearch" />
										<input type="hidden" id="formSortType" name="formSortType" value="${formSortType }">
									<button class="btn btn-primary" id="btnNavbarSearch2"
										type="submit"
										style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d">
										<i class="fas fa-search"></i>
										<div id='search-button'>
											<img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
									</button>
								</div>
							</fieldset>
						</form>
						<br /> <br />
						<hr />
				
				<!-- 						테이블 영역 -->
				<div id="reviewTable" align="center" class="container">

					<table class="table table-hover" style="width: 90%; text-align: center;">
						<thead>
							<tr bgcolor="#212926" style="color: white; outline: 0; border: 0;">
								<th style="width: 10%; min-width: 100px;">글 번호</th>
								<th style="width: 15%; min-width: 100px;">상품명</th>
								<th style="width: 30%; min-width: 100px;">제목</th>
								<th style="width: 15%; min-width: 100px;">평점</th>
								<th style="width: 30%; min-width: 100px;">작성일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<hr />
				
				<!-- 						페이지 이동 버튼 영역 -->
				<div class="page_wrap">
   				<div class="page_nation">
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/></div> </div>
				<br /> <br />
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript"> 
		$(document).ready(function(){ 
			fn_selectReviewList(1);
			
			$("[id^=reviewList]").on("click", function(e){ 
				e.preventDefault(); 
				fn_openReviewDetail($(this)); 
			});
			
			$("button[name=sortType]").on('click', function(){
				
    			var sortType = $(this).val();
    			
    			if(sortType == 'TENT') {
    				$('#sortType').val('TENT');
    				$('#formSortType').val('TENT');
    				$('button[value=TENT]').removeClass('btn btn-outline-dark');
    				$('button[value=TENT]').addClass('btn btn-outline-light');
    				$('button[value=TENT]').addClass('active');
    				$('button[value=MAT]').removeClass('btn btn-outline-light');
    				$('button[value=MAT]').addClass('btn btn-outline-dark');
    				$('button[value=MAT]').removeClass('active');
    				$('button[value=CHAIR]').removeClass('btn btn-outline-light');
    				$('button[value=CHAIR]').addClass('btn btn-outline-dark');
    				$('button[value=CHAIR]').removeClass('active');
    				$('button[value=ETC]').removeClass('btn btn-outline-light');
    				$('button[value=ETC]').addClass('btn btn-outline-dark');
    				$('button[value=ETC]').removeClass('active');
    				$('button[value=ALL]').removeClass('btn btn-outline-light');
    				$('button[value=ALL]').addClass('btn btn-outline-dark');
    				$('button[value=ALL]').removeClass('active');
    			} else if(sortType == 'MAT') {
    				$('#sortType').val('MAT');
    				$('#formSortType').val('MAT');
    				$('button[value=MAT]').removeClass('btn btn-outline-dark');
    				$('button[value=MAT]').addClass('btn btn-outline-light');
    				$('button[value=MAT]').addClass('active');
    				$('button[value=TENT]').removeClass('btn btn-outline-light');
    				$('button[value=TENT]').addClass('btn btn-outline-dark');
    				$('button[value=TENT]').removeClass('active');
    				$('button[value=CHAIR]').removeClass('btn btn-outline-light');
    				$('button[value=CHAIR]').addClass('btn btn-outline-dark');
    				$('button[value=CHAIR]').removeClass('active');
    				$('button[value=ETC]').removeClass('btn btn-outline-light');
    				$('button[value=ETC]').addClass('btn btn-outline-dark');
    				$('button[value=ETC]').removeClass('active');
    				$('button[value=ALL]').removeClass('btn btn-outline-light');
    				$('button[value=ALL]').addClass('btn btn-outline-dark');
    				$('button[value=ALL]').removeClass('active');
    			} else if(sortType == 'CHAIR') {
    				$('#sortType').val('CHAIR');
    				$('#formSortType').val('CHAIR');
    				$('button[value=CHAIR]').removeClass('btn btn-outline-dark');
    				$('button[value=CHAIR]').addClass('btn btn-outline-light');
    				$('button[value=CHAIR]').addClass('active');
    				$('button[value=TENT]').removeClass('btn btn-outline-light');
    				$('button[value=TENT]').addClass('btn btn-outline-dark');
    				$('button[value=TENT]').removeClass('active');
    				$('button[value=MAT]').removeClass('btn btn-outline-light');
    				$('button[value=MAT]').addClass('btn btn-outline-dark');
    				$('button[value=MAT]').removeClass('active');
    				$('button[value=ETC]').removeClass('btn btn-outline-light');
    				$('button[value=ETC]').addClass('btn btn-outline-dark');
    				$('button[value=ETC]').removeClass('active');
    				$('button[value=ALL]').removeClass('btn btn-outline-light');
    				$('button[value=ALL]').addClass('btn btn-outline-dark');
    				$('button[value=ALL]').removeClass('active');
    			} else if(sortType == 'ETC') {
    				$('#sortType').val('ETC');
    				$('#formSortType').val('ETC');
    				$('button[value=ETC]').removeClass('btn btn-outline-dark');
    				$('button[value=ETC]').addClass('btn btn-outline-light');
    				$('button[value=ETC]').addClass('active');
    				$('button[value=TENT]').removeClass('btn btn-outline-light');
    				$('button[value=TENT]').addClass('btn btn-outline-dark');
    				$('button[value=TENT]').removeClass('active');
    				$('button[value=MAT]').removeClass('btn btn-outline-light');
    				$('button[value=MAT]').addClass('btn btn-outline-dark');
    				$('button[value=MAT]').removeClass('active');
    				$('button[value=CHAIR]').removeClass('btn btn-outline-light');
    				$('button[value=CHAIR]').addClass('btn btn-outline-dark');
    				$('button[value=CHAIR]').removeClass('active');
    				$('button[value=ALL]').removeClass('btn btn-outline-light');
    				$('button[value=ALL]').addClass('btn btn-outline-dark');
    				$('button[value=ALL]').removeClass('active');
    			} else if(sortType == 'ALL') {
    				$('#sortType').val('ALL');
    				$('#formSortType').val('ALL');
    				$('button[value=ALL]').removeClass('btn btn-outline-dark');
    				$('button[value=ALL]').addClass('btn btn-outline-light');
    				$('button[value=ALL]').addClass('active');
    				$('button[value=TENT]').removeClass('btn btn-outline-light');
    				$('button[value=TENT]').addClass('btn btn-outline-dark');
    				$('button[value=TENT]').removeClass('active');
    				$('button[value=MAT]').removeClass('btn btn-outline-light');
    				$('button[value=MAT]').addClass('btn btn-outline-dark');
    				$('button[value=MAT]').removeClass('active');
    				$('button[value=CHAIR]').removeClass('btn btn-outline-light');
    				$('button[value=CHAIR]').addClass('btn btn-outline-dark');
    				$('button[value=CHAIR]').removeClass('active');
    				$('button[value=ETC]').removeClass('btn btn-outline-light');
    				$('button[value=ETC]').addClass('btn btn-outline-dark');
    				$('button[value=ETC]').removeClass('active');
    			}
			
				$.ajax({
  				 url : '../admin/selectReviewList', 
  	              type : "get", 
  	              data : {"sortType" : sortType},
  	              success : function(data){ 
  	                 console.log(sortType);
  	                
  	              	 fn_selectReviewList(1);
  	                 
  	              },
  	              error : function(data){
  	            	 alert('error');
  	               
  	              }
  				})
   			console.log(sortType);
			});
		}); 
		
		function fn_openReviewDetail(obj){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/admin/reviewDetail' />");
			comSubmit.addParam("NUM", obj.children().find("#NUM").val());
			comSubmit.submit(); 
		} 
		
		function fn_selectReviewList(pageNo){ 
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/admin/selectReviewList' />"); 
			comAjax.setCallback("fn_selectReviewListCallback"); 
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("formSortType", $('#formSortType').val());
			comAjax.addParam("PAGE_INDEX",pageNo); 
			comAjax.addParam("PAGE_ROW", 15); 
			comAjax.ajax(); 
			} 
		
		function fn_selectReviewListCallback(data){ 
			var total = data.TOTAL; 
			var body = $("table>tbody"); 
			body.empty(); 
			if(total == 0){ 
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다</td>" + "</tr>"; 
				body.append(str); 
				} else{ 
					var params = { 
						divId : "PAGE_NAVI", 
						pageIndex : "PAGE_INDEX", 
						totalCount : total, 
						eventName : "fn_selectReviewList" }; 
				gfn_renderPaging(params); 
				var str = ""; 
				$.each(data.list, function(key, value){ 
						str +=
							"<tr id='reviewList" + value.REVIEW_NUM + " onClick=\"location.href='#this'\">" + 
							"<td>" + value.REVIEW_NUM + 
							"<input type='hidden' id='NUM' value='" + value.REVIEW_NUM + "'></td>" + 
							"<td>" + value.PROD_NAME + "</td>" + 
							"<td>";
						if(value.REVIEW_DEL == 1) {
						str +=
							"<button style='border:none; width:48px; height:24px; vertical-align:text-bottom; font-size:0.3em; margin:auto; border-radius:5px; background-color:#f82d24; color:white;'>삭제됨</button> &nbsp;"; 
								}
						str +=
							value.REVIEW_TITLE + "</td>" + 
							"<td>";
						for(var test = 1; test <= 5 ; test++){
							if(value.REVIEW_LIKE >= test){
								str += "★";
							}else{
								str += "☆";
							}
						}
						str += 
							"</td>" + 
							"<td>" + value.REVIEW_DATE + "</td>" + 
						"</tr>";
					});
				body.append(str);
				
				$("[id^=reviewList]").on("click", function(e){ 
					e.preventDefault(); 
					fn_openReviewDetail($(this)); 
				}); 
			}
		}
	</script>
</body>
</html>