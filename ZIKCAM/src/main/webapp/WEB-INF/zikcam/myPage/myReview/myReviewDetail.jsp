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
			
			<h4>${map.REVIEW_TITLE }<br />
			</h4>
			${map.MEMBER_ID } | ${map.REVIEW_DATE } |
			<c:forEach var="like" begin="1" end="5">
				<c:choose>
					<c:when test="${map.REVIEW_LIKE >= like }">
							★
						</c:when>
					<c:otherwise>
							☆
						</c:otherwise>
				</c:choose>
			</c:forEach>
			| 조회수 : ${map.REVIEW_HITCOUNT }

			<hr />
			<div style="text-align: center">
				<img src="dsdasdsadsa.jog" width="40%" height="40%">
			</div>
			<br> ${map.REVIEW_CONTENT }

			<hr />

			<!-- 						하단 버튼 -->
			<table align="right">
				<tr>
					<td><a
						href="../myPage/myReviewModifyForm?REVIEW_NUM=${map.REVIEW_NUM }">
							<button
								style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
								value="update">후기 수정</button>
					</a>&nbsp;&nbsp;&nbsp; <a href="../myPage/myReviewList"><button
								style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
								value="update">내 구매후기</button></a>&nbsp;&nbsp;&nbsp;
						<button
							style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
							value="update">상품페이지</button></td>
				</tr>
			</table>

			</div>
		</section>
	</main>
</body>
</html>
