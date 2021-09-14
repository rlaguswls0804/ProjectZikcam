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
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<form id="frm">
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
			<input type="hidden" name="REVIEW_NUM" value="${map.REVIEW_NUM }">
				<h4>
					<input type="text" id="REVIEW_TITLE" name="REVIEW_TITLE" value="${map.REVIEW_TITLE }"><br />
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
				평점 : <input type="text" name="REVIEW_LIKE" id="REVIEW_LIKE" value="${map.REVIEW_LIKE }" style="width : 30px;">점 
				| 조회수 : ${map.REVIEW_HITCOUNT }

				<hr />
				<div style="text-align: center">
					<img src="dsdasdsadsa.jog" width="40%" height="40%">
				</div>
				<br>
				<textarea id="REVIEW_CONTENT" name="REVIEW_CONTENT" rows="10" cols="150">
				${map.REVIEW_CONTENT }
				</textarea>

				<hr />

				<!-- 						하단 버튼 -->
				<table align="right">
					<tr>
						<td><a href="#this" class="btn" id="modify"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">수정 완료</button></a>&nbsp;&nbsp;&nbsp; <a
							href="#this" id="delete"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">후기 삭제</button></a>&nbsp;&nbsp;&nbsp; <a
							href="#this" class="btn" id="list"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">내 구매후기</button></a></td>
					</tr>
				</table>

			</div>
		</section>
		</form>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#modify").on("click", function(e) { //목록으로 버튼 
				e.preventDefault();
				fn_updateReview();
			});
			$("#delete").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_deleteReview();
			});
			$("#list").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_openReviewList();
			});
		});
		function fn_updateReview() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../myPage/myReviewModify' />");
			comSubmit.submit();
		}
		function fn_deleteReview() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myReviewList' />");
			comSubmit.addParam("REVIEW_NUM", $("#REVIEW_NUM").val());
			comSubmit.submit();
		}
		function fn_openReviewList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myReviewList' />");
			comSubmit.submit();
		}
	</script>


</body>
</html>
