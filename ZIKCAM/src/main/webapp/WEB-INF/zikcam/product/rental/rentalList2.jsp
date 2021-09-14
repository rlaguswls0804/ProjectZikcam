<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <%@ include file="/WEB-INF/include/include-header.jspf" %>
        <style type="text/css">
			.gdsDes img { max-width: 100%; max-height: 100%; width:auto; height:auto; border-top-left-radius: calc(0.25rem - 1px);
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
        <h1 align="center">대여 일정</h1>
        <div class="text" align="center">
	        <tr><td>
	        <label for="start"><font color="black">대여 시작일 :&nbsp;</font></label>
	
			<input type="date" id="start_date" name="start_date"
			       value="${start_date}"
			       min="2021-01-01" max="2021-12-31" disabled>
			
			<!-- <script>
				document.getElementById('START_DATE').valueAsDate = new Date();
			</script> -->

			&nbsp;&nbsp;
	
	        <label for="end"><font color="black">대여 종료일 :&nbsp;</font></label>
	 
			<input type="date" id="end_date" name="end_date"
			       value="${end_date}"
			       min="2021-01-01" max="2021-12-31" disabled>
			          
			<!-- <script>
				document.getElementById('END_DATE').valueAsDate = new Date();
			</script> -->
			
		    </td></tr>
	    
	    </div>
	    
	    <br>
		    <div class="text-center">
			    <button style="background-color:white; border-color:black; color:black; font-size:1em" type="reset" name="date_reset" id="date_reset" onclick="location.href='../prod/rentalDate'">날짜 초기화</button>
			</div>
	    
	    
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
                	<h1 class="display-4 fw-bolder"><div id="sortTypeView">${sortType2} 대여<div></h1>
                    <%-- <c:choose>
                    	<c:when test="${session_MEM_ID == null }">
                    		
                    	</c:when>
                    </c:choose> --%>
                    
                </div>
            </div>
        </header>
        
        
        <div class="text-center text-dark">
                <h4 class="display-5 fw-bolder" style="color:#4b4b4b"><br />대표 상품</h4>
        </div>
        
  <!--       <input type='button' class='btn' name='btn' value='버튼' style="float: right;">
 -->
 		<!-- 상품 등록하기 -->
		<!-- <div style="width:15%; float:right; border-color:black; font-size:1.5em;">
			<a href="/zikcam/admin/productWrite"><input type='button' value='상품 등록'/></a>
		</div> -->
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    
                    <%-- <c:forEach items="${mainProductList}" var="product">
                    	<div class="col mb-5">
	                        <div class="card h-100">
	                        	<div class="badge text-white position-absolute" style="top: 0.3rem; left: 0.3rem;"><img id="image" onclick="changeImage()" border="0" 
	                        	<c:choose>
	                        		<c:when test="${product.PROD_CONTIMAGE eq '4'}">src="./images/heart_empty.png"</c:when>
	                        		<c:otherwise>src="./images/heart_full.png"</c:otherwise>
	                        	</c:choose>
	                        	width="30" height="30"/></div>
	                            <!-- Product image-->
	                            <a href="/zikcam/prod/productDetail2"><img class="card-img-top" src="../resources/images/KakaoTalk_20210521_100723807.jpg" " alt="..." /></a>
	                            <!-- Product details-->
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <!-- Product name-->
	                                    <h5 class="fw-bolder">고양이</h5>
	                                    <!-- Product reviews-->
	                                    <!-- <div class="d-flex justify-content-center small text-warning mb-2">
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                        <div class="bi-star-fill"></div>
	                                    </div> -->
	                                    <!-- Product price-->
	                                    가격 : 1,004원
	                                </div>
	                            </div>
	                            <!-- Product actions-->
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="../prod/order2?PROD_NUM=58&RENTAL_DATE='2021-08-12'&RENTAL_DATE='2021-08-13'">대여하기</a></div>
	                            </div>
	                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">장바구니 넣기 </a></div>
	                            </div>
	                             <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="../prod/productDetail?PROD_NUM=58">상세보기 </a></div>
                            </div>
	                        </div>
	                    </div>
	                    
                    	  
        			</c:forEach> --%>
                    
                </div>
            </div>
        </section>
        <!-- 대표 상품 -->


			<hr>
        
        <!-- 기준별 정렬(인기 순, 가격 순 등.) -->
        <div style="width:40%; float:right; border-color:black; font-size:1em;">
        	<form action="../prod/rentalList" method="get">
				<input type="hidden" name="sortType" id="sortType" value=""/>
			</form>
			
			<button class="btn btn-outline-dgray" 
				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="high">높은 가격 순
			</button>
				                
			<button class="btn btn-outline-dgray" 
				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="low">낮은 가격 순
			</button>
					          
				                
			<button class="btn btn-outline-dgray" 
				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="wish">내 찜 목록
			</button>
			
        	
			<!-- <a href="/zikcam/prod/purchaseTent?sort=popular"><input type='button' value='인기 순' style="border-color:transparent; background-color:transparent;"/></a>&nbsp;/&nbsp; -->
			<!-- <a href="/zikcam/prod/purchaseTent?sort=lowprice">
				<input type='button' value='낮은 가격 순' style="border-color:transparent; background-color:transparent;"/>
			</a>&nbsp;/&nbsp;
			
			<a href="/zikcam/prod/purchaseTent?sort=highprice">
				<input type='button' value='높은 가격 순' style="border-color:transparent; background-color:transparent;"/>
			</a>&nbsp;/&nbsp;
			
			<a href="/zikcam/prod/purchaseTent?sort=mywish">
				<input type='button' value='내 찜 목록' style="border-color:transparent; background-color:transparent;"/>
			</a>&nbsp; -->
		</div>
			
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center rental">
                  
                 
                <%-- <c:forEach items="${allProductList}" var="product">
                    <div class="col mb-5">
                        <div class="card h-100">
                        <div class="badge text-white position-absolute" style="top: 0.3rem; left: 0.3rem;"><img id="image" onclick="changeImage()" border="0" 
	                        	<c:choose>
	                        		<c:when test="${product.PROD_CONTIMAGE eq '4'}">src="/resources/images/heart_empty.png"</c:when>
	                        		<c:otherwise>src="/resources/images/heart_full.png"</c:otherwise>
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
                 </c:forEach> --%>
                 
              </div>
            </div>
            <div class="page_wrap"  align="center">
   				<div class="page_nation">
						<div id="PAGE_NAVI"></div>
						<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
				</div>
			</div>
        </section>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectRentalList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openRentalWrite();
			});	
			
			$("a[id='thumb']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openRentalDetail($(this));
			});
			 
			$("button[name=sortType]").on('click', function(){
				
    			var sortType = $(this).val();
    			
    			
    			if(sortType == 'high') { 
    				$('#sortType').val('high');
    				$('button[value=high]').addClass('active');
    				$('button[value=low]').removeClass('active');
    				$('button[value=wish]').removeClass('active');
    			} else if(sortType == 'low') {
    				$('#sortType').val('low');
    				$('button[value=low]').addClass('active');
    				$('button[value=high]').removeClass('active');
    				$('button[value=wish]').removeClass('active');
    			} else if(sortType == 'wish') {
    				$('#sortType').val('wish');
    				$('button[value=wish]').addClass('active');
    				$('button[value=high]').removeClass('active');
    				$('button[value=low]').removeClass('active');
    			} 
    			
    			$.ajax({
   				 url : '../prod/selectRentalList', 
   	              type : "get", 
   	              data : {"sortType" : sortType},
   	              success : function(data){ 
   	                 console.log(sortType);
   	                
   	              	 fn_selectRentalList(1);
   	                 
   	              },
   	              error : function(data){
   	            	 alert('error');
   	                
   	              }
   				})
			});
			 
			$("button[name=sortType2]").on('click', function(){
				
    			var sortType2 = $(this).val();
    			
    			if(sortType2 == 'tent') {
    				$('#sortType2').val('tent');
    				$('button[value=tent]').addClass('active');
    				$('button[value=mat]').removeClass('active');
    				$('button[value=table]').removeClass('active');
    				$('button[value=etc]').removeClass('active');
    			} else if(sortType2 == 'mat') {
    				$('#sortType2').val('mat');
    				$('button[value=mat]').addClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=table]').removeClass('active');
    				$('button[value=etc]').removeClass('active');
    			} else if(sortType2 == 'table') {
    				$('#sortType2').val('table');
    				$('button[value=table]').addClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=mat]').removeClass('active');
    				$('button[value=etc]').removeClass('active');
    			} else if(sortType2 == 'etc') {
    				$('#sortType2').val('etc');
    				$('button[value=etc]').addClass('active');
    				$('button[value=notice]').removeClass('active');
    				$('button[value=event]').removeClass('active');
    				$('button[value=info]').removeClass('active');
    			}
    			 
    			
    			$.ajax({
   				 url : '../prod/selectRentalList', 
   	              type : "get", 
   	              data : {"sortType2" : sortType2},
   	              success : function(data){ 
   	                 console.log(sortType2);
   	                
   	              	 fn_selectRentalList(1);
   	                 
   	              },
   	              error : function(data){
   	            	 alert('error');
   	                
   	              }
   				})
			});
			
		});
		
		 
		
		
		function fn_openRentalDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../prod/rentalDetail'/>");
			comSubmit.addParam("PROD_NUM", obj.parent().find("#PROD_NUM").val());
			comSubmit.addParam("MEMBER_ID", $("session_MEM_ID"));
			comSubmit.submit();
		}
		
		function fn_selectRentalList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='../prod/selectRentalList'/>");
			comAjax.setCallback("fn_selectRentalListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("sortType2", $('#sortType2').val());
			comAjax.addParam("start_date", $('#start_date').val());
			comAjax.addParam("end_date", $('#end_date').val());
						    			 
			comAjax.ajax();
		}	
		
		function fn_selectRentalListCallback(data){
			var total = data.TOTAL;
			var body = $(".rental");
			body.empty();
			if(total == 0){
				var str =  
								"조회된 결과가 없습니다.";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectRentalList"
				};
			gfn_renderPaging(params);
				 
			var str = "";
			$.each(data.rentalList, function(key, value){ //오류나면 빼기
				str +=   "<div class='col mb-5'>" +
			                 "<div class='card h-100'>" +  
			                 "<div class='badge text-white position-absolute' style='top: 0.3rem; left: 0.3rem;'>" +
			                 "<img id='image' onclick='changeImage()' border='0' width='30' height='30' src='../resources/images/emptyHeart.png' />&nbsp;조회수 : " + value.PROD_HITCOUNT + "</div>" +
			                     "<a id='thumb' href='#this'><div class='gdsDes'>" + value.PROD_THUMB + "/></div></a>" +
			                     "<input type='hidden' id='PROD_NUM' value=" + value.PROD_NUM + ">" +
			                     "<div class='card-body p-4'>" +
			                         "<div class='text-center'>" +
			                             "<h5 class='fw-bolder'>" + value.PROD_NAME + "</h5>" +
			                             "가격 : " + value.PROD_RPRICE + "원" + 
			                         "</div>" +
			                     "</div>" +
			                     "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>" + 
			                         "<div class='text-center'><a class='btn btn-outline-dark mt-auto' href='#'>대여하기</a></div>" + 
			                     "</div>" +
			                     "<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>" +
			                         "<div class='text-center'><a class='btn btn-outline-dark mt-auto' href='#'>장바구니 넣기</a></div>" +
			                     "</div>" +
			                 "</div>" +
			             "</div>";
			        	
			});
			body.append(str);
			
			$("a[id='thumb']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openRentalDetail($(this));
			});
			}
		}
		
		/* function HeartStatus(){ 
			if("${wishList.PROD_NUM} == ${rentalList.PROD_NUM}"){
				document.getElementById("image").src = "/resources/images/fullHeart.png";
			}else {
				document.getElementById("image").src = "/resources/images/emptyHeart.png";	
			}
		} */
		
		
</script>        
</body>
</html>
