<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h2>주문상세</h2>
				<br /> <br /> <br />
				<hr />
				<div>
					<div align="center">
						<table border="1"
							style="width: 90%; min-width: 450px; border-color: black">
							<tr>
								<td colspan="4" style="min-width: 450px;">기본 정보</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">주문번호</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_NUM }</td>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">아이디</td>
								<td style="width: 35%; min-width: 100px;">${map.MEMBER_ID }</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">결제금액</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_PRICE }
									원</td>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">배송비</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_DPRICE }
									원</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">결제수단</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_PAYTYPE }</td>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">주문일자</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_DATE}</td>
							</tr>
							<tr>
								<td colspan="4">수령인 정보</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">이름
								</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_RCV_NAME }</td>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">핸드폰
									번호</td>
								<td style="width: 35%; min-width: 100px;">${map.ORDER_RCV_PHONE }</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">우편번호</td>
								<td colspan="3" style="width: 85%; min-width: 400px;">${map.ORDER_RCV_ZONCODE }</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">주소</td>
								<td colspan="3">${map.ORDER_RCV_ADDRESS1 }</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">상세주소</td>
								<td colspan="3">${map.ORDER_RCV_ADDRESS2 }</td>
							</tr>
							<tr>
								<td
									style="width: 15%; min-width: 50px; background-color: #212629; color: white;">요청사항</td>
								<td>${map.ORDER_RCV_MEMO }</td>
							</tr>
						</table>
						<br /> <br />
						<h4 align="left">주문상품</h4>
						<table style="width: 100%; border-bottom: 1px;">
							<tr
								style="width: 100%; height: 34px; background-color: #212629; color: white;">
								<th style="width: 13%; min-width: 100px;">섬네일</th>
								<th style="width: 15%; min-width: 100px;">상품명</th>
								<th style="width: 10%; min-width: 50px;">상품번호</th>
								<th style="width: 10%; min-width: 50px;">시리얼번호</th>
								<th style="width: 10%; min-width: 60px;">수량</th>
								<th style="width: 12%; min-width: 60px;">금액</th>
								<th style="width: 12%; min-width: 50px;">상태</th>
								<th style="width: 18%; min-width: 50px;">비고</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list}" var="row">
										<tr align="left"  style="border-bottom:1px solid;">
											<td><img width="100px" height="100px"></img></td>
											<td>${row.PROD_NAME }</td>
											<td>${row.PROD_NUM }</td>
											<td>${row.PROD_SERIAL_NUM }</td>
											<td><c:choose>
													<c:when test="${empty row.PROD_SERIAL_NUM}"> ${row.PROD_COUNT } 개
														</c:when>
													<c:otherwise> 1 개
														</c:otherwise>
												</c:choose></td>

											<td><c:choose>
													<c:when test="${empty row.PROD_SERIAL_NUM }">
														${row.PROD_PRICE * row.PROD_COUNT} 원
														</c:when>
													<c:otherwise>
														${row.PROD_RPRICE } 원
														</c:otherwise>
												</c:choose></td>
											<td>${row.ORDER_STATUS }</td>
											<td>
												<c:choose>
													<c:when test="${empty row.PROD_SERIAL_NUM }">
														<button
															style="
																background-color: #ffcf03;
																color: #000;
																outline: 0; 
																border: 0; 
																border-radius: 4px;
																margin: auto; 
																font-size: 0.7em; 
																width: 74px; 
																height: 24px;">구매상품</button>
													</c:when>
													<c:when test="${not empty row.PROD_SERIAL_NUM }">
														<button
															style="
																background-color: #a6dd28; 
																color: #000;
																outline: 0; 
																border: 0; 
																border-radius: 4px;
																margin: auto; 
																font-size: 0.7em; 
																width: 74px; 
																height: 24px;">대여상품</button>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
												<c:if test="${row.ORDER_DEL == '1'}">
														<br/>
														<button
															style="
																background-color: #f12e24;
																color: #fff;
																outline: 0; 
																border: 0; 
																border-radius: 4px;
																margin: auto; 
																font-size: 0.7em; 
																width: 74px; 
																height: 24px;">삭제됨</button>
													</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7">데이터 출력에 문제가 생겼습니다. 담당자에게 확인해주세요.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<table align="right" style="margin-right: 25px;">
							<tr>
								<td><p style="margin-top: 8px; font-size: 1.0em;">총
										주문금액</p></td>
								<td><p
										style="margin-top: 8px; font-size: 1.0em; color: gray;">
										(주문금액 + 배송비)</p></td>
								<td><p style="margin-top: 8px; font-size: 1.0em;">:</p></td>
								<td><p style="font-size: 1.8em; color: #f82d24;">&nbsp;${map.ORDER_PRICE + map.ORDER_DPRICE }
										원</p></td>
							</tr>
						</table>
						<br /> <br />
					</div>
					<br /> <br />
					<hr />
					<div  align="right">
						<button class="btn btn-outline-dark"
							style="outline: 0; border: 1; border-radius: 6px; width: 160px; height: 40px;"
							class="btn" value="list" id="list" onclick ="location.href = '#this'">목록으로</button>
						<br/>	<br/>
					</div>
				</div>
			</div>

			<br /> <br /> <br /> <br /> <br />
		</section>
	</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript"> 
		$(document).ready(function(){ 
			$("#list").on("click", function(e){ 
				e.preventDefault(); 
				fn_openUserList(); 
			}); 
		}); 
		
	function fn_openUserList(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/admin/orderList' />"); 
		comSubmit.submit(); 
	} 
	</script>
</body>
</html>
