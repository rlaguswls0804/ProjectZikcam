<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
</head>
<body>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<table style="width:95%;">
						<tr>
							<td colspan="1" align="center" style="background-color:#E6E6E6;">제목</td>
							<td colspan="5">${map.REVIEW_TITLE }</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#E6E6E6;">평점</td>
							<td>
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
							</td>
							<td align="center" style="background-color:#E6E6E6;">작성자</td>
							<td>${map.MEMBER_ID }</td>
							<td align="center" style="background-color:#E6E6E6;">작성일</td>
							<td>${map.REVIEW_DATE }</td>
						</tr>
						<tr>
							<td colspan="6" align="center" style="background-color:#E6E6E6;">내용</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="6">
								<div class="gdsDes">${map.REVIEW_CONTENT }</div>
							</td>
						</tr>
					</table>
				<br> <hr />
				<!-- 						하단 버튼 -->
				<table align="right">
					<tr>
						<td>
							<button
								class="btn btn-outline-dark" value="list" id="list"
								onclick="location.href = '#this'">후기목록</button>&nbsp;&nbsp;&nbsp;
							<c:if test="${map.REVIEW_DEL == 0}">		
								<button
									class="btn btn-outline-alert" value="delete" id="delete"
									onclick="location.href = '#this'">후기삭제</button>&nbsp;&nbsp;&nbsp;</c:if>
					</tr>
				</table>

			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) {
				e.preventDefault();
				fn_openReivewList();
			});
		});
		
		$(document).ready(function() {
			$("#delete").on("click", function(e) {
				e.preventDefault();
				fn_ReviewAlert();
			});
		});
		
		function fn_openReviewList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/ReviewList' />");
			comSubmit.submit();
		}
		
		function fn_deleteReview(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/ReivewDelete' />");
			comSubmit.addParam("NUM", $("#NUM").val());
			comSubmit.submit();
		}
		
		function fn_ReviewAlert(){
			if(!confirm("문의가 삭제처리 됩니다. 계속하시겠습니까?")){
				alert("삭제가 취소되었습니다.");
				return false;
			}else{
				alert("문의가 삭제되었습니다.");
				fn_deleteReview();
			}
		}
		
	</script>
</body>
</html>
