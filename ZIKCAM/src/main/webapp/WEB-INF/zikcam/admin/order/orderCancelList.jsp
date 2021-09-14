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
				<h2>취소 반품 목록</h2>
				<br /> <br />

				<p style="color:#f82d24;">*모든 CS요청은 영업일 기준 48시간이 지나기 전에 처리 되어야합니다.</p>
				<font color="gray">
					모든 CS요청의 처리는 고객과 통화한 이후 진행해 주세요.
				</font>
				<br /> <br/>
				<!-- 필터 영역 -->
				<div id="orderDivision" align="left" style="margin-right: 75px;">
					<form action="../admin/orderCancelList" method="get">
						<input type="hidden" id="sortType" value="${sortType }" />
					</form>
					<button class="btn btn-outline-light"
						style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
						name="sortType" value="ALL">전체 보기</button>
					<button class="btn btn-outline-yellow" 
						style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
						name="sortType" value="REFUND">반품만 보기</button>
					<button class="btn btn-outline-green" 
						style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
						name="sortType" value="CHANGE">교환만 보기</button>
					<button class="btn btn-outline-sky" 
						style="outline: 1; border: 1; font-size: 0.8em; width: 100px; height: 40px;"
						name="sortType" value="CANCEL">취소만 보기</button>
				</div>
				<br />

				<!--  검색 영역 -->
						<form action="../admin/orderCancelList" method="get" style="float: right;">
							<fieldset> 
								<div class="input-group">
									<select name="searchType" id="searchType" size="1">
										<option value="ORDERNUM"<c:if test="${searchType == 'ORDERNUM'}">selected</c:if>>주문번호</option>
										<option value="ID"<c:if test="${searchType == 'ID'}">selected</c:if>>아이디</option>
										<option value="MEMBERNUM"<c:if test="${searchType == 'MEMNUM'}">selected</c:if>>회원번호</option>
									</select>
									<input class="form-control" type="text" name="keyword" id="keyword" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
									<input type="hidden" id="formSortType" name="formSortType" value="${formSortType }"> 
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d"><i class="fas fa-search"></i>
				                    	<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
								</div>
							</fieldset>
						</form>
					<br/> <br/> <hr />
				
				<div>
					<div align="center">
						<table style="width: 90%;" class="table">
							<tr bgcolor="#212926"
								style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<th style="width: 3%;"></th>
								<th style="width: 10%; min-width: 100px">섬네일</th>
								<th style="width: 2%;"></th>
								<th style="width: 10%; min-width: 300px;">주문 정보</th>
								<th style="width: 1%;"></th>
								<th style="width: 15%; min-width: 240px; "> 상세정보</th>
								<th style="width: 1%;"></th>
								<th style="width: 10%;"></th>
								<th style="width: 1%;"></th>
								<th style="width: 15%;"></th>
								<th style="width: 29%;"></th>
								<th style="width: 3%;"></th>
							</tr>
						</table>
						<br />
					</div>
				</div>

				<!-- list -->
				<div id="orderList" align="center">
				<form id="CS">
					<table style="width: 90%; background-color: #f6f6fa; text-align: center;">
						<thead>
						</thead>
						<tbody id="CSList" align="center">
						</tbody>
					</table>
				</form>
				</div>
				<hr />

				<!-- paging -->
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
			fn_selectCancelList(1);
			
			$("[id^=CSNUM]").on("click", function(e){ 
				e.preventDefault(); 
				fn_updateCS($(this)); 
			}); 
			
			$("button[name=sortType]").on('click', function(){
				
    			var sortType = $(this).val();
    			
    			if(sortType == 'ALL') {
    				$('#sortType').val('ALL');
    				$('#formSortType').val('ALL');
    				$('button[value=ALL]').addClass('active');
    				$('button[value=REFUND]').removeClass('active');
    				$('button[value=CHANGE]').removeClass('active');
    				$('button[value=CANCEL]').removeClass('active');
    			} else if(sortType == 'REFUND') {
    				$('#sortType').val('REFUND');
    				$('#formSortType').val('REFUND');
    				$('button[value=REFUND]').addClass('active');
    				$('button[value=ALL]').removeClass('active');
    				$('button[value=CHANGE]').removeClass('active');
    				$('button[value=CANCEL]').removeClass('active');
    			} else if(sortType == 'CHANGE') {
    				$('#sortType').val('CHANGE');
    				$('#formSortType').val('CHANGE');
    				$('button[value=CHANGE]').addClass('active');
    				$('button[value=ALL]').removeClass('active');
    				$('button[value=REFUND]').removeClass('active');
    				$('button[value=CANCEL]').removeClass('active');
    			} else if(sortType == 'CANCEL') {
    				$('#sortType').val('CANCEL');
    				$('#formSortType').val('CANCEL');
    				$('button[value=CANCEL]').addClass('active');
    				$('button[value=ALL]').removeClass('active');
    				$('button[value=REFUND]').removeClass('active');
    				$('button[value=CHANGE]').removeClass('active');
    			}
			
				$.ajax({
  				 url : '../admin/selectCancelList', 
  	              type : "get", 
  	              data : {"sortType" : sortType},
  	              success : function(data){ 
  	                 console.log(sortType);
  	                
  	              	 fn_selectCancelList(1);
  	                 
  	              },
  	              error : function(data){
  	            	 alert('error');
  	               
  	              }
  				})
   			console.log(sortType);
			});
		}); 
		
	function fn_updateCS(obj){ 
		var comSubmit = new ComSubmit("CS"); 
		comSubmit.setUrl("<c:url value='/admin/CSModify' />"); 
		comSubmit.addParam("CSNUM", obj.parent().find("[id^=CSNUM]").val());	
		comSubmit.addParam("DNUM", obj.parent().find("[id^=DNUM]").val());	
		comSubmit.submit(); 
	} 
	
	function fn_selectCancelList(pageNo){ 
		var comAjax = new ComAjax(); 
		comAjax.setUrl("<c:url value='/admin/selectCancelList' />"); 
		comAjax.setCallback("fn_selectCancelListCallback");
		comAjax.addParam("keyword", $('#keyword').val());
		comAjax.addParam("searchType", $('#searchType').val());
		comAjax.addParam("sortType", $('#sortType').val());
		comAjax.addParam("formSortType", $('#formSortType').val());
		comAjax.addParam("PAGE_INDEX",pageNo); 
		comAjax.addParam("PAGE_ROW", 15); 
		comAjax.ajax(); 
		} 
	
	function fn_selectCancelListCallback(data){ 
		var total = data.TOTAL; 
		var body = $("#CSList"); 
		body.empty(); 
		if(total == 0){ 
			var str = "<tr>" + "<td colspan='11'>조회된 결과가 없습니다</td>" + "</tr>"; 
			body.append(str); 
			} else{ 
				var params = { 
					divId : "PAGE_NAVI", 
					pageIndex : "PAGE_INDEX", 
					totalCount : total, 
					eventName : "fn_selectCancelList" }; 
			gfn_renderPaging(params); 
			var str = ""; 
			$.each(data.list, function(key, value){ 
					str += 
						"<tr>" + 
							"<td colspan='12' align='left' style='background-color: white; font-size: 1.4em; font-style: bold;'>" + 
								value.ORDER_STATUS + "&nbsp;&nbsp;"; 
						if(value.APPROVE_DATE != null) {
							str += 
								"승인일: " + value.APPROVE_DATE;
						}
					str +=	
							"</td>" + 
						"</tr>" + 
							"<tr>" + 
								"<td style='width: 3%'>" + "</td>" + 
								"<td style='virtical-align:middle; width: 10%' rowspan='5'>" + 
									"<img src='c:..' width='100' height='100'>" + 
								"</td>" + 
								"<td style='width: 2%'>" + "</td>" + 
								"<td style='width: 10%; min-width: 120px;'>" + "주문번호" + "</td>" + 
								"<td style='width: 1%'>" + "</td>" + 
								"<td style='width: 15%; min-width: 180px;'>" + value.ORDER_NUM + "</td>" + 
								"<td style='width: 1%'>" + "</td>" + 
								"<td style='width: 10%; min-width: 120px;'>" + "아이디" + "</td>" + 
								"<td style='width: 1%'>" + "</td>" + 
								"<td style='width: 15%; min-width: 120px;'>" + value.MEMBER_ID + "</td>" + 
								"<td rowspan='5' style='virtical-align:middle; width: 29%; min-width: 180px;'>"; 
								if(value.ORDER_STATUS === '반품 신청') {
									str += 
										"<div>" + 
											"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 30px;' class='btn btn-outline-yellow' value='1' id='CSNUM" + value.DORDER_NUM + "' onclick =\"location.href = '#this'\">" + 
												"반품승인" + 
											"</button>" + 
											"<div>" + 
												"<input type='hidden' id='DNUM' value='" + value.DORDER_NUM + "'>" + 
											"</div>" + 
										"</div>" + 
										"<br />" + "<br />" + 
										"<div>" + 
											"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 30px;' class='btn btn-outline-alert' value='2' id='CSNUM" + value.DORDER_NUM + "_1' onclick =\"location.href = '#this'\">" + 
												"반품거부" + 
											"</button>" + 
											"<div>" + 
											"<input type='hidden' id='DNUM' value='" + value.DORDER_NUM + "'>" + 
											"</div>" + 
										"</div>";
								}else if(value.ORDER_STATUS === '교환 신청'){
									str += 
										"<div>" + 
											"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 30px;' class='btn btn-outline-green' value='3' id='CSNUM" + value.DORDER_NUM + "' onclick =\"location.href = '#this'\">" + 
												"교환승인" + 
											"</button>" + 
											"<div>" + 
												"<input type='hidden' id='DNUM' value='" + value.DORDER_NUM + "'>" + 
											"</div>" + 
										"</div>" + 	
										"<br />" + "<br />" + 
										"<div>" + 
											"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 30px;' class='btn btn-outline-alert' value='2' id='CSNUM" + value.DORDER_NUM + "_1' onclick =\"location.href = '#this'\">" + 
												"교환거부" + 
											"</button>" + 
											"<div>" + 
												"<input type='hidden' id='DNUM' value='" + value.DORDER_NUM + "'>" + 
											"</div>" + 
										"</div>";
								}else if(value.ORDER_STATUS === '취소 신청'){
									str += 
										"<div>" + 
											"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 30px;' class='btn btn-outline-sky' value='4' id='CSNUM" + value.DORDER_NUM + "' onclick =\"location.href = '#this'\">" + 
												"취소승인" + 
											"</button>" + 
											"<div>" + 
												"<input type='hidden' id='DNUM' value='" + value.DORDER_NUM + "'>" + 
											"</div>" + 
										"</div>" + 
										"<br />" + "<br />" + 
										"<div>" + 
											"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 30px;' class='btn btn-outline-alert' value='5' id='CSNUM" + value.DORDER_NUM + "_1' onclick =\"location.href = '#this'\">" + 
												"취소거부" + 
											"</button>" + 
											"<div>" + 
												"<input type='hidden' id='DNUM' value='" + value.DORDER_NUM + "'>" + 
											"</div>" + 
										"</div>";
								}
					str +=
								"</td>" + 
								"<td style='width: 3%'>" + "</td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td rowspan='4'>" + "</td>" + 
								//
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + "상품번호" + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + value.PROD_NUM + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + "수량" + "</td>" + 
								"<td rowspan='4'>" + "</td>" + 
								"<td>" + value.PROD_COUNT + "</td>" + 
								//
								"<td rowspan='4'>" + "</td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td>" + "주문상태" + "</td>" + 
								"<td>" + value.ORDER_STATUS + "</td>" + 
								"<td>" + "요청사유" + "</td>" + 
								"<td>" + value.ORDER_SCR + "</td>" +
							"</tr>" + 
							"<tr>" + 
								"<td>" + "전화번호" + "</td>" + 
								"<td>" + value.ORDER_RCV_PHONE + "</td>" + 
								"<td>" + "결제수단" + "</td>" + 
								"<td>" + value.ORDER_PAYTYPE + "</td>" + 
							"</tr>" + 
							"<tr>" + 
								"<td>" + "주문일" + "</td>" + 
								"<td>" + value.ORDER_DATE + "</td>" + 
								"<td>" + "</td>" + 
								"<td>" + "</td>" + 
							"</tr>" + 
							"<tr height='20px;' style='background-color: white;'>" +
								"<td colspan='12'>" + "</td>" + 
							"</tr>";
			});
			body.append(str);
		}
	}
</script>
</body>
</html>