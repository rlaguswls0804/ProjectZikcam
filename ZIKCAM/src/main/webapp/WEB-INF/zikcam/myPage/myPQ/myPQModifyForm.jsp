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
		<%@ include file="/WEB-INF/include/include-header.jspf"%>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<form id="frm">
					<c:forEach items="${list }" var="list">
						<c:choose>
							<c:when test="${list.MEMBER_ID eq map.MEMBER_ID}">
								<h4>
									<input type="hidden" name="NUM" id="NUM" value="${list.NUM }">
									<input type="hidden" name="PQ_NUM" id="PQ_NUM" value="${list.NUM }">
									<input type="hidden" name="QNA_NUM" id="QNA_NUM" value="${list.NUM }">
									 <input type="text" id="TITLE" name="TITLE" value="${list.TITLE }"><br />
								</h4>
						${list.MEMBER_ID } | ${list.CDATE }

						<hr />
								<!-- 						이미지 영역 -->
								<div style="text-align: center">
									<img src="dsdasdsadsa.jog" width="40%" height="40%">
								</div>
								<!-- 						내용 영역 -->
								<br>
								<textarea id="CONTENT" name="CONTENT" rows="10" cols="150">${list.CONTENT }
						</textarea>
								<hr />
								<br />
								<br />
								<hr />
							</c:when>
							<c:otherwise>
								<h4>
									${list.TITLE }<br />
								</h4>
						${list.MEMBER_ID } | ${list.CDATE }

						<hr />
								<!-- 						이미지 영역 -->
								<div style="text-align: center">
									<img src="dsdasdsadsa.jog" width="40%" height="40%">
								</div>
								<!-- 						내용 영역 -->
								<br> ${list.CONTENT }
						<hr />
								<br />
								<br />
								<hr />
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</form>
				<!-- 						하단 버튼 영역 -->
				<table align="right">
					<tr>
					<td>
						<c:choose>
								<c:when test="${empty map.QNA_NUM }">
								
						<a href="#this" id="pqmodify"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">수정하기</button></a>&nbsp;&nbsp;&nbsp; <a href="#this"
							id="pqdelete"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">삭제하기</button></a>&nbsp;&nbsp;&nbsp; <a href="#this"
							id="pqlist">
								<button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">내 문의</button>
						</a>
						</c:when>
						<c:otherwise>
							<a href="#this" id="qnamodify"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">수정하기</button></a>&nbsp;&nbsp;&nbsp; <a href="#this"
							id="qnadelete"><button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">삭제하기</button></a>&nbsp;&nbsp;&nbsp; <a href="#this"
							id="qnalist">
								<button
									style="outline: 0; border: 0; border-radius: 6px; width: 100px; background-color: black; color: white;"
									value="update">내 문의</button></a>
						</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</table>

			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#pqmodify").on("click", function(e) { //목록으로 버튼 
				e.preventDefault();
				fn_updatePQ();
			});
			$("#pqdelete").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_deletePQ();
			});
			$("#pqlist").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_openPQList();
			});
			$("#qnamodify").on("click", function(e) { //목록으로 버튼 
				e.preventDefault();
				fn_updateQNA();
			});
			$("#qnadelete").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_deleteQNA();
			});
			$("#qnalist").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_openQNAList();
			});
		});
		function fn_updatePQ() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../myPage/myPQModify' />");
			comSubmit.submit();
		}
		function fn_deletePQ() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myPQDelete' />");
			comSubmit.addParam("PQ_NUM", $("#NUM").val());
			comSubmit.submit();
		}
		function fn_openPQList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myPQList' />");
			comSubmit.submit();
		}
		function fn_updateQNA() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../myPage/myQNAModify' />");
			comSubmit.submit();
		}
		function fn_deleteQNA() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myQNADelete' />");
			comSubmit.addParam("QNA_NUM", $("#NUM").val());
			comSubmit.submit();
		}
		function fn_openQNAList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../myPage/myPQList' />");
			comSubmit.addParam("list", "QNA");
			comSubmit.submit();
		}

		
	</script>

</body>
</html>
