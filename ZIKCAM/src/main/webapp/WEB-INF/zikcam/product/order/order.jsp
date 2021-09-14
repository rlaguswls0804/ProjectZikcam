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
						
						<input type="hidden" id="member_id" name="member_id" value="${MEMBER_ID}"/>
						<input type="hidden" id="start_date" value="${start_date}"/>
						<input type="hidden" id="end_date" value="${end_date}"/>
						<input type="hidden" id="rental_start" value="${rental_start}"/>
						<input type="hidden" id="rental_end" value="${rental_end}"/>
						
						
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
								<td width="40%" colspan="2">
									<input type="text" style="width:375px" id="rcv_name" name="rcv_name" value="${list3.MEMBER_NAME}"/>
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
									<input type="text" id="rcv_phone" name="rcv_phone" value="${list3.MEMBER_PHONE1}"/>
								</td>
							</tr>
							<tr>
								<td align="right">배송 요청사항 </td>
								<td><textarea cols="50" rows="2" id="memo" name="memo" placeholder="배송 요청사항"></textarea></td> <td width="40%" valign="middle">
							</tr>
						</table>
						
						
						<!-- 장바구니 -->
						
						
						<c:choose>
						<c:when test="${list1.size() == 0 and list2.size() == 0}">
						<br/><br/><br/><br/>
						<div align="center">
							장바구니가 비었습니다.
							<br/><br/><br/><br/>
							<a href="../prod/main"><button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold;" class="btn btn-outline-danger">계속 쇼핑하기</button></a>
						</div>
						<br/><br/><br/><br/>
						</c:when>
						
						<c:otherwise>
						<br/><br/>
						
						<h5>
							<b>구매 상품</b>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-dgray active" id="allDelete1"></button>
						</h5>
						
						<hr/>
						 
						<div id="purchase">
						<c:choose>
						<c:when test="${list1.size() == 0}">
						<br/><br/><br/><br/>
						<div align="center">
							장바구니에 담은 상품이 없습니다.
						</div>
						<br/><br/><br/><br/>
						<hr/>
						<br/><br/>
						</c:when>
						<c:otherwise>
							
						<table class="table" id="table1">
							<colgroup>
								<col width="5%" />
								<col width="20%" />
								<col width="40%" />
								<col width="20%" />
								<col width="15%" />
							</colgroup>
							<tr align="center" bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<!-- 버튼을 눌렀을때 하단 모든 체크박스 선택 -->
								<td colspan="2" align="left"><input type="checkbox" id="checkAll1">&nbsp;&nbsp;&nbsp;<b>전체 선택</b></td>
								<th colspan="2">상품 정보</th>
								<th>상품 가격</th>
							</tr>
								<c:forEach items="${list1}" var="mylist1">
									<tr valign="middle" id="tr1">
										<td rowspan="2"> 
											<input type="hidden" name="cartNum" value="${mylist1.CART_NUM}" />
											<input type="hidden" name="prodPrice" value="${mylist1.PROD_PRICE}" />
											<input type="hidden" name="cartDel1" value="${mylist1.CART_DEL}" />
											<input type="hidden" name="prodStock" value="${mylist1.PROD_STOCK}" />
											<input type="hidden" name="prodname" value="${mylist1.PROD_NAME }" />
											<input type="checkbox" id=cb name="cb1">
										</td>
										<td rowspan="2"><div class="gdsDes">${mylist1.PROD_THUMB }</div></td>
										<th>${mylist1.PROD_NAME }</th>
										<td id="tdStock1">
											<c:set var="check" value="${mylist1.PROD_STOCK - mylist1.PROD_COUNT }"/>
											<c:if test="${check < 0}" var="red">
												<c:set var="check" value="${check = check * -1}"/>
												<font color="red">재고가 ${check}개 부족합니다.</font>
											</c:if>
										</td>
										<td rowspan="2" align="center" >
											<c:set var="sprice" value="${mylist1.PROD_PRICE * mylist1.PROD_COUNT }"/>
											<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
											</span>
										</td>
									</tr>
									<tr valign="middle" id="tr2">
										<td align="right"><fmt:formatNumber value="${mylist1.PROD_PRICE}" pattern="#,###"/> 원</td>
										<td>
											<img src="../resources/images/left.png" width="30" height="30" name="leftbt">
											<input type="text" size=1 name="countNum" value="${mylist1.PROD_COUNT }" style="text-align:center" onchange="fn_onchangeProdCount(this)">
											<img src="../resources/images/right.png" width="30" height="30" name="rightbt">&nbsp;&nbsp;
											<img src="../resources/images/xbt.png" width="30" height="30" name="xbt">
										</td>
									</tr>
								</c:forEach>
							<tr align="center" style="border-collapse: collapse; outline: 0; border: 0;">
								<td colspan="4">
									<c:set var="price" value="${sum.PRICE}"/>
								</td>
								<td id="td_price"><b>총 <font color="red"><fmt:formatNumber value="${price}" pattern="#,###"/> </font> 원</b></td>
							</tr>

						</table>

						<br/><br/>
						</c:otherwise>
						</c:choose>
						</div>
						
						<div id="rental_title"></div>
						
						<h5>
							<b>대여 상품</b>&nbsp;&nbsp;
							
							<input type="text" id="testDatepicker1" name="rental_start" value="${rental_start}" readonly="readonly"/> ~ <input type="text" id="testDatepicker2" name="rental_end" value="${rental_end}" readonly="readonly"/>&nbsp;&nbsp;
							
							<button type="button" class="btn btn-outline-dgray active" id="allDelete2"></button> 
						</h5>
						<hr/>
						 
						<div id="rental">
						<c:choose>
						<c:when test="${list2.size() == 0}">
						<br/><br/><br/><br/>
						<div align="center">
							대여할 상품이 없습니다.
						</div>
						<br/><br/><br/><br/>
						<hr/>
						<br/><br/>
						</c:when>
						<c:otherwise>

						<table class="table" id="table2">
							<colgroup>
								<col width="5%" />
								<col width="20%" />
								<col width="40%" />
								<col width="20%" />
								<col width="15%" />
							</colgroup>
							<tr align="center" bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<!-- 버튼을 눌렀을때 하단 모든 체크박스 선택 -->
								<td colspan="2" align="left"><input type="checkbox" id="checkAll2" >&nbsp;&nbsp;&nbsp;<b>전체 선택</b></td>
								<th colspan="2">상품 정보</th>
								<th>상품 가격</th>
							</tr>
								<c:forEach items="${list2}" var="mylist2">
									<tr valign="middle"  id="tr1">
										<td rowspan="2">
											<input type="hidden" name="cartNum" value="${mylist2.CART_NUM}" />
											<input type="hidden" name="prodPrice" value="${mylist2.PROD_RPRICE}" />
											<input type="hidden" name="cartDel2" value="${mylist2.CART_DEL}" />
											<input type="checkbox" id=cb name="cb2">
										</td>
										<td rowspan="2"><div class="gdsDes">${mylist2.PROD_THUMB }</div></td>
										<th>${mylist2.PROD_NAME }</th>
										<td id="tdStock2">
											<c:set var="check" value="${mylist2.REAL_STOCK - mylist2.DAY_STOCK - mylist2.PROD_COUNT }"/>
											<c:if test="${check < 0}" var="red">
												<c:set var="check" value="${check = check * -1}"/>
												<font color="red">재고가 ${check}개 부족합니다.</font>
											</c:if>
										</td>
										<td rowspan="2" align="center" >
											<c:set var="sprice" value="${mylist2.PROD_RPRICE * mylist2.PROD_COUNT }"/>
											<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
											</span>
										</td>
									</tr>
									<tr valign="middle" id="tr2">
										<td align="right"><fmt:formatNumber value="${mylist2.PROD_RPRICE}" pattern="#,###"/> 원</td>
										<td>
											<img src="../resources/images/left.png" width="30" height="30" name="leftbt">
											<input type="text" size=1 name="countNum" value="${mylist2.PROD_COUNT }" style="text-align:center" onchange="fn_onchangeProdCount(this)">
											<img src="../resources/images/right.png" width="30" height="30" name="rightbt">&nbsp;&nbsp;
											<img src="../resources/images/xbt.png" width="30" height="30" name="xbt">
										</td>
									</tr>
								</c:forEach>
							<tr align="center" style="border-collapse: collapse; outline: 0; border: 0;">
								<td colspan="4">
									<c:set var="rprice" value="${sum.RPRICE}"/>
								</td>
								<td id="td_rprice"><b>총 <font color="red"><fmt:formatNumber value="${rprice}" pattern="#,###"/> </font> 원</b></td>
							</tr>

						</table>
						
						<br/><br/> 
						</c:otherwise>
						</c:choose>
						</div>
						
						</c:otherwise>
						</c:choose>
	
						
						<h5><b>결제 정보</b></h5>
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">총 상품가격 </td>
								<td width="80%" id="totalPrice">
									<c:set var="totalPrice" value="${price + rprice}"/>
									<fmt:formatNumber value="${totalPrice}" pattern="#,###"/> 원
								</td>
							</tr>
							<tr>
								<td align="right">배송비 </td>
								<td id="dprice">
									<c:choose>
										<c:when test="${list3.MEMBER_RANK eq 1}">
											<c:set var="dprice" value="2500"/>
										</c:when>
										<c:otherwise>
											<c:set var="dprice" value="0"/>
										</c:otherwise>
									</c:choose>
									<fmt:formatNumber value="${dprice}" pattern="#,###"/> 원
								</td>
							</tr>
							<tr>
								<td align="right"><b>총 결제금액 </b></td>
								<td id="lastPrice">
									<c:set var="lastPrice" value="${totalPrice + dprice}"/>
									<b><font color="red"><fmt:formatNumber value="${lastPrice}" pattern="#,###"/></font> 원</b>
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
						
						<input type="hidden" id="in_totalPrice" value="${totalPrice}"/>
						<input type="hidden" id="in_dprice" value="${dprice}"/>
						<input type="hidden" name="lastPrice" value="${lastPrice}"/>
						<input type="hidden" name="member_name" value="${list3.MEMBER_NAME}"/>
						<input type="hidden" name="rcv_zoncode" value="${list3.MEMBER_ZONCODE}"/>
						<input type="hidden" name="rcv_address1" value="${list3.MEMBER_ADDRESS1}"/>
						<input type="hidden" name="rcv_address2" value="${list3.MEMBER_ADDRESS2}"/>
						<input type="hidden" name="dprice" value="${dprice}"/>
						<input type="hidden" name="email" value="${list3.MEMBER_EMAIL}"/>
						
						<br/><br/>
						
						<div id="last" align="center">
							<button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold; color:white; background-color: #dc3545;" class="btn btn-outline-danger" id="paybt">결제하기</button>
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
		
		$("#testDatepicker1").datepicker('setDate',$('input#rental_start').val());
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
	    	
	        var cartDel1 = document.getElementsByName('cartDel1');
			var cartDel2 = document.getElementsByName('cartDel2');
			
			var table1 = $('#table1').find('input[name=cb1]').length;
			var table2 = $('#table2').find('input[name=cb2]').length;
			
			for (var i = 0; i < table1; i++) {
				if (cartDel1[i].value == false) {
					$("input[name=cb1]").eq(i).prop("checked",true);
				}
			}
			
			for (var i = 0; i < table2; i++) {
				if (cartDel2[i].value == false) {
					$("input[name=cb2]").eq(i).prop("checked",true);
				}
			}
			
			if($("input[name=cb1]").length == $("input[name=cb1]").filter(":checked").length){
	        	$("#checkAll1").prop("checked",true);
	        } else {
	        	$("#checkAll1").prop("checked",false);
	        }

	        if($("input[name=cb2]").length == $("input[name=cb2]").filter(":checked").length){
	        	$("#checkAll2").prop("checked",true);
	        } else {
	        	$("#checkAll2").prop("checked",false);
	        }
	        
	        if($("#checkAll1").prop("checked")){
	        	$('button#allDelete1').html('전체 삭제');
	        } else {
	        	$('button#allDelete1').html('선택 삭제');
	        }
	        
	        if($("#checkAll2").prop("checked")){
	        	$('button#allDelete2').html('전체 삭제');
	        } else {
	        	$('button#allDelete2').html('선택 삭제');
	        }
	        
	        fn_stockCheck();
			
			// 구매 전체 선택
		    $("#checkAll1").on('click', function() {
				var cartNum = $("#table1 input[name=cartNum]");
				var table = $('#table1').find('input[name=cb1]').length;
	        	
		        if($("#checkAll1").prop("checked")){
		        	var del = 0;
		            $("input[name=cb1]").prop("checked",true);
		            $('button#allDelete1').html('전체 삭제');
		        }else{
		        	var del = 1;
		            $("input[name=cb1]").prop("checked",false);
		            $('button#allDelete1').html('선택 삭제');
		        }
		        
		        for (var i = 0; i < table; i++) {
		        	var cartNumber = parseInt(cartNum.eq(i).val());
		        	
					$.ajax({
		    			type: "POST",
		    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
		    			data:{CART_NUM:cartNumber, CART_DEL:del},
		    			dataType : 'json',
		    			success: function(data){
		    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
		    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
		    				
		    				var rank = $('input#member_rank').val();
		    				var totalPrice = data.PRICE+data.RPRICE;
		    				
		    				if (totalPrice >= 1000000) {
		    					var dprice = 0;
		    				} else {
		    					if (rank == 0) {
		    						var dprice = 0;
		    					}
		    					else {
		    						var dprice = 2500;
		    					}
		    				}
		    				
		    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
			    			$('td#dprice').html(AddComma(dprice)+" 원");
			    			$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
			    			
			    			$('#in_totalPrice').val(totalPrice);
		    				$('#in_dprice').val(dprice);
		    				
		    				fn_stockCheck();
		    			}	
		            });
				}
		    })
		    
		    // 대여 전체 선택
		    $("#checkAll2").on('click', function() {
		    	var cartNum = $("#table2 input[name=cartNum]");
				var table = $('#table2').find('input[name=cb2]').length;
				
		        if($("#checkAll2").prop("checked")){
		        	var del = 0;
		            $("input[name=cb2]").prop("checked",true);
		            $('button#allDelete2').html('전체 삭제');
		        }else{
		        	var del = 1;
		            $("input[name=cb2]").prop("checked",false);
		            $('button#allDelete2').html('선택 삭제');
		        }
		        
		        for (var i = 0; i < table; i++) {
		        	var cartNumber = parseInt(cartNum.eq(i).val());
		        	
					$.ajax({
		    			type: "POST",
		    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
		    			data:{CART_NUM:cartNumber, CART_DEL:del},
		    			dataType : 'json',
		    			success: function(data){
		    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
		    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
		    				
		    				var rank = $('input#member_rank').val();
		    				var totalPrice = data.PRICE+data.RPRICE;
		    				
		    				if (totalPrice >= 1000000) {
		    					var dprice = 0;
		    				} else {
		    					if (rank == 0) {
		    						var dprice = 0;
		    					}
		    					else {
		    						var dprice = 2500;
		    					}
		    				}
		    				
		    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
			    			$('td#dprice').html(AddComma(dprice)+" 원");
			    			$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
			    			
			    			$('#in_totalPrice').val(totalPrice);
		    				$('#in_dprice').val(dprice);
		    				
		    				fn_stockCheck();
		    			}	
		            });
				}
		    })
		    
		    // 개별 선택
		    $("input[name=cb1]").on('click', function() {
		    	var index = $("input[id='cb']").index(this);
	        	var obj = document.getElementsByName('cartNum');
	        	
	        	if($(this).prop("checked")){
	        		var del = 0;
	        	} else {
	        		var del = 1;
	        	}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
	    			data:{CART_NUM:obj[index].value, CART_DEL:del},
	    			dataType : 'json',
	    			success: function(data){
	    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				
	    		        $('td#totalPrice').html(AddComma(totalPrice)+" 원");
		    			$('td#dprice').html(AddComma(dprice)+" 원");
		    			$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
		    			
		    			$('#in_totalPrice').val(totalPrice);
	    				$('#in_dprice').val(dprice);
	    				
	    				fn_stockCheck();
	    			}

	            });
	        	
		        if($("input[name=cb1]").length == $("input[name=cb1]").filter(":checked").length){
		        	$("#checkAll1").prop("checked",true);
		        	$('button#allDelete1').html('전체 삭제');
		        } else {
		        	$("#checkAll1").prop("checked",false);
		        	$('button#allDelete1').html('선택 삭제');
		        }
		    })
		    
		    $("input[name=cb2]").on('click', function() {
		    	var index = $("input[id='cb']").index(this);
	        	var obj = document.getElementsByName('cartNum');
	        	
	        	if($(this).prop("checked")){
	        		var del = 0;
	        	} else {
	        		var del = 1;
	        	}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdateDel'/>",
	    			data:{CART_NUM:obj[index].value, CART_DEL:del},
	    			dataType : 'json',
	    			success: function(data){
	    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
		    			$('td#dprice').html(AddComma(dprice)+" 원");
		    			$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
		    			
		    			$('#in_totalPrice').val(totalPrice);
	    				$('#in_dprice').val(dprice);
	    				
	    				fn_stockCheck();
	    			}
	            });
	        	
		        if($("input[name=cb2]").length == $("input[name=cb2]").filter(":checked").length){
		        	$("#checkAll2").prop("checked",true);
		        	$('button#allDelete2').html('전체 삭제');
		        } else {
		        	$("#checkAll2").prop("checked",false);
		        	$('button#allDelete2').html('선택 삭제');
		        }
		    })
		    
		    // 수량 추가
	        $("img[name='rightbt']").on('click', function() {
	        	var index = $("img[name='rightbt']").index(this);
	        	var obj1 = document.getElementsByName('cartNum');
	        	var obj2 = document.getElementsByName('countNum');
	        	var obj3 = document.getElementsByName('prodPrice');
	        	
	        	obj2[index].value =  parseInt(obj2[index].value) + 1;
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdate'/>",
	    			data:{CART_NUM:obj1[index].value, PROD_COUNT:obj2[index].value},
	    			dataType : 'json',
	    			success: function(data){
	    				var sprice = obj2[index].value * obj3[index].value;
	    				var obj4 = $('span#sprice').eq(index);
	    				obj4.html('<b>'+AddComma(sprice)+' 원</b>');
	    				
	    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
	    				$('td#dprice').html(AddComma(dprice)+" 원");
	    				$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
	    				
	    				$('#in_totalPrice').val(totalPrice);
	    				$('#in_dprice').val(dprice);
	    				
	    				fn_stockCheck();
	    			}	
	            });
	        })
	        
	        // 수량 감소
	        $("img[name='leftbt']").on('click', function() {
	        	var index = $("img[name='leftbt']").index(this);
	        	var obj1 = document.getElementsByName('cartNum');
	        	var obj2 = document.getElementsByName('countNum');
	        	var obj3 = document.getElementsByName('prodPrice');
	        	
	        	if (obj2[index].value > 1) {
	    			obj2[index].value =  parseInt(obj2[index].value) - 1;
	        	}
	    		
	    		$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartUpdate'/>",
	    			data:{CART_NUM:obj1[index].value, PROD_COUNT:obj2[index].value},
	    			dataType : 'json',
	    			success: function(data){
	    				var sprice = obj2[index].value * obj3[index].value;
	    				var obj4 = $('span#sprice').eq(index);
	    				obj4.html('<b>'+AddComma(sprice)+' 원</b>');
	    				
	    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
	    				$('td#dprice').html(AddComma(dprice)+" 원");
	    				$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
	    				
	    				$('#in_totalPrice').val(totalPrice);
	    				$('#in_dprice').val(dprice);
	    				
	    				fn_stockCheck();
	    			}	
	            });
	        })
	        
	        // 개별 상품 삭제
	        $("img[name='xbt']").on('click', function() {
	        	var index = $("img[name='xbt']").index(this);
	        	var obj = document.getElementsByName('cartNum');
	        	
	        	$.ajax({
	    			type: "POST",
	    			url:"<c:url value='/myPage/myCartOneDelete'/>",
	    			data:{CART_NUM:obj[index].value},
	    			success: function(data){
	    				
	    				$('tr#tr1').eq(index).remove();
	    				$('tr#tr2').eq(index).remove();
	    				
	    				var cartDel1 = document.getElementsByName('cartDel1');
	    				var cartDel2 = document.getElementsByName('cartDel2');
	    				if (cartDel1.length == 0) {
	    					$('div#purchase').html("<br/><br/><br/><br/><div><center>대여할 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    				}
						if (cartDel2.length == 0) {
							$('div#rental').html("<br/><br/><br/><br/><div><center>대여할 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    				}
						
						$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				$('div#div_total').html("총 상품가격&nbsp;&nbsp;<font color='red'><b>"+AddComma(totalPrice)+"</b></font> 원&nbsp;&nbsp;+&nbsp;&nbsp;" +
								"총 배송비&nbsp;&nbsp;<b>"+AddComma(dprice)+"</b> 원&nbsp;&nbsp;=&nbsp;&nbsp;" +
								"<b>총 주문금액&nbsp;&nbsp;<font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
	    				
	    				fn_stockCheck();
	    			}	
	            });
	        })
	        
	        // 구매 상품 삭제
	        $('button#allDelete1').on('click', function() {
	        	var cartNum = $("#table1 input[name=cartNum]");
	        	var cartNum2 = document.getElementsByName('cartNum');
	        	var table = $('#table1').find('input[name=cb1]').length;
	        	var success = table;
	        	var list = [];
	        	var index = [];
	        	var cartNum3 = [];
	        	
	        	for (var i = 0; i < cartNum2.length; i++){
	        		cartNum3.push(parseInt(cartNum2[i].value));
	        	}
	        	
	        	for (var i = 0; i < table; i++) {
	        		if($('input[name=cb1]').eq(i).prop("checked")){
			        	var cartNumber = parseInt(cartNum.eq(i).val());
			        	list.push({CART_NUM:cartNumber});
			        	index.push(cartNum3.indexOf(cartNumber));
			        	success = success - 1;
					}
				}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url: "<c:url value='/myPage/myCartDelete'/>",
	    			data: JSON.stringify(list),
	    			contentType: 'application/json; charset=utf-8',
	    			success: function(data){
	    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
	    				$('td#dprice').html(AddComma(dprice)+" 원");
	    				$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
	    				
	    				$('#in_totalPrice').val(totalPrice);
	    				$('#in_dprice').val(dprice);
	    				
	    				if (success == 0) {
	    	        		$('div#purchase').html("<br/><br/><br/><br/><div><center>대여할 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    	        	} else {
	    	        		for (var i = index.length - 1; i >= 0; i--) {
	    	        			$('tr#tr1').eq(index[i]).remove();
			    				$('tr#tr2').eq(index[i]).remove();
	    	        		}
	    	        	}
	    				
	    				fn_stockCheck();
	    			}
	            });
	        })
	        
	        // 대여 상품 삭제
	        $('button#allDelete2').on('click', function() {
	        	var cartNum = $("#table2 input[name=cartNum]");
	        	var cartNum2 = document.getElementsByName('cartNum');
	        	var table = $('#table2').find('input[name=cb2]').length;
	        	var success = table;
	        	var list = [];
	        	var index = [];
	        	var cartNum3 = [];
	        	
	        	for (var i = 0; i < cartNum2.length; i++){
	        		cartNum3.push(parseInt(cartNum2[i].value));
	        	}
	        	
	        	for (var i = 0; i < table; i++) {
	        		if($('input[name=cb2]').eq(i).prop("checked")){
			        	var cartNumber = parseInt(cartNum.eq(i).val());
			        	list.push({CART_NUM:cartNumber});
			        	index.push(cartNum3.indexOf(cartNumber));
			        	success = success - 1;
					}
				}
	        	
	        	$.ajax({
	    			type: "POST",
	    			url: "<c:url value='/myPage/myCartDelete'/>",
	    			data: JSON.stringify(list),
	    			contentType: 'application/json; charset=utf-8',
	    			success: function(data){
	    				$('td#td_price').html("<b>총 <font color='red'>"+AddComma(data.PRICE)+"</font> 원</b>");
	    				$('td#td_rprice').html("<b>총 <font color='red'>"+AddComma(data.RPRICE)+"</font> 원</b>");
	    				
	    				var rank = $('input#member_rank').val();
	    				var totalPrice = data.PRICE+data.RPRICE;
	    				
	    				if (totalPrice >= 1000000) {
	    					var dprice = 0;
	    				} else {
	    					if (rank == 0) {
	    						var dprice = 0;
	    					}
	    					else {
	    						var dprice = 2500;
	    					}
	    				}
	    				
	    				$('td#totalPrice').html(AddComma(totalPrice)+" 원");
	    				$('td#dprice').html(AddComma(dprice)+" 원");
	    				$('td#lastPrice').html("<b><font color='red'>"+AddComma(totalPrice+dprice)+"</font> 원</b>");
	    				
	    				$('#in_totalPrice').val(totalPrice);
	    				$('#in_dprice').val(dprice);
	    				
	    				if (success == 0) {
	    	        		$('div#rental').html("<br/><br/><br/><br/><div><center>대여할 상품이 없습니다.</center></div><br/><br/><br/><br/><hr/><br/><br/>");
	    	        	} else {
	    	        		for (var i = index.length - 1; i >= 0; i--) {
	    	        			$('tr#tr1').eq(index[i]).remove();
			    				$('tr#tr2').eq(index[i]).remove();
	    	        		}
	    	        	}
	    				
	    				fn_stockCheck();
	    			}
	            });
	        })
	        
	        // 결제하기
	        $('button#paybt').on('click', function() {
	        	console.log($("input#member_id").val());
	        	console.log($("input#rcv_name").val());
	        	console.log($("input#rcv_zoncode").val());
	        	console.log($("input#rcv_address1").val());
	        	console.log($("input#rcv_address2").val());
	        	console.log($("input#rcv_phone").val());
	        	console.log($('textarea#memo').val());
	        	console.log($("input#in_dprice").val());
	        	console.log($("input#in_totalPrice").val());
	        	console.log($("input[name='pay']:checked").val());
	        	
	        	// 대여 기간이 공백일때
	        	console.log("111");
		        if ($("#testDatepicker1").val() == "" || $("#testDatepicker2").val() == "") {
		        	$("#rental_title").html("<font color='red'> * 대여할 기간을 선택해주세요.</font><br>");
		        	document.getElementById('testDatepicker1').focus();
		        		
		        	if($("#testDatepicker1").val() != "") {
		        		document.getElementById('testDatepicker2').focus();
		        	}
		        } else {
		        	// 종료일이 시작일보다 앞설때
		        	console.log("222");
		        	var date1 = new Date($("#testDatepicker1").datepicker("getDate"));
			        var date2 = new Date($("#testDatepicker2").datepicker("getDate"));
			            
			        console.log(date1);
			        console.log(date2);
			            
			        if (date1 >= date2) {
			            $("#rental_title").html("<font color='red'> * 대여 종료일은 대여 시작일 다음날부터 선택가능합니다.</font><br>");
			            document.getElementById('testDatepicker1').focus();
			        } else {
			        	// 재고 체크
			        	console.log("333");
			            $.ajax({
			    			type: "POST",
			    			url:"<c:url value='/myPage/purchaseInvenCheck'/>",
			    			dataType : 'json',
			    			success: function(data){
			    				var stockCheck = true;
			    				
			    				$.each(data,function(index,item){
			    					var check = item.PROD_STOCK - item.PROD_COUNT;
			    					
			    					if (item.CART_DEL == 0) {
			    						if (check < 0) {
			    							stockCheck = false;
			        						check = -1 * check;
			        						$('td#tdStock1').eq(index).html("<font color='red'>재고가 " + check + "개 부족합니다.</font>");
			        					} else {
			        						$('td#tdStock1').eq(index).html("");
			        					}
			    					} else {
			    						$('td#tdStock1').eq(index).html("");
			    					}
			    				});
			    				console.log("444");
			    				var rental_start =  new Date($.datepicker.formatDate("yy-mm-dd",$("#testDatepicker1").datepicker("getDate")));
			    	        	var rental_end =  new Date($.datepicker.formatDate("yy-mm-dd",$("#testDatepicker2").datepicker("getDate")));
			    	        	
			    	        	$.ajax({ 
			    	    			type: "POST",
			    	    			url:"<c:url value='/myPage/rentalInvenCheck'/>",
			    	    			data:{RENTAL_START:rental_start, RENTAL_END:rental_end},
			    	    			dataType : 'json',
			    	    			success: function(data){
			    	    				$.each(data,function(index,item){
			    	    					if (item.DAY_STOCK == null) {
			    	    						var day_stock = 0;
			    	    					} else {
			    	    						var day_stock = item.DAY_STOCK;
			    	    					}
			    	    					
			    	    					var check = item.REAL_STOCK - day_stock - item.PROD_COUNT;
			    	    					
			    	    					if (item.CART_DEL == 0) {
			    	    						if (check < 0) {
			    	    							stockCheck = false;
			    	        						check = -1 * check;
			    	        						$('td#tdStock2').eq(index).html("<font color='red'>재고가 " + check + "개 부족합니다.</font>");
			    	        					} else {
			    	        						$('td#tdStock2').eq(index).html("");
			    	        					}
			    	    					} else {
			    	    						$('td#tdStock2').eq(index).html("");
			    	    					}
			    	    				});
			    	    				
			    	    				if (stockCheck == false) {
			    			        		alert('재고가 부족한 상품이 있습니다.');
			    			        	} else {
			    			        		if ($("input#in_totalPrice").val() == 0) {
			    				        		alert("구매 할 상품이 없습니다!");
			    				        	} else {
			    				        		if ($("input:radio[name='pay']").is(':checked')) {
			    					        		if ($("input[name='pay']:checked").val()=="카드 결제") {
			    					        			$.ajax({
			    							        		type: "POST",
			    							    			url: "<c:url value='/prod/orderPay'/>",
			    							    			data:{MEMBER_ID:$("input#member_id").val(), ORDER_RCV_NAME:$("input#rcv_name").val(),
			    							    				ORDER_RCV_ZONCODE:$("input#rcv_zoncode").val(), ORDER_RCV_ADDRESS1:$("input#rcv_address1").val(),
			    							    				ORDER_RCV_ADDRESS2:$("input#rcv_address2").val(),
			    							    				ORDER_RCV_PHONE:$("input#rcv_phone").val(), ORDER_MEMO:$('textarea#memo').val(),
			    							    				ORDER_DPRICE:$("input#in_dprice").val(), ORDER_PRICE:$("input#in_totalPrice").val(), 
			    							    				ORDER_PAYTYPE:$("input[name='pay']:checked").val(),
			    							    				RENTAL_START:$("#testDatepicker1").val(), RENTAL_END:$("#testDatepicker2").val()},
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
			    							    			url: "<c:url value='/prod/orderTable'/>",
			    							    			data:{MEMBER_ID:$("input#member_id").val(), ORDER_RCV_NAME:$("input#rcv_name").val(),
			    							    				ORDER_RCV_ZONCODE:$("input#rcv_zoncode").val(), ORDER_RCV_ADDRESS1:$("input#rcv_address1").val(),
			    							    				ORDER_RCV_ADDRESS2:$("input#rcv_address2").val(),
			    							    				ORDER_RCV_PHONE:$("input#rcv_phone").val(), ORDER_MEMO:$('textarea#memo').val(),
			    							    				ORDER_DPRICE:$("input#in_dprice").val(), ORDER_PRICE:$("input#in_totalPrice").val(), 
			    							    				ORDER_PAYTYPE:$("input[name='pay']:checked").val(),
			    							    				RENTAL_START:$("#testDatepicker1").val(), RENTAL_END:$("input#rental_end").val()},
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
			    				        	}
			    			        	}
			    	    			}
			    	        	});
			    			}
			        	});
			        }
		        }
	        })
	    });
	    
	    
		
	    
	    function fn_openOrderPay(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../prod/orderPay'/>");
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
		
		function fn_stockCheck(){
			$.ajax({
    			type: "POST",
    			url:"<c:url value='/myPage/purchaseInvenCheck'/>",
    			dataType : 'json',
    			success: function(data){
    				$.each(data,function(index,item){
    					var check = item.PROD_STOCK - item.PROD_COUNT;
    					
    					if (item.CART_DEL == 0) {
    						if (check < 0) {
        						check = -1 * check;
        						$('td#tdStock1').eq(index).html("<font color='red'>재고가 " + check + "개 부족합니다.</font>");
        					} else {
        						$('td#tdStock1').eq(index).html("");
        					}
    					} else {
    						$('td#tdStock1').eq(index).html("");
    					}
    				});
    			}
        	});
			
			var rental_start = new Date($.datepicker.formatDate("yy-mm-dd",$("#testDatepicker1").datepicker("getDate")));
        	var rental_end = new Date($.datepicker.formatDate("yy-mm-dd",$("#testDatepicker2").datepicker("getDate")));
        	
        	$.ajax({
    			type: "POST",
    			url:"<c:url value='/myPage/rentalInvenCheck'/>",
    			data:{RENTAL_START:rental_start, RENTAL_END:rental_end},
    			dataType : 'json',
    			success: function(data){
    				$.each(data,function(index,item){
    					if (item.DAY_STOCK == null) {
    						var day_stock = 0;
    					} else {
    						var day_stock = item.DAY_STOCK;
    					}
    					
    					var check = item.REAL_STOCK - day_stock - item.PROD_COUNT;
    					
    					if (item.CART_DEL == 0) {
    						if (check < 0) {
        						check = -1 * check;
        						$('td#tdStock2').eq(index).html("<font color='red'>재고가 " + check + "개 부족합니다.</font>");
        					} else {
        						$('td#tdStock2').eq(index).html("");
        					}
    					} else {
    						$('td#tdStock2').eq(index).html("");
    					}
    				});
    			}
        	});
		}
		 
	</script>

	
</body>
</html>
