<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>직캠문의</h3>
						<br/> <br/> 
						<p style="color:#f82d24;">*모든 문의는 영업일 기준 48시간이 지나기 전에 답변이 되어야합니다.</p>
						<font color="gray">
							상담원이 폭언 욕설 및 성희롱에 피해를 입을 경우 상담원 보호법에 따라 보호받을 수 있습니다.<br/>
							신고상담문의: 1888-****
						</font>
						<br/> <br/>

						<!-- 버튼 영역 -->
						<button class="btn btn-outline-yellow"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
								id="PQList" name="PQList" value="PQ" onClick="location.href= '../admin/PQList'">상품문의</button>
							<button class="btn btn-outline-green"
								style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;">직캠문의</button>
						<br />


						<!--  검색 영역 -->
						<form action="../admin/QnAList" method="get"
							style="float: right;">
							<fieldset>
								<div class="input-group">
									<select name="searchType" id="searchType" size="1">
										<option value="ALL"
											<c:if test="${searchType == 'ALL'}">selected</c:if>>제목+내용</option>
										<option value="TITLE"
											<c:if test="${searchType == 'TITLE'}">selected</c:if>>제목</option>
										<option value="CONTENT"
											<c:if test="${searchType == 'CONTENT'}">selected</c:if>>내용</option>
										<option value="ID"
											<c:if test="${searchType == 'ID'}">selected</c:if>>아이디</option>
									</select> <input class="form-control" type="text" name="keyword"
										id="keyword" value="${keyword}" aria-label="Search for..."
										aria-describedby="btnNavbarSearch" />
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
						<div align="center" class="container">
							<table class="table table-hover" style="width: 90%; text-align:center;">
								<thead>
								<tr bgcolor="#212926" 
									style="color: white; border-collapse: collapse;">
									<th style="width:10%; min-width:100px;">글 번호</th>
									<th style="width:45%; min-width:100px;">제목</th>
									<th style="width:15%; min-width:100px;">답변상태</th>
									<th style="width:30%; min-width:100px;">작성일</th>
								</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<hr />
						<!-- 						페이지 이동 영역 -->
   							<div class="page_nation">
								<div id="PAGE_NAVI" align="center"></div>
								<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
							</div>
						<br /> <br /> <br /> <br /> <br /> <br /> <br />
					</div>	
				</section>
			</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript"> 
		$(document).ready(function(){ 
			fn_selectQnAList(1);
			
			$("[id^=QnAList]").on("click", function(e){ 
				e.preventDefault(); 
				fn_openQnADetail($(this)); 
			}); 
			
		}); 
		
		function fn_openQnADetail(obj){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/admin/QnADetail' />");
			comSubmit.addParam("NUM", obj.children().find("#NUM").val());
			comSubmit.submit(); 
		} 
		
		function fn_selectQnAList(pageNo){ 
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/admin/selectQnAList' />"); 
			comAjax.setCallback("fn_selectQnAListCallback"); 
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
			comAjax.addParam("PAGE_ROW", 15); 
			comAjax.ajax(); 
			} 
		
		function fn_selectQnAListCallback(data){ 
			var total = data.TOTAL; 
			var body = $("table>tbody"); 
			body.empty(); 
			if(total == 0){ 
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다</td>" + "</tr>"; 
				body.append(str); 
				} else{ 
					var params = { 
						divId : "PAGE_NAVI", 
						pageIndex : "PAGE_INDEX", 
						totalCount : total, 
						eventName : "fn_selectQnAList" }; 
				gfn_renderPaging(params); 
				var str = ""; 
				$.each(data.list, function(key, value){ 
						str += 
							"<tr id='QnAList" + value.QNA_NUM + " style='border-bottom: 1px solid;' onClick=\"location.href= '#this'\">" + 
								"<td>" + value.QNA_NUM + 
									"<input type='hidden' id='NUM' value='" + value.QNA_NUM + "'>" + 
								"</td>" + 
								"<td>";
								if(value.QNA_DEL == 1) {
									str +=
										"<button style='border:none; width:48px; height:24px; vertical-align:text-bottom; font-size:0.3em; margin:auto; border-radius:5px; background-color:#f82d24; color:white;'>삭제됨</button> &nbsp;"; 
								}
						str +=
								value.QNA_TITLE + "</td>" + 
								"<td>";
								if(value.QNA_REPLY == 0) {
									str += 
										"미답변";
								}else if(value.QNA_REPLY == 1){
									str += 
										"답변완료";
								}
						str += 
								"</td>" + 
								"<td>" + value.QNA_DATE + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				$("[id^=QnAList]").on("click", function(e){ 
					e.preventDefault(); 
					fn_openQnADetail($(this)); 
				}); 
			}
		}
	</script>
</body>
</html>
