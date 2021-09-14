<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
</head>
<body>
	
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>직캠소식</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">직접고르는 캠핑용품</font>
						<hr />
						<table class="table">
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">직캠소식 상세보기</th>
							</tr>
							<tr>
								<th scope="row" width="25%">분류</th>
									<td>${map.NOTICE_CATEGORY}</td>
								<th scope="row" width="25%">글번호</th>
									<td>
										${map.NOTICE_NUM}
										<input type="hidden" id="NOTICE_NUM" value="${map.NOTICE_NUM}"/>
									</td>
							</tr>
							<tr>
								<th scope="row" width="25%">제목</th>
									<td>${map.NOTICE_TITLE}</td>
								<th scope="row" width="25%">작성일</th>
									<td width="25%">${map.NOTICE_DATE}</td>
							</tr>
							<tr>
								<th scope="row" width="25%">조회수</th>
									<td>${map.NOTICE_HITCOUNT}</td>
							</tr>
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4"><div class="gdsDes">${map.NOTICE_CONTENT}</div></td>
							
							</tr>
							<%-- <tr>
							<td scope="row">이미지</td>
								<td colspan="3">
									<c:forEach var="row" items="${list}">
										<p>
											<input type="hidden" id="FILE_TABLE_NUM" value="${map.NOTICE_NUM}"/>
											<img src="${row.FILE_STD}" width="300" height="200"><br />
										</p>
									</c:forEach>
								</td>
							</tr> --%>
						</table>
					<%-- <c:if test="${member.MEMBER_RANK == 0}"> --%>
						<a href="#this" id="delete" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">삭제하기
				           	</button>
						</a>
						<a href="#this" id="update" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">수정하기
				           	</button>
						</a>
						<a href="#this" id="list" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">목록으로
				           	</button>
						</a>
					<%-- </c:if> --%>	
					</div>
				</section>
			</main>
			
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openNoticeUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteNotice();
			});
			
		});
		
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/noticeList' />");
			comSubmit.submit();
		}
		
		
		function fn_openNoticeUpdate(){
			var idx = "${map.NOTICE_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openNoticeUpdate'/>");
			comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
			comSubmit.submit();
		}
		
		function fn_deleteNotice(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/noticeDelete' />");
			comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
			comSubmit.submit();
			
		}
		
	</script>
</body>
</html>
