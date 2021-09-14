<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h2>주문목록</h2>
				<br /> <br /> <br />

				<!--  검색 영역 -->
						<form action="../admin/orderList" method="get" style="float: right;">
							<fieldset> 
								<div class="input-group">
									<select name="searchType" id="searchType" size="1">
										<option value="ORDERNUM"<c:if test="${searchType == 'ORDERNUM'}" >selected</c:if>>주문번호</option>
										<option value="ID"<c:if test="${searchType == 'ID'}">selected</c:if>>아이디</option>
										<option value="RCVNANE"<c:if test="${searchType == 'RCVNANE'}">selected</c:if>>수령인</option>
									</select>
									<input class="form-control" type="text" name="keyword" id="keyword" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 5px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d"><i class="fas fa-search"></i>
				                    	<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
								</div>
							</fieldset>
						</form>
					<br/> <br/> <hr />

				<!-- 리스트 -->
				<div id="orderList" align="center">
					<table style="min-width: 600px; width: 90%;">
						<thead>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<br />
				<hr/>
				<!-- 페이징 -->
				<div class="page_wrap">
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
			fn_selectOrderList(1);
			
			$("[id^=orderDetail]").on("click", function(e){ 
				e.preventDefault(); 
				fn_openOrderDetail($(this)); 
			}); 
		}); 
		
		function fn_openOrderDetail(obj){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/admin/orderDetail' />");
			comSubmit.addParam("NUM", obj.parent().find("#NUM").val());
			comSubmit.submit(); 
		} 
		function fn_selectOrderList(pageNo){ 
			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/admin/selectOrderList' />"); 
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.setCallback("fn_selectOrderListCallback"); 
			comAjax.addParam("PAGE_INDEX",pageNo); 
			comAjax.addParam("PAGE_ROW", 15); 
			comAjax.ajax(); 
			} 
		
		function fn_selectOrderListCallback(data){ 
			var total = data.TOTAL; 
			var body = $("table>tbody"); 
			body.empty(); 
			if(total == 0){ 
				var str = "<tr>" + "<td colspan='9'>조회된 결과가 없습니다</td>" + "</tr>"; 
				body.append(str); 
				} else{ 
					var params = { 
						divId : "PAGE_NAVI", 
						pageIndex : "PAGE_INDEX", 
						totalCount : total, 
						eventName : "fn_selectOrderList" }; 
				gfn_renderPaging(params); 
				var str = ""; 
				$.each(data.list, function(key, value){ 
						str += 
							"<tr>" + 
								"<td style='font-size: 1.4em; font-style: bold;' colspan='9'>" + 
									"주문번호: " + value.ORDER_NUM + "&nbsp;&nbsp;" + "주문일: "+ value.ORDER_DATE + 
								"</td>" + 
							"</tr>" + 
							"<tr bgcolor='#212926' style='color: white; border-collapse: collapse; outline: 0; border: 0;'>" + 
								"<th style='width: 3%;'>" + "</th>" + 
								"<th style='width: 13%; min-width: 100px; text-align: left;'>" + "기본정보" + "</th>" + 
								"<th style='width: 1%'>" + "</th>" + 
								"<th style='width: 18%; min-width: 150px; text-align: left;'>" + "</th>" + 
								"<th style='width: 2%'>" + "</th>" + 
								"<th style='width: 13%; min-width: 100px; text-align: left;'>" + "수령인정보" + "</th>" + 
								"<th style='width: 2%'>" + "</th>" + 									"<th style='width: 41%; min-width: 250px; text-align: left;'>" + "</th>" + 
								"<th style='width: 3%'>" + "</th>" + 
							"</tr>" + 
							"<tr>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + "주문번호" + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + value.ORDER_NUM + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + "수령인" + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + value.ORDER_RCV_NAME + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td>" + "총 주문금액" + "</td>" + 
								"<td>" + value.ORDER_PRICE + "원" + "</td>" + 
								"<td>" + "수령지" + "</td>" + 
								"<td>" + value.ORDER_RCV_ADDRESS1 + "</td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td>" + "아이디" + "</td>" + 
							"<td>" + value.MEMBER_ID + "</td>" + 
							"<td>" + "상세주소" + "</td>" + 
							"<td>" + value.ORDER_RCV_ADDRESS2 + "</td>" + 
						"</tr>" +
						"<tr style='border-bottom:1px solid;'>" + 
							"<td>" + "결재수단" + "</td>" + 
							"<td>" + value.ORDER_PAYTYPE + "</td>" + 
							"<td>" + "요청사항" +"</td>" + 
							"<td>" + value.ORDER_MEMO + "</td>" + 
						"</tr>" +
						"<tr>" + 
							"<td colspan='9' align='right'>" +
								"<button id='orderDetail" + value.ORDER_NUM + "'" + "class='btn btn-outline-dark' style='border: 1; border-radius: 6px; width: 100px; height: 26px; margin: auto; font-size: 0.7em;' onclick=\"location.href = '#this'\">" + 
									"상세보기" + 
								"</button>" + 
								"<input id='NUM' type='hidden' value='" + value.ORDER_NUM + "'>" + 
							"</td>" + 
						"</tr>";
				});
				body.append(str);
				
				$("[id^=orderDetail]").on("click", function(e){ 
					e.preventDefault(); 
					fn_openOrderDetail($(this)); 
				});
			}
		}
	</script>
</body>
</html>
