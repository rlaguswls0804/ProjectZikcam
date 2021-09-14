<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <style type="text/css">
			.gdsDes img { max-width: 100%; max-height: 309px; width:auto; height:auto; border-top-left-radius: calc(0.25rem - 1px);
    		border-top-right-radius: calc(0.25rem - 1px);}
			.center { 
				position: absolute; /* */
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
				width: 48%;
				height: 59%; 
				}
		</style>
    </head>
    <body>
        
        <hr />
        <!-- Header-->
        <!-- <header class="bg-dark py-5"> -->
        <!-- <header background-image src="images/CampGrounds.jpeg"> -->
        <header class="bg-dark py-5" style="background-image : url('../resources/images/CampGrounds_California_5.jpg'); object-fit: contain">
        	<!-- <style>
                h {
                background-image : url("images/CampGround.jpg");
                }
            </style> -->
        	<!-- <img class="CampGround" src="images/CampGround.jpg" style='height: 100%; width: 100%; object-fit: contain'/> -->
         
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- <image src="images/CampGround.jpg" style='/* height: 100%; width: 100%;  */object-fit: contain'> -->
                	<c:forEach items="${oneProductList}" var="product">
                	<c:choose>
	                        		<c:when test="${product.PROD_CATEGORY eq '기타'}"><h1 class="display-4 fw-bolder">기타 용품 구매</h1></c:when>
	                        		<c:otherwise><h1 class="display-4 fw-bolder"><c:out value="${product.PROD_CATEGORY}" />&nbsp; 구매</h1></c:otherwise>
                    </c:choose>
                	<%-- <h1 class="display-4 fw-bolder"><c:out value="${product.PROD_CATEGORY}" />&nbsp; 구매</h1> --%>
                	</c:forEach>
                </div>
            </div>
            
            
        </header>
        
        
        <div class="text-center text-dark">
                <h4 class="display-5 fw-bolder" style="color:#4b4b4b"><br />대표 상품</h4>
        </div>
        
  <!--       <input type='button' class='btn' name='btn' value='버튼' style="float: right;">
 -->
 		
 		<input type="hidden" id="MEMBER_ID" value="${session_MEM_ID}">
 		<input type='hidden' id='PROD_COUNT' value="1">
        <input type='hidden' id='CART_RENTAL' value="0">
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                   
                    <c:forEach items="${mainProductList}" var="product">
                    	<div class="col mb-5">
	                        <div class="card h-100">
	                        	<div class="badge text-white position-absolute" style="top: 0.3rem; left: 0.3rem;">
	                        	<%-- <img id="image" onclick="changeImage()" border="0" 
	                        	<c:choose>
	                        		<c:when test="${product.PROD_CONTIMAGE eq '4'}">src="./images/heart_empty.png"</c:when>
	                        		<c:otherwise>src="./images/heart_full.png"</c:otherwise>
	                        	</c:choose>
	                        	width="30" height="30"/> --%>
	                        	&nbsp;조회수 : ${product.PROD_HITCOUNT} 
	                        	</div>
	                            <!-- Product image-->
	                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder"><c:out value="${product.PROD_NAME }" /></h5>
	                                    <!-- Product price-->
	                                    가격 : <c:out value="${product.PROD_PRICE}" /> 원
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">기타 용품 구매하기</a></div>
	                                <%-- <%=request.getRealPath("/") %> --%>
	                            </div>
	                        </div>
	                    </div>
	                    
                    	
        			</c:forEach>
                    
                </div>
            </div>
        </section>
        <!-- 대표 상품 -->


			<hr>
        
        <!-- 기준별 정렬(인기 순, 가격 순 등.) -->
        <div style="width:40%; float:right; border-color:black; font-size:1em;">
			
			<c:forEach items="${oneProductList}" var="product">
                	<c:choose>
	                        		<c:when test="${product.PROD_CATEGORY eq '텐트/타프'}">
										<a href="/zikcam/prod/purchaseTent?sort=lowprice"><input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
										<a href="/zikcam/prod/purchaseTent?sort=highprice"><input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									<c:if test="${session_MEM_ID != null }">
										/&nbsp;
										<a href="/zikcam/prod/purchaseTent?sort=mywish"><input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									</c:if>
									</c:when>
									<c:when test="${product.PROD_CATEGORY eq '테이블/체어'}">
										<a href="/zikcam/prod/purchaseTable?sort=lowprice"><input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
										<a href="/zikcam/prod/purchaseTable?sort=highprice"><input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									<c:if test="${session_MEM_ID != null }">	
										/&nbsp;
										<a href="/zikcam/prod/purchaseTable?sort=mywish"><input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									</c:if>
									</c:when>
									<c:when test="${product.PROD_CATEGORY eq '매트/침낭'}">
										<a href="/zikcam/prod/purchaseMatt?sort=lowprice"><input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
										<a href="/zikcam/prod/purchaseMatt?sort=highprice"><input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									<c:if test="${session_MEM_ID != null }">	
										/&nbsp;
										<a href="/zikcam/prod/purchaseMatt?sort=mywish"><input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									</c:if>
									</c:when>
									<c:when test="${product.PROD_CATEGORY eq '기타'}">
										<a href="/zikcam/prod/purchaseEtc?sort=lowprice"><input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
										<a href="/zikcam/prod/purchaseEtc?sort=highprice"><input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									<c:if test="${session_MEM_ID != null }">	
										/&nbsp;
										<a href="/zikcam/prod/purchaseEtc?sort=mywish"><input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
									</c:if>
									</c:when>
	                        		
                    </c:choose>
                	<%-- <h1 class="display-4 fw-bolder"><c:out value="${product.PROD_CATEGORY}" />&nbsp; 구매</h1> --%>
                	</c:forEach>
			<!-- 
			<a href="/zikcam/prod/purchaseTent?sort=lowprice"><input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
			<a href="/zikcam/prod/purchaseTent?sort=highprice"><input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
			<a href="/zikcam/prod/purchaseTent?sort=mywish"><input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/></a>&nbsp; -->
		</div>
			
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                <c:forEach items="${allProductList}" var="product">
                    <div class="col mb-5" id="num">
                        <div class="card h-100">
                        <div class="badge text-white position-absolute" style="top: 0.3rem; left: 0.3rem;">
                       <%--  <img id="image" onclick="changeImage()" border="0" 
	                        	<c:choose>
	                        		<c:when test="${product.PROD_CONTIMAGE eq '4'}">src="./images/heart_empty.png"</c:when>
	                        		<c:otherwise>src="./images/heart_full.png"</c:otherwise>
	                        	</c:choose>
	                        	width="30" height="30"/> --%>
	                        	&nbsp;조회수 : ${product.PROD_HITCOUNT} 
	                    </div>
                            <!-- Product image-->
                            <a href="/zikcam/product/product/productDetail"><a id='thumb' href='#this'><div class='gdsDes'>${product.PROD_THUMB}</div></a>
                            <input type='hidden' id='PROD_NUM' name="PROD_NUM" value="${product.PROD_NUM}">
                            
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center"> 
                                    <!-- Product name--> 
                                    <h5 class="fw-bolder"><c:out value="${product.PROD_NAME }" /></h5>
                                    <!-- Product price-->
                                    가격 : <c:out value="${product.PROD_PRICE}" /> 원
                                    <input type='hidden' id='PROD_PRICE' value="${product.PROD_PRICE}">
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="order" href="#this">구매하기</a></div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="cart" href="#this">장바구니 넣기 </a></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
            </div>
        </section>
       
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	$(document).ready(function(){
		$("a[id='thumb']").on("click", function(e){  //상세보기
			e.preventDefault();
			fn_openProductDetail($(this));
		});
		
		$("a[id='order']").on("click", function(e){  //구매하기
			e.preventDefault();
			fn_openProductOrder($(this));
		});
		
		$("a[id='cart']").on("click", function(e){  //카트
			e.preventDefault();
			fn_openProductCart($(this));
			/*  $.ajax({
  				 url : '../prod/insertCart', 
  	              type : "get",
  	              dataType : "text",
  	              data : {"PROD_NUM" : PROD_NUM,
  	            		"PROD_COUNT" : 1, "CART_RENTAL" : 0},
  	              success : function(data){ 
  	            	var result = confirm("상품이 장바구니에 담겼습니다.\n\n장바구니로 이동하시겠습니까?");
  	                if(result){
  	                	fn_openProductCart();
  	                       
  	                }
  	              },
  	              error : function(data){
  	            	 alert('error');
  	              }
  				}) */
		});
		
		
	});
	
	function fn_openProductDetail(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/productDetail'/>"); 
		comSubmit.addParam("PROD_NUM", obj.parent().find("#PROD_NUM").val());
		comSubmit.submit(); 
	}
	
	function fn_openProductOrder(obj){ 
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../order/order2'/>"); 
		comSubmit.addParam("PROD_NUM", obj.parent().find("#PROD_NUM").val());
		comSubmit.submit(); 
		
	}
	
	function fn_openProductCart(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/insertCart'/>");
		comSubmit.addParam("MEMBER_ID", $("input[id=MEMBER_ID]").val());
		comSubmit.addParam("PROD_NUM", obj.closest().find("#PNUM").val());  
		comSubmit.addParam("PROD_COUNT", $("input[id=PROD_COUNT]").val());
		comSubmit.addParam("CART_RENTAL", $("input[id=CART_RENTAL]").val());
		comSubmit.submit();
	}
	 
	/* function fn_CartConfirm(obj){ 
      	var result = confirm("상품이 장바구니에 담겼습니다.\n\n장바구니로 이동하시겠습니까?");
          if(result){
          	fn_openProductCart($(this)); 
                 
          }
	} */
	  
	history.replaceState({}, null, location.pathname);
	</script>
    </body>
</html>
