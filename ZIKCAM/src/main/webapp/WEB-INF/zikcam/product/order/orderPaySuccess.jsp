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
					
						<p><h3><b>주문완료</b></h3></p>
						<hr/>
						<br/>
						
						<!-- 구매자 정보 -->
						<h5><b>구매자 정보</b></h5>
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">이름 </td>
								<td width="80%" id="member_name">${member.MEMBER_NAME}</td>
							</tr>
							<tr>
								<td align="right">이메일 </td>
								<td>${member.MEMBER_EMAIL}</td>
							</tr>
							<tr>
								<td align="right">휴대폰 번호 </td>
								<td>${member.MEMBER_PHONE1}</td>
							</tr>
						</table>
						
						<br/>
						
						<!-- 수령자 정보 -->
						<h5><b>수령자 정보</b></h5>
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">이름 </td>
								<td width="80%">${border.ORDER_RCV_NAME}</td>
							</tr>
							<tr>
								<td align="right">배송주소 </td>
								<td>${border.ORDER_RCV_ADDRESS1} ${border.ORDER_RCV_ADDRESS2}</td>
							</tr>
							<tr>
								<td align="right">연락처 </td>
								<td colspan="2">${border.ORDER_RCV_PHONE}</td>
							</tr>
							<tr>
								<td align="right">배송 요청사항 </td>
								<td>${border.ORDER_MEMO}</td>
							</tr>
						</table>
						
						
						<!-- 장바구니 -->
						<br/><br/>
						
						<h5>
							<b>구매 상품</b>&nbsp;&nbsp;
						</h5>
						
						<hr/>
						
						<div id="purchase">
						<c:choose>
						<c:when test="${dorderP.size() == 0}">
						<br/><br/>
						<div>
							<center>
								주문한 상품이 없습니다.
							</center>
						</div>
						<br/><br/>
						<hr/>
						<br/><br/>
						</c:when>
						<c:otherwise>
							
						<table class="table" id="table1">
							<colgroup>
								<col width="25%" />
								<col width="45%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<tr align="center" bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<th colspan="3">상품 정보</th>
								<th>상품 가격</th>
							</tr>
								<c:forEach items="${dorderP}" var="mylist1">
									<tr valign="middle" id="tr1">
										<td rowspan="2"><div class="gdsDes">${mylist1.PROD_THUMB }</div></td>
										<th colspan="2">${mylist1.PROD_NAME }</th>
										<td rowspan="2" align="center" >
											<c:set var="sprice" value="${mylist1.PROD_PRICE * mylist1.PROD_COUNT }"/>
											<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
											</span>
										</td>
									</tr>
									<tr valign="middle" id="tr2">
										<td align="right"><fmt:formatNumber value="${mylist1.PROD_PRICE}" pattern="#,###"/> 원</td>
										<td>${mylist1.PROD_COUNT } 개</td>
									</tr>
									<c:set var="price" value="${price + sprice}"/>
								</c:forEach>
							<tr align="center" style="border-collapse: collapse; outline: 0; border: 0;">
								<td colspan="3"></td>
								<td><b>총 <font color="red"><fmt:formatNumber value="${price}" pattern="#,###"/> </font> 원</b></td>
							</tr>

						</table>

						<br/><br/>
						</c:otherwise>
						</c:choose>
						</div>
						
						<h5>
							<b>대여 상품</b>&nbsp;&nbsp;
						</h5>
						<hr/>
						
						<div id="rental">
						<c:choose>
						<c:when test="${dorderR.size() == 0}">
						<br/><br/>
						<div>
							<center>
								주문한 상품이 없습니다.
							</center>
						</div>
						<br/><br/>
						<hr/>
						<br/><br/>
						</c:when>
						<c:otherwise>

						<table class="table" id="table2">
							<colgroup>
								<col width="25%" />
								<col width="45%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<tr align="center" bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<th colspan="3">상품 정보</th>
								<th>상품 가격</th>
							</tr>
								<c:forEach items="${dorderR}" var="mylist2">
									<tr valign="middle"  id="tr1">
										<td rowspan="2"><div class="gdsDes">${mylist2.PROD_THUMB }</div></td>
										<th colspan="2">${mylist2.PROD_NAME }</th>
										<td rowspan="2" align="center" >
											<c:set var="sprice" value="${mylist2.PROD_RPRICE * mylist2.PROD_COUNT }"/>
											<span id="sprice">
											<b><fmt:formatNumber value="${sprice}" pattern="#,###"/> 원</b>
											</span>
										</td>
									</tr>
									<tr valign="middle" id="tr2">
										<td align="right"><fmt:formatNumber value="${mylist2.PROD_RPRICE}" pattern="#,###"/> 원</td>
										<td>${mylist2.PROD_COUNT } 개</td>
									</tr>
									<c:set var="rprice" value="${rprice + sprice}"/>
								</c:forEach>
							<tr align="center" style="border-collapse: collapse; outline: 0; border: 0;">
								<td colspan="3"></td>
								<td><b>총 <font color="red"><fmt:formatNumber value="${rprice}" pattern="#,###"/> </font> 원</b></td>
							</tr>

						</table>
						
						<br/><br/>
						</c:otherwise>
						</c:choose>
						</div>
	
						
						<h5><b>결제 정보</b></h5>
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right">총 상품가격 </td>
								<td width="80%">
									<c:set var="totalPrice" value="${price + rprice}"/>
									<fmt:formatNumber value="${totalPrice}" pattern="#,###"/> 원
								</td>
							</tr>
							<tr>
								<td align="right">배송비 </td>
								<td>
									<fmt:formatNumber value="${border.ORDER_DPRICE}" pattern="#,###"/> 원
								</td>
							</tr>
							<tr>
								<td align="right"><b>총 결제금액 </b></td>
								<td>
									<c:set var="lastPrice" value="${totalPrice + border.ORDER_DPRICE}"/>
									<b><font color="red"><fmt:formatNumber value="${lastPrice}" pattern="#,###"/></font> 원</b>
								</td>
							</tr>
							<tr>
								<td align="right">결제방식 </td>
								<td>${border.ORDER_PAYTYPE}</td>
							</tr>
						</table>
						<br/><br/>
						
						<div id="last">
							<center>
								<a href="../prod/main"><button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold;" class="btn btn-outline-dark" id="goMain">메인으로</button></a>
							</center>
						</div>

						
						
					</div>
				</section>
			</main>
</body>
</html>
