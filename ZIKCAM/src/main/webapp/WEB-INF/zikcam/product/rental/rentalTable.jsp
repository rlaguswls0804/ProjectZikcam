<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
    </head>
    <body>

        <hr />
        <h1 align="center">대여 일정</h1>
        <div class="text" align="center">
	        <tr><td>
	        <label for="start"><font color="black">대여 시작일 :&nbsp;</font></label>
	
			<input type="date" id="start_date" name="rental-start"
			       value="xx"
			       min="2021-01-01" max="2021-12-31">
			
			<script>
				document.getElementById('start_date').valueAsDate = new Date();
			</script>

			&nbsp;&nbsp;
	
	        <label for="end"><font color="black">대여 종료일 :&nbsp;</font></label>
	
			<input type="date" id="end_date" name="rental-end"
			       value="xx"
			       min="2021-01-01" max="2021-12-31">
			          
			<script>
				document.getElementById('end_date').valueAsDate = new Date();
			</script>
			
		    </td></tr>
	    
	    </div>
	    
	    <br>
		    <div class="text-center">
			    <button style="background-color:white; border-color:black; color:black; font-size:1em" type="reset" name="date_reset" id="date_reset"><img src="images/" alt="">날짜 초기화</button>
			    &nbsp;&nbsp;&nbsp;&nbsp;
			    <button style="background-color:#373737; border-color:black; color:white; font-size:1em" type="submit" name="date_submit" id="date_submit"><img src="images/" alt="">확인</button>
			</div>
	    
	    
	    <hr />
        
        <!-- Header-->
        <!-- <header class="bg-dark py-5"> -->
        <!-- <header background-image src="images/CampGrounds.jpeg"> -->
        <header class="bg-dark py-5" style="background-image : url('images/CampGrounds_California_5.jpg'); object-fit: contain">
        	<!-- <style>
                h {
                background-image : url("images/CampGround.jpg");
                }
            </style> -->
        	<!-- <img class="CampGround" src="images/CampGround.jpg" style='height: 100%; width: 100%; object-fit: contain'/> -->
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- <image src="images/CampGround.jpg" style='/* height: 100%; width: 100%;  */object-fit: contain'> -->
                	<h1 class="display-4 fw-bolder">테이블 / 체어 대여</h1>
                   
                </div>
            </div>
        </header>
        
        
        <div class="text-center text-dark">
                <h4 class="display-5 fw-bolder" style="color:#4b4b4b"><br />대표 상품</h4>
        </div>
        
  <!--       <input type='button' class='btn' name='btn' value='버튼' style="float: right;">
 -->
 		<!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    
                    <c:forEach items="${mainProductList}" var="product">
                    	<div class="col mb-5">
	                        <div class="card h-100">
	                        	<div class="badge text-white position-absolute" style="top: 0.3rem; left: 0.3rem;"><img id="image" onclick="changeImage()" border="0" 
	                        	<c:choose>
	                        		<c:when test="${product.PROD_CONTIMAGE eq '4'}">src="./images/heart_empty.png"</c:when>
	                        		<c:otherwise>src="./images/heart_full.png"</c:otherwise>
	                        	</c:choose>
	                        	width="30" height="30"/></div>
	                            <!-- Product image-->
	                            <a href="/zikcam/prod/productDetail2"><img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /></a>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder"><c:out value="${product.PROD_NAME }" /></h5>
	                                    <!-- Product reviews-->
	                                    <!-- <div class="d-flex justify-content-center small text-warning mb-2">
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                    </div> -->
	                                    <!-- Product price-->
	                                    가격 : <c:out value="${product.PROD_PRICE}" /> 원
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">대여하기</a></div>
	                            </div>
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니 넣기 </a></div>
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
			<!-- <a href="/zikcam/prod/purchaseTent?sort=popular"><input type='button' value='인기 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp; -->
			<a href="/zikcam/prod/purchaseTent?sort=lowprice"><input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
			<a href="/zikcam/prod/purchaseTent?sort=highprice"><input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp;
			<a href="/zikcam/prod/purchaseTent?sort=mywish"><input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;
		</div>
			
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                <c:forEach items="${allProductList}" var="product">
                    <div class="col mb-5">
                        <div class="card h-100">
                        <div class="badge text-white position-absolute" style="top: 0.3rem; left: 0.3rem;"><img id="image" onclick="changeImage()" border="0" 
	                        	<c:choose>
	                        		<c:when test="${product.PROD_CONTIMAGE eq '4'}">src="./images/heart_empty.png"</c:when>
	                        		<c:otherwise>src="./images/heart_full.png"</c:otherwise>
	                        	</c:choose>
	                        	width="30" height="30"/></div>
                            <!-- Product image-->
                            <a href="/zikcam/prod/productDetail"><img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..."/></a>
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
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">대여하기</a></div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니 넣기 </a></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
            </div>
        </section>
       
    </body>
</html>
