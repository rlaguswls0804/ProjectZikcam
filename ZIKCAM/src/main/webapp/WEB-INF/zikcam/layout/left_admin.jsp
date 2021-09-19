<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <style type="text/css">
  .sb-sidenav {
  position: fixed;
  top: 56px;
  left: 0;
  right: 0;
  z-index: 0;
}
</style> -->
</head>
<body>
<!-- 	사이드바 영역 -->
	
		<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
					<a class="nav-link" href="../admin/productList" style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
						<div class="menu sb-sidenav-menu-heading">관리자메뉴</div>
					</a>
						<hr />
						<a class="nav-link" href="../admin/orderList"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
							<i class="fas fa-table"></i>주문내역
						</a>
						<ul style="font-style: normal; list-style: none;">
							<li style="line-height: 0px;"><a class="nav-link"
								href="../admin/orderList" style="font-size: 1.0em;"> 주문목록</a></li>
							<li style="line-height: 0px;"><a class="nav-link"
								href="../admin/orderCancelList" style="font-size: 1.0em;"> 취소 반품 목록</a></li>
						</ul>
						<a class="nav-link" href="../admin/userList"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
							<i class="fas fa-table"></i>회원정보
						</a> <a class="nav-link" href="../admin/reviewList"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
							<i class="fas fa-table"></i>구매후기
						</a> <a class="nav-link" href="../admin/PQList"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
							<i class="fas fa-table"></i>문의내역
						</a> 
						<ul style="font-style: normal; list-style: none;">
							<li style="line-height: 0px;"><a class="nav-link"
								href="../admin/PQList" style="font-size: 1.0em;">상품문의</a></li>
							<li style="line-height: 0px;"><a class="nav-link"
								href="../admin/QnAList" style="font-size: 1.0em;">직캠문의</a></li>
						</ul>
						<a class="nav-link" href="../admin/productList"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
							<i class="fas fa-table"></i>상품목록
						</a>
						<ul style="font-style: normal; list-style: none;">
							<li style="line-height: 0px;"><a class="nav-link"
								href="../admin/openProductWrite" style="font-size: 1.0em;">상품등록</a></li>
							<li style="line-height: 0px;"><a class="nav-link"
								href="../admin/productList" style="font-size: 1.0em;">상품목록</a></li>
						</ul>
					</div>
				</div>
			</nav>
	
</body>
</html>