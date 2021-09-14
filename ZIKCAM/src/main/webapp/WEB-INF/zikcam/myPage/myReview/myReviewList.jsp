<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h3>후기내역</h3>
				${formSortType }<br/>
				${sortType }
				<br> <br>



				<!-- 						카테고리 -->
				<div id="rentalDivision" align="left" style="margin-right: 75px;">
					<form action="../myPage/myReviewList" method="get">
						<input type="hidden" id="sortType" value="${sortType }" />
					</form>

					<button class="btn btn-outline-dark active" 
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						name="sortType" value="">전체</button>

					<button class="btn btn-outline-dark" 
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						 name="sortType" value="tent">
						텐트 / 타프</button>

					<button class="btn btn-outline-dark" 
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						name="sortType" value="sleepbag">
						침낭 / 매트</button>


					<button class="btn btn-outline-dark" 
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						name="sortType" value="table">
						테이블 / 체어</button>

					<button class="btn btn-outline-dark" 
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						name="sortType" value="else">
						기 타</button>

				</div>

				<!-- 						검색 -->
				<form action="../myPage/myReviewList" method="get"
					style="float: right;">
					<div>
					<fieldset>
					<div class="input-group">
						<select name="searchType" id="searchType" size="1">
							<option value="product" <c:if test="${searchType == 'product'}"> selected ='selected'</c:if> >상품</option>
							<option value="title" <c:if test="${searchType == 'title'}"> selected ='selected'</c:if> >제목</option>
							<option value="content" <c:if test="${searchType == 'content'}"> selected='selected'</c:if> >내용</option>
						</select> 
						<input type="text" id="keyword" name="keyword"
							value="${keyword }" /> 
						<input type="hidden" id="formSortType" name="formSortType" value="${formSortType }"> 
						<button class="btn btn-primary" id="btnNavbarSearch2"
										type="submit"
										style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d">
										<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
			              </div>
					</fieldset>
					</div>
				</form>

				
				<br>
				<hr />
				<!-- 						테이블 영역 -->
				<div align="center" class="container">

					<table class="table table-hover"
						style="width: 90%; text-align: center;">
						<thead>
							<tr bgcolor="#212926"
								style="color: white; border-collapse: collapse; outline: 0; border: 0;">

								<th style="width: 10%;">글 번호</th>
								<th style="width: 15%;">상품명</th>
								<th style="width: 30%;">제목</th>
								<th style="width: 15%;">평점</th>
								<th style="width: 30%;">작성일</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>

				</div>
				<hr />
				<!-- 						페이지 이동 버튼 영역 -->
				<div class="page_wrap">
   				<div class="page_nation">
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
				</div>
			</div>
			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">


		var searchType = $("#type").val();
		var sortType;
		
		$(document).ready(function(){
			fn_selectReviewList(1);
		
		$("button[name=sortType]").on('click', function(){
				
    			sortType = $(this).val();
    			
    			if(sortType == ''){
    				$('#sortType').val('');
    				$('#formSortType').val('');
    				$('button[value=""]').addClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=sleepbag]').removeClass('active');
    				$('button[value=table]').removeClass('active');
    				$('button[value=else]').removeClass('active');
    			}
    			else if(sortType == 'tent') {
    				$('#sortType').val('tent');
    				$('#formSortType').val('tent');
    				$('button[value=""]').removeClass('active');
    				$('button[value=tent]').addClass('active');
    				$('button[value=sleepbag]').removeClass('active');
    				$('button[value=table]').removeClass('active');
    				$('button[value=else]').removeClass('active');
    			} else if(sortType == 'sleepbag') {
    				$('#sortType').val('sleepbag');
    				$('#formSortType').val('sleepbag');
    				$('button[value=""]').removeClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=sleepbag]').addClass('active');
    				$('button[value=table]').removeClass('active');
    				$('button[value=else]').removeClass('active');
    			} else if(sortType == 'table') {
    				$('#sortType').val('table');
    				$('#formSortType').val('table');
    				$('button[value=""]').removeClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=sleepbag]').removeClass('active');
    				$('button[value=table]').addClass('active');
    				$('button[value=else]').removeClass('active');
    			} else if(sortType == 'else') {
    				$('#sortType').val('else');
    				$('#formSortType').val('else');
    				$('button[value=""]').removeClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=sleepbag]').removeClass('active');
    				$('button[value=table]').removeClass('active');
    				$('button[value=else]').addClass('active');
    			}
    			
    			$.ajax({
     				 url : '../myPage/selectMyReviewList', 
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
    			
			});
			
		});
		
		
		
		function fn_selectReviewList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='../myPage/selectMyReviewList' />");
			comAjax.setCallback("fn_selectReviewListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo); 
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("formSortType", $('#formSortType').val());
			comAjax.ajax();
		}

		
		function fn_selectReviewListCallback(data){
			var total = data.TOTAL;

			var body = $("table>tbody");
// 			alert(JSON.stringify(data));
			body.empty();

			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='5'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					recordCount : 15,
					totalCount : total ,
					eventName : "fn_selectReviewList"
				};
				gfn_renderPaging(params);
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr onClick=\"location.href='../myPage/myReviewDetail?REVIEW_NUM=" +value.REVIEW_NUM + "'\">"+
						"<td>" + value.RNUM + 
						"<input type='hidden' id='REVIEW_NUM' value='" + value.REVIEW_NUM + "'>" +
						"</td>" + 
						"<td>" + value.PROD_NAME + "</td>" +
						"<td>" + value.REVIEW_TITLE + "</td> " +
						"<td>";
						for(var test = 1; test <= 5 ; test++){
							if(value.REVIEW_LIKE >= test){
								str += "★";
							}else{
								str += "☆";
							}
						}
						str += "</td>" +
						"<td>" + value.REVIEW_DATE + "</td>" + 
					"</tr>";
				});

				body.append(str);	
			}
		}
	</script>
</body>
</html>
