<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
				<h3>문의내역</h3>


				<br> <br>
				<!-- 						카테고리 -->
				<div id="rentalDivision" align="left" style="margin-right: 75px;">
					<form action="../myPage/myReviewList" method="get">
						<input type="hidden" name="sortType" id="sortType" value="" />
					</form>
					<button class="btn btn-outline-dark active"
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						name="sortType" value="PQ">상품 문의</button>

					<button
						style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;"
						class="btn btn-outline-dark" name="sortType" value="QNA">직캠
						문의</button>

				</div>

				<!-- 						검색 -->
				<form action="../myPage/myPQList" method="get"
					style="float: right;">
					<fieldset>
					<div class="input-group">
						<select size="1" name="searchType" id="searchType">
							<option value="title" <c:if test="${searchType == 'title'}"> selected ='selected'</c:if>>제목</option>
							<option value="content" <c:if test="${searchType == 'content'}"> selected ='selected'</c:if>>내용</option>
						</select> <input type="text" id="keyword" name="keyword"
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
				</form>

				

				<br> <font color="gray">상품문의는 구매내역에서, 직캠문의는 고객센터에서 작성하실 수 있습니다.</font>

				
				<hr />
				<!-- 						테이블 영역 -->
				<div align="center" class="container">

					<table class="table table-hover"
						style="width: 90%; text-align: center;">
						<thead><tr bgcolor="#212926"
							style="color: white; border-collapse: collapse; outline: 0; border: 0;">
							<th style="width: 10%;">글 번호</th>
							<th style="width: 20%;">제목</th>
							<th style="width: 25%">내용</th>
							<th style="width: 15%;">답변상태</th>
							<th style="width: 30%;">작성일</th>
						</tr>
						</thead>
						<tbody></tbody>
	
					</table>
				</div>
				<hr />
				<!-- 						페이지 이동 영역 -->
				<div class="page_wrap">
   				<div class="page_nation">
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		
	var searchType = $("#type").val();
		$(document).ready(function() {
			fn_selectPQList(1);

			$("button[name=sortType]").on('click', function(){
				
    			var sortType = $(this).val();
    			if(sortType == 'PQ'){
    				$('#sortType').val('PQ');
    				$('#formSortType').val('PQ');
    				$('button[value=PQ]').addClass('active');
    				$('button[value=QNA]').removeClass('active');
    			}
    			else if(sortType == 'QNA') {
    				$('#sortType').val('QNA');
    				$('#formSortType').val('QNA');
    				$('button[value=PQ]').removeClass('active');
    				$('button[value=QNA]').addClass('active');
    			}
    			
    			$.ajax({
     				 url : '../myPage/selectMyPQList', 
     	              type : "get", 
     	              data : {"sortType" : sortType, "searchType" : searchType},
     	              success : function(data){ 
     	                 console.log(sortType);
     	                
     	              	 fn_selectPQList(1);
     	                 
     	              },
     	              error : function(data){
     	            	 alert('error');
     	               
     	              }
     				})
    			
			});
		});

		function fn_selectPQList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='../myPage/selectMyPQList' />");
			comAjax.setCallback("fn_selectPQListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("formSortType", $('#formSortType').val());
			comAjax.ajax();
		}

		function fn_selectPQListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
// 			alert(JSON.stringify(data));

			body.empty();

			if (total == 0) {
				var str = "<tr>" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					recordCount : 15,
					totalCount : total,
					eventName : "fn_selectPQList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
									if(value.LISTTYPE == 'PQ'){
										str += "<tr onClick=\"location.href='../myPage/myPQDetail?PQ_NUM=" + value.NUM + "'\">"
										+"<td>" + value.RNUM 
										+ " <input type='hidden' id='PQ_NUM' " + "value='" + value.NUM +"'>"
										+ "</td>";
									}else{
										str += "<tr onClick=\"location.href='../myPage/myQNADetail?QNA_NUM=" + value.NUM + "'\">"
										+"<td>" + value.RNUM 
										+ " <input type='hidden' id='QNA_NUM' " + "value='" + value.NUM +"'>"
										+ "</td>";
									}									
									
									if(value.LISTTYPE == 'PQ'){
										str += "<td>" + value.TITLE + "</td>" +
												"<td>" + value.CONTENT.substring(0, 10) + "...</td>";
									}else{
										str += "<td>" + value.TITLE + "</td>" +
												"<td>" + value.CONTENT.substring(0, 10) + "...</td>";
									}		
									
									
										str += "<td>";
										
									if (value.REPLY == '0') {
										str += "X";
									} else {
										str += "O";
									}
									str += "</td>" + "<td>" + value.CDATE
											+ "</td>" + "</tr>";
								});
				body.append(str);
			}
		}
	</script>

</body>
</html>
