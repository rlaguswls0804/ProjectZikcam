<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
  .navbar {
  position: fixed;
  top: 0;
  width: 100%;
  left: 0;
  right: 0;
  z-index: 1;
}
.navbar2 {
  padding-top: 3.5rem !important;
  top: 56px;
  width: 100%;
  left: 0;
  right: 0;
} 
</style>
</head>
<body>
<!-- Navigation-->

        <nav class="navbar navbar-expand-xl navbar-dark bg-white">
        <!-- position:fixed로 상단에 고정 / margin : 여백 / z-index : 맨 위로 표시하기 width랑 height는 해보면서 조정함. -->
            <div class="container px-4 px-lg-0">
            	
                <!-- <a class="navbar-brand" href="#!">ZikCam</a> -->
                <a href="/zikcam/prod/main"><img src="/zikcam/resources/images/zikcam_black.png" alt="ZikCam_Logo" width="130" height="30"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                	aria-expanded="false" aria-label="Toggle navigation"  style="background-color: #d8d8d8;">
                	<span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <c:if test="${session_MEM_ID == null }">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/zikcam/member/loginForm" style="color:#4b4b4b">로그인</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/zikcam/cs/csIndex" style="color:#4b4b4b">고객센터</a></li>
                    </c:if> 
                    <c:if test="${session_MEM_ID != null }">
				         <li class="nav-item"><a class="nav-link active" aria-current="page" href="/zikcam/myPage/myPageList" style="color:#4b4b4b">${session_MEM_ID}&nbsp;님</a></li>   
				         <li class="nav-item"><a class="log nav-link active" aria-current="page" href="/zikcam/member/logout" style="color:#4b4b4b">로그아웃</a></li> 
				         	<c:if test="${session_MEM_RANK == 0 }">
				               <li class="nav-item"><a class="nav-link active" aria-current="page" href="/zikcam/admin/productList" style="color:#4b4b4b">관리자페이지</a></li>    
				        	</c:if>
					         <c:if test="${session_MEM_RANK == 1 }">
					         	<li class="nav-item"><a class="nav-link active" aria-current="page" href="/zikcam/myPage/myPageList" style="color:#4b4b4b">마이페이지</a></li>
					         </c:if>
				         <li class="nav-item"><a class="nav-link active" aria-current="page" href="/zikcam/cs/csIndex" style="color:#4b4b4b">고객센터</a></li>
			         </c:if> 
                        <!-- <li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li> -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:#4b4b4b">쇼핑하기</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><h5 class="dropdown-header">대여</h5></li>
                                <c:if test="${start_date == null }">
	                                <li><a class="dropdown-item" href="/zikcam/prod/rentalDate">대여하기</a></li>
                                </c:if>
                                <c:if test="${start_date != null }">
	                                <li><a class="dropdown-item" href="/zikcam/prod/rentalList">대여하기</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider" /></li>
                                <li><h5 class="dropdown-header">구매</h5></li>
                                <li><a class="dropdown-item" href="/zikcam/prod/purchaseTent">텐트 / 타프</a></li>
                                <li><a class="dropdown-item" href="/zikcam/prod/purchaseMatt">매트 / 침낭</a></li>
                                <li><a class="dropdown-item" href="/zikcam/prod/purchaseTable">테이블 / 체어</a></li>
                                <li><a class="dropdown-item" href="/zikcam/prod/purchaseEtc">기타</a></li>
                                     
                            </ul>
                        </li>
                    </ul>
                    <!-- Sidebar Toggle-->
		            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
		            <!-- Navbar Search-->
                    <form class="d-flex d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		                <div class="input-group">
		                    <input class="form-control" type="text" placeholder="상품 검색" aria-label="Search for..." name="keyword" id="keyword" value="${keyword}" aria-describedby="btnNavbarSearch" />
		                    <input type="hidden" name="searchType" id="searchType" value="all">
		                    <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i>
		                    	<!-- <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path></svg> -->
		                    	<div id='search-button'>
								    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
								</div>
		                    </button>
		                </div>
		            </form>
		            <c:if test="${session_MEM_ID != null && session_MEM_RANK != 0}">
				    <form class="d-flex d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" action="/zikcam/myPage/myCartList">
                        <button class="btn btn-outline-dark" type="submit" id="mycart" style="color:#808080">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-light ms-1 rounded-pill" style="color:#373737"></span>
                            <input type="hidden" id="MEMBER_ID" name="MEMBER_ID" value="${session_MEM_ID}">
                        </button>
                    </form>
                    </c:if>
                </div>
            </div>
        </nav>
	
	
	
	<nav class="navbar2">
		<div>
			<form action="../prod/rentalList" method="get">
				<input type="hidden" name="sortType2" id="sortType2" value=""/>
			</form> 
            <table style="width: 100%; border:0.5px solid white;">
                <%-- <c:if test="${session_MEM_ID == null }"> --%>	
               	<tr height="78px" >
               		<td style="background-color:gray; color:black;">
               			<button class="btn-outline-dark" style="outline:0; border:0; width:100%; height:78px;
               			 text-align:right;" name="listType" value="purchase" id="puchase">구매
               			</button >
               		</td> 
               		
               	<c:if test="${session_MEM_ID == null }">
               		<td style="background-color:gray; color:black;">
               			<button class="btn-outline-dark active" style="outline:0; border:0; width:100%; height:78px;
               			 text-align:left;" name="listType" id="rental" value="rental">대여
               			</button>
               		</td>
               	</c:if>
               	 
               	<c:if test="${session_MEM_ID != null }">  
               		<td style="background-color:gray; color:black;">
               			<button class="btn-outline-dark active" style="outline:0; border:0; width:100%; height:78px;
               			 text-align:left;" name="rental2" value="rental">대여
               			</button>
               		</td>
               	</c:if>
               	
               		<td align="center" style="width: 19%; background-color:gray; color:black;">
               			<button class="btn-outline-dark" style="outline:0; border:0; width:100%; height:78px;" name="sortType2" value="tent"> 텐트 / 타프
               			</button>
               		</td> 
               		<td align="center" style="width: 19%; background-color:gray; color:black;">
               			<button class="btn-outline-dark" style="outline:0; border:0; width:100%; height:78px;" name="sortType2" value="mat"> 침낭 / 매트
               			</button>
               		</td>
               		<td align="center" style="width: 19%; background-color:gray; color:black;">
               			<button class="btn-outline-dark" style="outline:0; border:0; width:100%; height:78px;" name="sortType2" value="table"> 테이블 / 체어
               			</button>
               		</td>
                   	<td align="center" style="width: 19%; background-color:gray; color:black;">
                   		<button class="btn-outline-dark" style="outline:0; border:0; width:100%; height:78px;" name="sortType2" value="etc"> 기타
                   		</button>
                   	</td>
				</tr>
			</table>
			
		</div> 
	</nav> 
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#rental").on("click", function(e){ //렌탈 날짜선택 페이지
			e.preventDefault();
			fn_validation();
		});
		
		$("button[name=rental2]").on("click", function(e){ //렌탈 날짜선택 페이지
			e.preventDefault();
			fn_openRentalDate(); 
		});
		 
		$("#puchase").on("click", function(e){ //렌탈 날짜선택 페이지
			e.preventDefault();
			if("${start_date || end_date}"){
				fn_deleteSession();
			}else {
				fn_openProduct();
			}
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
    				$('button[value=table]').removeClass('active');
    				$('button[value=tent]').removeClass('active');
    				$('button[value=mat]').removeClass('active');
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
	
	function fn_selectRentalList(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/rentalList'/>");
		comSubmit.addParam("sortType2", $('#sortType2').val());
		comSubmit.submit();
	}	
	
	function fn_openLogin(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../member/loginForm' />");
		comSubmit.submit();
	}
	
	function fn_openRentalDate(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/rentalDate' />");
		comSubmit.submit();
	}
	
	function fn_openRentalList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/rentalList' />");
		comSubmit.submit();
	}
	
	function fn_deleteSession(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../prod/deleteSession' />");
		comSubmit.submit(); 
	}
	
	function fn_openProduct(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/prod/purchaseTent' />");
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