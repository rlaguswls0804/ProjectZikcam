<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<style type="text/css">
	.gdsDes img { max-width: 100px; max-height: 100px;}		
</style>
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
					<form id="frm" name="frm" method="get" enctype="multipart/form-data">
						<p><h3><b>주문/결제</b></h3></p>
						<hr/>
						<br/>
						
						<!-- 구매자 정보 -->
						<h5><b>구매자 정보</b></h5>
						<hr/>
						
						<input type="hidden" id="member_id" value="${list3.MEMBER_ID}"/>
						<input type="hidden" id="prod_num" value="${list3.PROD_NUM}"/>
						<input type="hidden" id="rental_start" value="${list3.RENTAL_START}"/>
						<input type="hidden" id="rental_end" value="${list3.RENTAL_END}"/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">이름 </td>
								<td width="80%" id="member_name">${list3.MEMBER_NAME}</td>
							</tr>
							<tr>
								<td align="right">이메일 </td>
								<td>${list3.MEMBER_EMAIL}</td>
							</tr>
							<tr>
								<td align="right">휴대폰 번호 </td>
								<td>${list3.MEMBER_PHONE1}</td>
							</tr>
						</table>
						
						<br/>
						
						<!-- 수령자 정보 -->
						<h5><b>수령자 정보</b></h5>
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">이름 </td>
								<td width="80%" colspan="2">
									<input type="text" style="width:375px" id="rcv_name" value="${list3.MEMBER_NAME}"/>
								</td>
							</tr>
							<tr>
								<td align="right">배송주소 </td>
								<td>
									<input type="text" style="width:200px" id="rcv_zoncode" value="${list3.MEMBER_ZONCODE}"/>
									<button type="button" class="btn btn-outline-dark" id="changeAddress">배송지 변경</button>
									<input type="text" style="width:375px" id="rcv_address1" value="${list3.MEMBER_ADDRESS1}"/>
									<input type="text" style="width:375px" id="rcv_address2" value="${list3.MEMBER_ADDRESS2}" placeholder="상세주소"/>
								</td>
							</tr>
							<tr>
								<td align="right">연락처 </td>
								<td colspan="2">
									<input type="text" id="rcv_phone" value="${list3.MEMBER_PHONE1}"/>
								</td>
							</tr>
							<tr>
								<td align="right">배송 요청사항 </td>
								<td><textarea cols="50" rows="2" id="memo" placeholder="배송 요청사항"></textarea></td> <td width="30%" valign="middle">
							</tr>
						</table>
						<br><br>
						
						<!-- 장바구니 -->
						<%-- <c:choose>
						<c:when test="${temp.isRental eq 'false'}"> --%>
						<h5>
							<b>구매 상품</b>&nbsp;&nbsp;
						</h5>
						
						<hr/>
						
						<div id="purchase">
							<table class="table" id="table1">
								<colgroup>
									<col width="25%" />
									<col width="45%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<tr valign="middle" id="tr1">
									<td rowspan="2">
										<input type="hidden" name="prodPrice" value="${list1.PROD_PRICE}" />
										<input type="hidden" name="prodStock" value="${list1.PROD_STOCK}" />
										<div class="gdsDes">${list1.PROD_THUMB}</div>
									</td>
									<th>${list1.PROD_NAME }</th>
									<td id="tdStock">
										<c:set var="check" value="${list1.PROD_STOCK - list3.PROD_COUNT }"/>
										<c:if test="${check < 0}" var="red">
											<c:set var="check" value="${check = check * -1}"/>
											<font color="red">재고가 ${check}개 부족합니다.</font>
										</c:if>
									</td>
									<td rowspan="2" align="center" >
										<c:set var="sprice" value="${list1.PROD_PRICE * list3.PROD_COUNT}"/>
										<span id="sprice">
											<b><fmt:formatNumber value="${list1.PROD_PRICE}" pattern="#,###"/> 원</b>
										</span>
									</td>
								</tr>
								<tr valign="middle" id="tr2">
									<td align="right"><fmt:formatNumber value="${list1.PROD_PRICE}" pattern="#,###"/> 원</td>
									<td>
										<img src="../resources/images/left.png" width="30" height="30" name="leftbt">
										<input type="text" size=1 name="countNum" value="${list3.PROD_COUNT}" style="text-align:center" onchange="fn_onchangeProdCount(this)">
										<img src="../resources/images/right.png" width="30" height="30" name="rightbt">&nbsp;&nbsp;
										<c:set var="countNum" value="#{list3.PROD_COUNT}"/>
									</td>
								</tr>
								<c:set var="price" value="${price + sprice}"/>
							</table>
						</div>
						
						<br/><br/>
						<%-- </c:when> --%>
						
						<%-- <c:otherwise>
						
						<h5>
							<b>대여 상품</b>&nbsp;&nbsp;
							<input type="text" id="testDatepicker1"/> ~ <input type="text" id="testDatepicker2"/>&nbsp;&nbsp;
						</h5>
						<hr/>
						
						<div id="rental">
							<table class="table" id="table2">
								<colgroup>
									<col width="25%" />
									<col width="45%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<tr valign="middle"  id="tr1">
									<td rowspan="2">
										<input type="hidden" name="prodPrice" value="${list1.PROD_RPRICE}" />
										<img src="../resources/images/123.PNG" width="100" height="100">
									</td>
									<th>${list1.PROD_NAME }</th>
									<td id="tdStock">
										<c:set var="check" value="${list1.PROD_RSTOCK - list1.DAY_STOCK - temp.PROD_COUNT }"/>
										<c:if test="${check < 0}" var="red">
											<c:set var="check" value="${check = check * -1}"/>
											<font color="red">재고가 ${check}개 부족합니다.</font>
										</c:if>
									</td>
									<td rowspan="2" align="center" >
										<c:set var="sprice" value="${list1.PROD_RPRICE * temp.PROD_COUNT }"/>
										<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
										</span>
									</td>
								</tr>
								<tr valign="middle" id="tr2">
									<td align="right"><fmt:formatNumber value="${list1.PROD_RPRICE}" pattern="#,###"/> 원</td>
									<td>
										<img src="../resources/images/left.png" width="30" height="30" name="leftbt">
										<input type="text" size=1 name="countNum" value="${temp.PROD_COUNT }" style="text-align:center" onchange="fn_onchangeProdCount(this)">
										<img src="../resources/images/right.png" width="30" height="30" name="rightbt">&nbsp;&nbsp;
									</td>
								</tr>
								<c:set var="rprice" value="${rprice + sprice}"/>
							</table>
						</div>
						<br/><br/>
						
						</c:otherwise>
						</c:choose> --%>
						
						<h5><b>결제 정보</b></h5>
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">총 상품가격 </td>
								<td width="80%">
									<c:set var="totalPrice" value="${list1.PROD_PRICE}"/>
									<span id="totalPrice">
										<b><fmt:formatNumber value="${list1.PROD_PRICE}" pattern="#,###"/> 원</b>
									</span>
								</td>
							</tr>
							<tr> 
								<td align="right">배송비 </td>
								<td>
									<c:choose>
										<c:when test="${list3.MEMBER_RANK eq 1}">
											<c:set var="dprice" value="2500"/>
										</c:when>
										<c:otherwise>
											<c:set var="dprice" value="0"/>
										</c:otherwise>
									</c:choose>
										<fmt:formatNumber value="${dprice}" pattern="#,###"/> 원
										<input type="hidden" name="dprice" value="${dprice}">
								</td>
							</tr> 
							<tr> 
								<td align="right"><b>총 결제금액 </b></td>
								<td>
									<c:set var="lastPrice" value="${list1.PROD_PRICE + 2500}"/>
									<span id="lastPrice">
										<b><font color="red"><fmt:formatNumber value="${list1.PROD_PRICE + 2500}" pattern="#,###"/></font> 원</b>
									</span>
								</td>
							</tr>
							<tr>
								<td align="right">결제방식 </td>
								<td>
									<input type='radio' name='pay' value='카드 결제'/> 카드 결제&nbsp;&nbsp;&nbsp;&nbsp;
									<input type='radio' name='pay' value='무통장 입금'/> 무통장 입금&nbsp;&nbsp;&nbsp;&nbsp;
									<input type='radio' name='pay' value='휴대폰 결제'/> 휴대폰 결제
								</td>
							</tr> 
						</table>
						 
						<input type="hidden" id="in_totalPrice" value="${lastPrice}"/>
						<input type="hidden" id="in_dprice" value="${dprice}"/>
						<input type="hidden" name="lastPrice" value="${lastPrice}"/>
						<input type="hidden" name="member_name" value="${list3.MEMBER_NAME}"/>
						<input type="hidden" name="rcv_zoncode" value="${list3.MEMBER_ZONCODE}"/>
						<input type="hidden" name="rcv_address1" value="${list3.MEMBER_ADDRESS1}"/>
						<input type="hidden" name="rcv_address2" value="${list3.MEMBER_ADDRESS2}"/>
						<input type="hidden" name="dprice" value="2500"/>
						<input type="hidden" name="email" value="${list3.MEMBER_EMAIL}"/>
						<input type="hidden" name="rcv_name" value="${list3.MEMBER_NAME}"/>
						<input type="hidden" name="rcv_phone" value="${list3.MEMBER_PHONE1}"/>
						<input type="hidden" id="PROD_COUNT" name="PROD_COUNT" value="${countNum}"/>
						<input type="hidden" name="prod_num" value="${list3.PROD_NUM}"/>
						<br/><br/>
						 
						<div id="last">
							<center>
								<button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold; color:white; background-color: #dc3545;" class="btn btn-outline-danger" id="paybt">결제하기</button>
							</center>
						</div>

						
					</form>		
					</div>
				</section>
			</main>

	<style>
	    .menu a{cursor:pointer;}
	    .menu .hide{display:none;}
	    ul{
		   	list-style:none;
		   	padding-left:0px;
		  }
	</style>
	<!-- 배송지 -->
	
	<form id="commonForm" name="commonForm"></form>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
		$.datepicker.setDefaults({
			showOn:"both",
    		buttonImage:"../resources/images/calendar-icon.png",
    		buttonImageOnly:true,
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년',
	        minDate:"M+1",
	    });
		
		$("#testDatepicker1").datepicker();
		$("#testDatepicker2").datepicker();
		
		$("#testDatepicker1").datepicker('setDate',$("input#rental_start").val());
		$("#testDatepicker2").datepicker('setDate',$("input#rental_end").val());
	
	    $(document).ready(function(){
	        
	     	// 수령지 변경
	        $('button#changeAddress').on('click', function() {
	        	new daum.Postcode({
	                oncomplete: function(data) {
	                	document.getElementById("rcv_zoncode").value = data.zonecode;
	                	document.getElementById("rcv_address1").value = data.address;
	                	document.getElementById("rcv_address2").value = "";
	                }
	            }).open();
	        })
		    
		    // 수량 추가
	        $("img[name='rightbt']").on('click', function() {
	        	var index = $("img[name='rightbt']").index(this);
	        	var obj2 = document.getElementsByName('countNum');
	        	var obj3 = document.getElementsByName('prodPrice');
	        	var obj8 = document.getElementsByName('dprice');
	        	
	        	obj2[index].value =  parseInt(obj2[index].value) + 1;
	        	
	        	var countNum = obj2[index].value;
	        	var sprice = obj2[index].value * obj3[index].value;
	        	var totalPrice = obj2[index].value * obj3[index].value;
				var lastPrice = obj2[index].value * obj3[index].value + 2500;
				var obj4 = $('span#sprice').eq(index);
				var obj5 = $('span#totalPrice').eq(index);
				var obj6 = $('span#lastPrice').eq(index);
				obj4.html('<b>'+AddComma(sprice)+' 원</b>');
				obj5.html('<b>'+AddComma(totalPrice)+' 원</b>');
				obj6.html('<b><font color="red">'+AddComma(lastPrice)+' 원</font></b>');
				
				$('#PROD_COUNT').val(countNum);
				$('input[name=lastPrice]').val(lastPrice);
				$('#in_totalPrice').val(lastPrice);
	        });  
	        
	        // 수량 감소
	        $("img[name='leftbt']").on('click', function() {
	        	var index = $("img[name='leftbt']").index(this);
	        	var obj2 = document.getElementsByName('countNum');
	        	var obj3 = document.getElementsByName('prodPrice');
	        	var obj8 = document.getElementsByName('dprice');
	        	
	        	if (obj2[index].value > 1) {
	    			obj2[index].value =  parseInt(obj2[index].value) - 1;
	        	}

	        	var countNum = obj2[index].value;
				var sprice = obj2[index].value * obj3[index].value;
				var totalPrice = obj2[index].value * obj3[index].value;
				var lastPrice = obj2[index].value * obj3[index].value + 2500;
				var obj4 = $('span#sprice').eq(index);
				var obj5 = $('span#totalPrice').eq(index);
				var obj6 = $('span#lastPrice').eq(index);
				obj4.html('<b>'+AddComma(sprice)+' 원</b>');
				obj5.html('<b>'+AddComma(totalPrice)+' 원</b>');
				obj6.html('<b><font color="red">'+AddComma(lastPrice)+' 원</font></b>');
				
				$('#PROD_COUNT').val(countNum);
				$('input[name=lastPrice]').val(lastPrice);
				$('#in_totalPrice').val(lastPrice);
	        })
	         
	        // 결제하기
	        $('button#paybt').on('click', function() {
	        	if ($("input#isRental").val() == "false") {
	        		var index = 0;
	        	} else {
	        		var index = 1;
	        	}
	        	console.log(index);
	        	var obj2 = document.getElementsByName('countNum');
	        	console.log(obj2);
	        	console.log($("input[name='countNum']").val());
	        	console.log($("input#member_id").val());
	        	console.log($("input#rcv_name").val());
	        	console.log($("input#rcv_zoncode").val());
	        	console.log($("input#rcv_address1").val());
	        	console.log($("input#rcv_address2").val());
	        	console.log($("input#rcv_phone").val());
	        	console.log($('textarea#memo').val());
	        	console.log(${dprice});
	        	console.log(${totalPrice + 2500});
	        	console.log($("input[name='pay']:checked").val());
	        	
	        	if ($("input:radio[name='pay']").is(':checked')) {
	        		if ($("input[name='pay']:checked").val()=="카드 결제") {
	        			$.ajax({
			        		type: "POST",
			    			url: "<c:url value='/prod/orderPay2'/>",
			    			data:{MEMBER_ID:$("input#member_id").val(), ORDER_RCV_NAME:$("input[name='rcv_name']").val(),
			    				ORDER_RCV_ZONCODE:$("input#rcv_zoncode").val(), ORDER_RCV_ADDRESS1:$("input#rcv_address1").val(),
			    				ORDER_RCV_ADDRESS2:$("input#rcv_address2").val(),
			    				ORDER_RCV_PHONE:$("input[name='rcv_phone']").val(), ORDER_MEMO:$('textarea#memo').val(),
			    				ORDER_DPRICE:$("input#in_dprice").val(), ORDER_PRICE:$("input[name=lastPrice]").val(), 
			    				ORDER_PAYTYPE:$("input[name='pay']:checked").val(),
			    				RENTAL_START:$("#testDatepicker1").val(), RENTAL_END:$("#testDatepicker2").val(),
			    				PROD_COUNT:$("input[name=PROD_COUNT]").val(), PROD_NUM:$("input[name='prod_num']").val()},
			    			success: function(data){
			    				fn_openOrderPay();
			    			},
			    			error:function(request, error) {

			    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			    			}
			         	}); 
	        		} else {
	        			$.ajax({
			        		type: "POST",
			    			url: "<c:url value='/prod/orderTable2'/>",
			    			data:{MEMBER_ID:$("input#member_id").val(), ORDER_RCV_NAME:$("input[name='rcv_name']").val(),
			    				ORDER_RCV_ZONCODE:$("input#rcv_zoncode").val(), ORDER_RCV_ADDRESS1:$("input#rcv_address1").val(),
			    				ORDER_RCV_ADDRESS2:$("input#rcv_address2").val(),
			    				ORDER_RCV_PHONE:$("input[name='rcv_phone']").val(), ORDER_MEMO:$('textarea#memo').val(),
			    				ORDER_DPRICE:$("input#in_dprice").val(), ORDER_PRICE:$("input[name=lastPrice]").val(), 
			    				ORDER_PAYTYPE:$("input[name='pay']:checked").val(),
			    				RENTAL_START:$("#testDatepicker1").val(), RENTAL_END:$("input#rental_end").val(),
			    				PROD_COUNT:$("input[name=PROD_COUNT]").val(), PROD_NUM:$("input[name='prod_num']").val()},
			    			success: function(data){
			    				location.href="../prod/orderPaySuccess";
			    			},
			    			error:function(request, error) {

			    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			    			}
			         	});
	        		}
	        	} else {
	        		alert("결제방식을 선택해주세요!");
	        	}

	        })
	    });
	     
	    
	    function fn_openOrderPay(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../prod/orderPay2'/>");
			comSubmit.addParam("PROD_NUM", $("#PROD_NUM").val());
			comSubmit.submit();
		}
	    
	    // 수량 직접 변경
	    function fn_onchangeProdCount(obj) {
	    	var index = $("input[name='countNum']").index(obj);
	    	var obj2 = document.getElementsByName('cartNum');
	    	var comSubmit = new ComSubmit();
	    	console.log(obj.value);
	    	console.log(obj2[index].value);
	       	comSubmit.setUrl("<c:url value='/prod/orderUpdateProd' />"); 
	        comSubmit.addParam("PROD_COUNT", obj.value); 
	        comSubmit.addParam("CART_NUM", obj2[index].value); 
	        comSubmit.submit();
	    }

        function Popup() { window.open("refundForm.jsp", "a", "width=700, height=500, left=100, top=50 , resizable=no"); }
		
		function AddComma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			
			return num.toString().replace(regexp, ',');
		}
	</script>

	
</body>
</html>
