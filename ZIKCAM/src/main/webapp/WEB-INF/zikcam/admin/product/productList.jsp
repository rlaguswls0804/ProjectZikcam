<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style type="text/css">
.gdsDes img { max-width:96px; max-height:128px; width:auto; height:auto; }
</style>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<p><h3><b>상품 목록</b></h3></p>
				<hr/>
				<br/><br/>
				   
				<!--  검색 영역 -->
				<button id="insertItem" class="btn btn-outline-light" onclick="location.href = #this">상품 추가</button>
						<form action="../admin/productList" method="get" style="float: right;">
							<fieldset> 
								<div class="input-group">
									<select name="searchType" id="searchType" size="1">
										<option value="TENT"<c:if test="${searchType == 'TENT'}">selected</c:if>>텐트/타프</option>
										<option value="MAT"<c:if test="${searchType == 'MAT'}">selected</c:if>>매트/침낭</option>
										<option value="CHAIR"<c:if test="${searchType == 'CHAIR'}">selected</c:if>>테이블/체어</option>
										<option value="ETC"<c:if test="${searchType == 'ETC'}">selected</c:if>>기타</option>
									</select>
									<input class="form-control" type="text" name="keyword" id="keyword" placeholder="상품명 입력" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d"><i class="fas fa-search"></i>
				                    	<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
								</div>
							</fieldset>
						</form>
						
					<br/> <font color="gray">수량 및 가격을 입력하지 않으셨을경우 0으로 표시됩니다. ex)0원, 0개</font>
					<br/> <hr />
					
				<!-- 리스트 -->
				<div id="productList" align="center">
					<table class="table">
						<colgroup>
								<col width="5%" />
								<col width="12%" />
								<col width="8%" />
								<col width="25%" />
								<col width="8%" />
								<col width="12%" />
								<col width="8%" />
								<col width="12%" />
								<col width="10%" />
							</colgroup>
						<thead>
						<tr>
							<td colspan="2"><b>상품 번호</b></td>
							<td colspan="2" align="center"><b>상품 정보</b></td>
							<td colspan="2" align="center"><b>구매 정보</b></td>
							<td colspan="2" align="center"><b>대여 정보</b></td>
							<td></td>
						</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				
				<br/><br/>
			
			<!-- 페이징 -->
			<div class="page_wrap">
   				<div class="page_nation">
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
				</div>
			</div>
			<br /> <br /> <br /> <br /> <br /> <br /> <br />
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script>
		$(document).ready(function() {
			fn_selectProductList(1);
			
			$("#insertItem").on("click", function(e) {
				e.preventDefault();
				fn_openProductWrite();
			});
			
			$("#updatebt").on("click", function(e) {
				var index = $("#updatebt").index(this);
				e.preventDefault();
				fn_openProductModify(index);
			});
			
			$("#deletebt").on("click", function(e) {
				var index = $("#deletebt").index(this);
				e.preventDefault();
				fn_validation(index);
			});
			
			$("a[name='title']").on("click", function(e){ //썸네일 
				e.preventDefault();
				fn_openProductDetail($(this));
			});
		});
 
		function fn_openProductWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../admin/openProductWrite' />");
			comSubmit.submit();
		}
		
		function fn_openProductModify(index) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../admin/productUpdate' />");
			comSubmit.addParam("PROD_NUM", $('#num').eq(index).text());  
			comSubmit.submit(); 
		}
		
		function fn_openProductDelete(index) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../admin/productDelete' />");
			comSubmit.addParam("PROD_NUM", $('#num').eq(index).text());  
			comSubmit.submit(); 
		}
		
		function fn_validation(index) {  	   
			var result = confirm("상품을 삭제하시겠습니까?");
            if(result){
            	fn_openProductDelete(index);
            }
         }
		
		function fn_selectProductList(pageNo){ 
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/admin/selectProductList' />"); 
			comAjax.setCallback("fn_selectProductListCallback"); 
			comAjax.addParam("keyword", $('#keyword').val()); 
			comAjax.addParam("searchType", $('#searchType').val()); 
			comAjax.addParam("PAGE_INDEX",pageNo); 
			comAjax.addParam("PAGE_ROW", 15); 
			comAjax.ajax(); 
		} 
		function fn_openProductDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../prod/productDetail'/>");
			comSubmit.addParam("PROD_NUM", obj.parent().find("#PROD_NUM").val());
			comSubmit.submit();
		}
		
		
		function fn_selectProductListCallback(data){ 
			var total = data.TOTAL; 
			var body = $("table>tbody"); 
			body.empty(); 
			if(total == 0){ 
				var str = "<tr>" + "<td colspan='15'>조회된 결과가 없습니다</td>" + "</tr>"; 
				body.append(str); 
				} else{ 
					var params = { 
						divId : "PAGE_NAVI", 
						pageIndex : "PAGE_INDEX", 
						totalCount : total, 
						eventName : "fn_selectProductList" }; 
				gfn_renderPaging(params); 
				var str = ""; 
				$.each(data.list, function(key, value){ 
						str +=
							"<tr>" + 
								"<td rowspan='3' align='center' valign='middle' id='num'>" + value.PROD_NUM + "</td>" + 
								"<td rowspan='3' align='center' valign='middle'>" + 
								"<div class='gdsDes'><a href='#this' name='title'>" + value.PROD_THUMB +  
								"<input type='hidden' id='PROD_NUM' name='PROD_NUM' value=" + value.PROD_NUM + ">" +
								"</a></div>" +
								"</td>" + 
								"<td>" + "상품명" + "</td>" + 
								"<td>" + value.PROD_NAME + "</td>" + 
								"<td>" + "구매 수량" + "</td>" + 
								"<td>" + value.PROD_STOCK + "개" + "</td>" + 
								"<td>" + "대여 수량" + "</td>" + 
								"<td>" + value.PROD_RSTOCK + "개" + "</td>" + 
								"<td rowspan='2' align='center' valign='middle'>" + 
									"<button class='btn btn-outline-light' id='updatebt'>" + "상품수정" + "</button><br>" +
									"<button class='btn btn-outline-d' id='deletebt'>" + "상품삭제" + "</button>" +
								"</td>" + 
							"</tr>" + 
							"<tr>" +
								"<td>" + "카테고리" + "</td>" + 
								"<td>" + value.PROD_CATEGORY + "</td>" + 
								"<td>" + "구매 가격" + "</td>" + 
								"<td>" + value.PROD_PRICE + "원" + "</td>" + 
								"<td>" + "대여가격" + "</td>" + 
								"<td>" + value.PROD_RPRICE + "원" + "</td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td colspan='2'>" + "</td>" + 
							"</tr>" + 
							"<tr>";
				});
				body.append(str);
				 
				$("#insertItem").on("click", function(e) {
					e.preventDefault();
					fn_openProductWrite();
				}); 
				
				$("#updatebt").on("click", function(e) {
					var index = $("#updatebt").index(this);
					e.preventDefault();
					fn_openProductModify(index);
				});
				
				$("a[name='title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openProductDetail($(this));
				});
				
			}
		}
		
		
		history.replaceState({}, null, location.pathname);
		
	</script>
</body>
</html>
