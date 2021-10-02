<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <%@ include file="/WEB-INF/include/include-header.jspf" %>
    </head>
    <body>
        <!-- Header-->
        <!-- <header class="bg-dark py-5"> -->
        <!-- <header background-image src="images/CampGrounds.jpeg"> -->
        <header class="bg-dark py-5" style="background-image : url('/zikcam/resources/images/zikcam_main1.jpg'); object-fit: contain; padding-top: 10rem !important; padding-bottom: 2rem !important;">
        	<!-- <style>
                h {
                background-image : url("images/CampGround.jpg");
                }
            </style> -->
        	<!-- <img class="CampGround" src="images/CampGround.jpg" style='height: 100%; width: 100%; object-fit: contain'/> -->
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- <image src="images/CampGround.jpg" style='/* height: 100%; width: 100%;  */object-fit: contain'> -->
                	<h1 class="display-4 fw-bolder">ZikCam!!~!<br />당신이 직접 고른 캠핑 용품</h1>
                	<p style="color:#c5eff7;" class="lead fw-normal mb-0"><br /><br /><br /><br />세계 최대의 캠핑 용품 대여 및 구매 플랫폼</p>
                    
                </div>
            </div>
            
        </header>
        
        
        <div class="text-center text-dark">
                <h5 class="display-5 fw-bolder" style="color:#4b4b4b"><br />구매</h5>
        </div>
        
        <input type="hidden" id="MEMBER_ID" name="MEMBER_ID" value="${session_MEM_ID}">
        <input type="hidden" id="start_date" name="start_date" value="${start_date}">
        <input type="hidden" id="end_date" name="end_date" value="${end_date}">  
         
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/zikcam/resources/images/TENT.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">텐트 / 타프</h5>
                                    <!-- Product price-->
                                    <!-- $40.00 - $80.00 -->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/zikcam/prod/purchaseTent">텐트 / 타프<br>구매하러 가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">폭탄 세일</div> -->
                            <!-- Product image-->
                            <img class="card-img-top" src="/zikcam/resources/images/MAT.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">매트 / 침낭</h5>
                                    <!-- Product reviews-->
                                    <!-- <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div> -->
                                    <!-- Product price-->
                                    <!-- <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00 -->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/zikcam/prod/purchaseMatt">매트 / 침낭<br>구매하러 가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div> -->
                            <!-- Product image-->
                            <img class="card-img-top" src="/zikcam/resources/images/TABLE.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">테이블 / 체어</h5>
                                    <!-- Product price-->
                                    <!-- <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00 -->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/zikcam/prod/purchaseTable">테이블 / 체어<br>구매하러 가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/zikcam/resources/images/ETC.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">ETC.</h5>
                                    <!-- Product reviews-->
                                    <!-- <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div> -->
                                    <!-- Product price-->
                                    <!-- $40.00 -->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/zikcam/prod/purchaseEtc">기타 용품<br>구매하러 가기</a></div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        
        
			
			
			<hr><br />
			<div class="text-center text-dark">
                <h3 class="display-5 fw-bolder" style="color:#4b4b4b"><br />대여</h3>
        	</div>
        
			
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="/zikcam/resources/images/RENTAL.PNG" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">대여</h5>
                                    <!-- Product price-->
                                    <!-- $40.00 - $80.00 -->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <c:if test="${session_MEM_ID == null }">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" name="rental3" href="#this">대여하러 가기</a></div>
                            </c:if>
                            <c:if test="${session_MEM_ID != null }">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" name="rental4" href="#this">대여하러 가기</a></div>
                            </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">매트 / 침낭</h5>
                                    Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    Product price
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/zikcam/prod/rentalMatt">매트 / 침낭<br>대여하러 가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            Product details
                            <div class="card-body p-4">
                                <div class="text-center">
                                    Product name
                                    <h5 class="fw-bolder">테이블 / 체어</h5>
                                    Product price
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/zikcam/prod/rentalTable">테이블 / 체어<br>대여하러 가기</a></div>
                            </div>
                        </div>
                    </div> -->
                    
                    
                </div>
            </div>
        </section>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("a[name=rental3]").on("click", function(e){
			e.preventDefault();
			fn_validation();
		});
		
		$("a[name=rental4]").on("click", function(e){
			e.preventDefault();
			fn_openRentalDate(); 
		});
		
		$("button[name=main]").on("click", function(e){
			e.preventDefault();
			fn_ProductList(); 
		});
		
	});
	
	function fn_openLogin(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/zikcam/member/loginForm");
		comSubmit.submit();
	}
	
	function fn_ProductList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("/zikcam/prod/purchaseTent");
		comSubmit.addParam("keyword", $('#keyword').val());
		comSubmit.submit();
	}
	
	function fn_openRentalDate(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/rentalDate' />");
		comSubmit.submit();
	}
	
	function fn_validation() { 	   
		   if("${session_MEM_ID == null}"){
		      alert("대여하기는 로그인 후 이용 가능합니다");
		      return fn_openLogin();
		   }
	}
</script>
</body>
</html>
