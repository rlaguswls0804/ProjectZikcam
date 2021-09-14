<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
<body>
	
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>Q&A</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">상품문의는 구매내역에서 작성하실 수 있습니다.</font>
						<hr />
						<table class="table">
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">문의 상세보기</th>
							</tr>
							<tr>
								<th scope="row" width="25%">답변상태</th>
									<td>${boardMap.QNA_REPLY_CH}</td>
								<th scope="row" width="25%">글번호</th>
									<td>
										${boardMap.QNA_NUM}
										<input type="hidden" name="QNA_NUM" ID="QNA_NUM" value="${boardMap.QNA_NUM}">
									</td> 
							</tr>
							<tr>
								<th scope="row" width="25%">제목</th>
									<td colspan="3">${boardMap.QNA_TITLE}</td>
							</tr>
							<tr>
								<th scope="row" width="25%">작성일</th>
									<td width="25%">${boardMap.QNA_DATE}</td>
								<th scope="row" width="25%">작성자</th>
									<td>${boardMap.MEMBER_ID}</td>		
							</tr>
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4"><div class="gdsDes">${boardMap.QNA_CONTENT}</div></td>
							
							</tr>
							<%-- <tr>
							<td scope="row">첨부파일</td>
								<td colspan="3">
									<c:forEach var="row" items="${boardList}">
											<p>
												<input type="hidden" id="FILE_NUM" value="${row.IDX}"/>
												<img src="사진${row.ORIGINAL_FILE_NAME}" width="300" height="200"><br />
											</p>
									</c:forEach>
								</td>
							</tr> --%>
						</table>
						<br/>
						
						<c:if test="${boardMap.QNA_REPLY == 1}">
						
						<table class="table">
							<tr bgcolor="yellow" style="color: black; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">답변</th>
							</tr>
							<tr>
								<th scope="row" width="25%">작성자</th>
									<td width="25%">
										${answerMap.MEMBER_ID}
										<input type="hidden" name="QNA_NUM" ID="QNA_NUM" value="${answerMap.QNA_NUM}">
									</td>
								<th scope="row" width="25%">작성일</th>
									<td width="25%">${answerMap.QNA_DATE}</td>
								
							</tr>
							<tr>
								<td colspan="4"><div class="gdsDes">${answerMap.QNA_CONTENT}</div></td>
							
							</tr>
							
						</table>
						</c:if>
						
					
						<!-- *회원 전용 -->
						<%-- <c:if test="${member.MEMBER_RANK == 1}"> --%>
						<c:if test="${session_MEM_ID eq boardMap.MEMBER_ID && session_MEM_ID ne null && session_MEM_ID ne 'admin01'}">
							<a href="$this" id="delete" style="float: right;">
								<button class="btn btn-outline-dgray" 
				            		style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">문의삭제
				            	</button>
							</a>
							<a href="$this" id="update" style="float: right;">
								<button class="btn btn-outline-dgray" 
				            		style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">문의수정
				            	</button>
							</a>
						</c:if>	
						<%-- </c:if> --%>
						<!-- *관리자 전용 -->
						<%-- <c:if test="${member.MEMBER_RANK == 0}"> --%>
						<c:if test="${session_MEM_ID eq 'admin01'}">
							<c:if test="${boardMap.QNA_REPLY == 0}">
								<a href="$this" id="insert" style="float: right;">
									<button class="btn btn-outline-dgray" 
				            			style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">답변등록
				            		</button>
								</a>
							</c:if>
							<c:if test="${boardMap.QNA_REPLY == 1}">
								<a href="$this" id="updateReply" style="float: right;">
									<button class="btn btn-outline-dgray" 
				            			style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">답변수정
				            		</button>
								</a>
								<a href="$this" id="deleteReply" style="float: right;">
									<button class="btn btn-outline-dgray" 
				            			style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">답변삭제
				            		</button>
								</a>
							</c:if>
						</c:if>
						<%-- </c:if> --%>
							<a href="$this" id="list" style="float: right;">
								<button class="btn btn-outline-dgray" 
					            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">목록으로
					            </button>
							</a>
					</div>
				</section>
			</main>
			
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openQnaList();
			});
			
			$("#insert").on("click", function(e){ //답변등록 버튼
				e.preventDefault();
				fn_openAnswerInsert();
			});
			
			$("#update").on("click", function(e){ //문의수정 버튼
				e.preventDefault();
				fn_openQnaUpdate();
			});
			
			$("#delete").on("click", function(e){ //문의삭제 버튼
				e.preventDefault();
				fn_deleteQna();
			});
			
			$("#updateReply").on("click", function(e){ //답변수정 버튼
				e.preventDefault();
				fn_openQnaReplyUpdate();
			});
			
			$("#deleteReply").on("click", function(e){ //답변삭제 버튼
				e.preventDefault();
				fn_deleteQnaReply();
			});
			
		});
		
		function fn_openQnaList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/qnaList' />");
			comSubmit.submit();
		}
		
		function fn_openAnswerInsert(){
			var idx = "${boardMap.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openQnaReplyWrite'/>");
			comSubmit.addParam("QNA_NUM", $("#QNA_NUM").val());
			comSubmit.submit();
		}
		
		function fn_openQnaUpdate(){
			var idx = "${boardMap.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openQnaUpdate'/>");
			comSubmit.addParam("QNA_NUM", $("#QNA_NUM").val());
			comSubmit.submit();
		}
		
		function fn_deleteQna(){
			var idx = "${boardMap.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/qnaDelete' />");
			comSubmit.addParam("QNA_NUM", $("#QNA_NUM").val());
			comSubmit.submit();
			
		}
		
		function fn_openQnaReplyUpdate(){
			var idx = "${answerMap.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openQnaReplyModify'/>");
			comSubmit.addParam("QNA_NUM", $("#QNA_NUM").val());
			comSubmit.submit();
		}
		
		function fn_deleteQnaReply(){
			var idx = "${answerMap.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/qnaDeleteReply' />");
			comSubmit.addParam("QNA_NUM", $("#QNA_NUM").val());
			comSubmit.submit();
			
		}
		
		
		
	</script>
</body>
</html>
