<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style>
.reverse {
	background: #f6f6f6;
	color: black;
}

.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }

</style>

</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h3>주문 내역</h3>
				<br> <br> <br>

				<div id="searchTool">
<div class="gdsDes"></div>
					<!-- 						검색 -->
					<div class="input-group">
					<div align="right" style="margin-right: 20px">
						<input type="text" id="search" /> 
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d""><i class="fas fa-search"></i>
				                    	<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
					</div>
					</div>
					<hr>
				</div>
				<!-- 						테이블 -->
				<div align="center" class="container">

					<table class="table" style="width: 90%;">

					</table>
				</div>



				<hr />

				<!-- 					paging -->
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
	$(document).ready(function() {
		fn_selectOrderList(1);
		
		// 이벤트를 연결합니다.
		$('tbody').hover(function() {
			$(this).addClass('reverse');
		}, function() {
			$(this).removeClass('reverse');
		});
		

	});
	
	function fn_selectOrderList(pageNo){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='../myPage/selectMyOrderList' />");
		comAjax.setCallback("fn_selectOrderListCallback");
		comAjax.addParam("PAGE_INDEX",pageNo); 
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	
	function fn_selectOrderListCallback(data){
		var total = data.TOTAL;
		var body = $("table");
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
				eventName : "fn_selectOrderList",
			};
			gfn_renderPaging(params);
			
			var str = "<thead></thead>";
			$.each(data.orderlist, function(key, value){
				str += "<tr bgcolor='#212926' style='color: white; border-collapse: collapse; outline: 0; border: 0;'>" +
				"<th colspan='3'>" + value.ORDER_DATE + "</th>" + 
			"</tr>" +
			"<tbody onClick=\"location.href='../myPage/myOrderDetail?ORDER_NUM=" + value.ORDER_NUM +"'\">" +
				"<tr>" ;
					if(value.RENTAL_START != undefined){
						str += 	"<th colspan='2'>대여 상품 ( " + value.RENTAL_START +" ~ " + value.RENTAL_END + ")";
					}else{
						str += 	"<th colspan='2'>구매 상품";
					}
					str += "<input type='hidden' name='ORDER_NUM' value='" + value.ORDER_NUM  + "'>" + 
					"</th>" +
					"<td rowspan='3' width='15%' style='vertical-align: middle;'>" +
						"<div align='center'>" +
							"<button style='outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;'"+
								"class='btn btn-outline-dark' value='delete'" +
								"onClick=\"if(event.stopPropagation){event.stopPropagation();}event.cancelBubble=true; location.href='#!'\">배송"+
								"조회</button>" + 
						"</div>" + 
					"</td>" + 
				"</tr>" +
				"<tr>"+
					"<td rowspan='2' width='15%'>" +
				"<imgsrc='' width='100px' height='100px'>"+
				"</td>"+
					"<td width='70%'>" + value.PROD_NAME + " 포함 " + value.CNT +" 종</td>"+
				"</tr>"+
				"<tr>"+ 
					"<td style='border: 0'>";
					if(value.PROD_THUMB == undefined){
						str += "";
					}else{
						str += "<div class='gdsDes'>" + value.PROD_THUMB + "</div>";	
					}
				str += "</td>"+
				"</tr>" +
			"</tbody>";
			});
			body.append(str);	
		}
	}
</script>
</body>
</html>
