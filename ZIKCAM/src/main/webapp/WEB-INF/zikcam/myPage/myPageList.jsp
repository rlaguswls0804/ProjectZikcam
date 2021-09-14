<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h3>마이페이지</h3>

				<hr />
				안녕하세요 ${session_MEM_ID}!!! 님!
				<hr />
				<br />
				<div class="row">

					<div class="col-xl-3 col-md-6 border-radius"
						style="width: 100%; border: 1px solid black; border-radius: 30px 30px;">

						<div style="text-align: center;" class="container">
							<div class="card-body" style="color: black">주문내역</div>
							<table class="table table-hover" style="width: 100%;">
								<tr bgcolor="#212926"
									style="color: white; border-collapse: collapse; outline: 0; border: 0;">
									<th style="width: 10%;">주문 번호</th>
									<th style="width: 15%;">상품명</th>
									<th style="width: 30%;">갯수</th>
									<th style="width: 15%;">총 가격</th>
									<th style="width: 30%">주문 일</th>
								</tr>
								<c:choose>
									<c:when test="${fn:length(orderlist) > 0 }">
										<c:forEach items="${orderlist }" var="row">
											<tr onClick="location.href='../myPage/myOrderDetail?ORDER_NUM=${row.ORDER_NUM}'">
												<td>
												<input type="hidden" name="ORDER_NUM" value="${row.ORDER_NUM}">
												${row.ROWNUM }</td>
												<td>${row.PROD_NAME }
													<c:if test="${row.CNT > 1 }">
													외 ${row.CNT - 1 }
													</c:if>
												</td>
												<td>${row.CNT } </td>
												<td>${row.ORDER_PRICE }원
												</td>
												<td>${row.ORDER_DATE }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">조회된 결과가 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<br>
							<div class="border-radius"
								style="float: right; margin-right: 30px;">
								<a class="small text-white" href="../myPage/myOrderList"><font
									size="3px" color="black">자세히 보기</font></a>
							</div>
						</div>
					</div>

					<hr style="height: 0px;" />


					<div class="col-xl-3 col-md-6 border-radius"
						style="width: 100%; border: 1px solid black; border-radius: 30px 30px;">

						<div style="text-align: center;" class="container">
							<div class="card-body" style="color: black">구매후기</div>
							<table class="table table-hover" style="width: 100%;">
								<tr bgcolor="#212926"
									style="color: white; border-collapse: collapse; outline: 0; border: 0;">
									<th style="width: 10%;">게시글 번호</th>
									<th style="width: 15%;">상품명</th>
									<th style="width: 30%;">제목</th>
									<th style="width: 15%;">평점</th>
									<th style="width: 30%;">작성일</th>
								</tr>
								<c:choose>
									<c:when test="${fn:length(reviewlist) > 0 }">
										<c:forEach items="${reviewlist }" var="row">
											<tr onClick="location.href='../myPage/myReviewDetail?REVIEW_NUM=${row.REVIEW_NUM}'">
												<td>
												<input type="hidden" name="REVIEW_NUM" value="${row.REVIEW_NUM}">
												${row.ROWNUM }</td>
												<td>${row.PROD_NAME }</td>
												<td>${row.REVIEW_TITLE }</td>
												<td>
												<c:forEach var="like" begin="1" end="5">
													<c:choose>
														<c:when test="${row.REVIEW_LIKE >= like }">
															★
														</c:when>
														<c:otherwise>
															☆
														</c:otherwise>	
													</c:choose>
												</c:forEach>		
												</td>
												<td>${row.REVIEW_DATE }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">조회된 결과가 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div class="border-radius"
								style="float: right; margin-right: 30px;">
								<a class="small text-white" href="../myPage/myReviewList"><font
									size="3px" color="black">자세히 보기</font></a>
							</div>
						</div>
					</div>

					<hr style="height: 0px;" />

					<div class="col-xl-3 col-md-6 border-radius"
						style="width: 100%; border: 1px solid black; border-radius: 30px 30px;">

						<div style="text-align: center;" class="container">
							<div class="card-body" style="color: black">상품문의</div>
							<table class="table table-hover" style="width: 100%;">
								<tr bgcolor="#212926"
									style="color: white; border-collapse: collapse; outline: 0; border: 0;">
									<th style="width: 10%;">게시글 번호</th>
									<th style="width: 15%;">상품명</th>
									<th style="width: 30%;">제목</th>
									<th style="width: 15%;">답변상태</th>
									<th style="width: 30%;">작성일</th>
								</tr>
								<c:choose>
									<c:when test="${fn:length(pqlist) > 0 }">
										<c:forEach items="${pqlist }" var="row">
											<tr onClick="location.href='../myPage/myPQDetail?PQ_NUM=${row.PQ_NUM}'">
												<td>
												<input type="hidden" name="PQ_NUM" value="${row.PQ_NUM}">
												${row.ROWNUM }</td>
												<td>${row.PROD_NAME }</td>
												<td>${row.PQ_TITLE } </td>
												<td>
													<c:choose>
														<c:when test="${row.PQ_REPLY == 0 }">X</c:when>
														<c:otherwise>O</c:otherwise>
													</c:choose>
												</td>
												<td>${row.PQ_DATE }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">조회된 결과가 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div class="border-radius"
								style="float: right; margin-right: 30px;">
								<a class="small text-white" href="../myPage/myQuestionList"><font
									size="3px" color="black">자세히 보기</font></a>
							</div>
						</div>
					</div>

					<hr style="height: 0px;" />

					<div class="col-xl-3 col-md-6 border-radius"
						style="width: 100%; border: 1px solid black; border-radius: 30px 30px;">

						<div style="text-align: center;" class="container">
							<div class="card-body" style="color: black">장바구니</div>
							<table class="table table-hover" style="width: 100%;">
								<tr bgcolor="#212926"
									style="color: white; border-collapse: collapse; outline: 0; border: 0;">
									<th style="width: 10%;">바구니 번호</th>
									<th style="width: 15%;">상품명</th>
									<th style="width: 30%;">수량</th>
									<th style="width: 15%;">상품 구분</th>
									<th style="width: 30%;">에약일</th>
								</tr>
								<c:choose>
									<c:when test="${fn:length(cartlist) > 0 }">
										<c:forEach items="${cartlist }" var="row">
											<tr>
												<td>${row.ROWNUM }</td>
												<td>${row.PROD_NAME }</td>
												<td>${row.PROD_COUNT }</td>
												<td>
													<c:choose>
														<c:when test="${row.CART_RENTAL == 1}">구매 </c:when>
														<c:otherwise>대여</c:otherwise>
													</c:choose> 
												</td>
												<td>${row.PQ_DATE }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">조회된 결과가 없습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<div class="border-radius"
								style="float: right; margin-right: 30px;">
								<a class="small text-white" href="../myPage/myChartList"><font
									size="3px" color="black">자세히 보기</font></a>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</section>
	</main>
	
</body>
</html>
