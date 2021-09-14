<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>FAQ</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">*이미지, 동영상 첨부하실 때는 반드시 줄 바꿈(Enter)후 첨부해주세요.</font>
						<hr />
						
						<!-- 질문 -->
						<form id="frm">
			 			<table class="table">
			 				<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">질문</th>
							</tr> 
							<tr>
								<th scope="row" width="25%" align="center">글번호</th>
									<td width="25%" align="left">${map.FAQ_NUM}<input type="hidden" name="FAQ_NUM" id="FAQ_NUM"  value="${map.FAQ_NUM}"></td>
								<th scope="row" width="25%" align="center">분류</th>
									<td width="25%">
										<select id="FAQ_CATEGORY" name="FAQ_CATEGORY" size="1">
											<option value="${map.FAQ_CATEGORY}" id="FAQ_CATEGORY">${map.FAQ_CATEGORY}</option>
											<option value="배송문의" id="FAQ_CATEGORY">배송문의</option>
											<option value="반품/교환/환불" id="FAQ_CATEGORY">반품/교환/환불</option>
											<option value="주문/결제" id="FAQ_CATEGORY">주문/결제</option>
											<option value="회원서비스" id="FAQ_CATEGORY">회원서비스</option>
										</select>
									</td>
							</tr>
							
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">질문내용</th>
							</tr>
							<tr>
								<td colspan="4">
								<textarea style="width:100%;" rows="15" title="내용" id="FAQ_QUESTION" name="FAQ_QUESTION">${map.FAQ_QUESTION}</textarea></td>
							
							</tr>
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">답변내용</th>
							</tr>
							<tr>
								<td colspan="4">
								<textarea style="width:100%;" rows="15" title="내용" id="FAQ_ANSWER" name="FAQ_ANSWER">${map.FAQ_ANSWER}</textarea></td>
							
							</tr>
						</table>
							
						<a href="#this" id="delete" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">삭제하기
				            </button>
						</a>
						
						<a href="#this" id="update" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">저장하기
				            </button>
						</a>
						
						<a href="#this" id="list" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">목록가기
				            </button>
						</a>
						
					</form>	
					
					</div>
				</section>
			</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openFaqList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateFaq();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteFaq();
			});
		});
		
		function fn_openFaqList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/faqList' />");
			comSubmit.submit();
		}
		
		function fn_updateFaq(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../cs/faqModify' />");
			comSubmit.submit();
		}
		
		function fn_deleteFaq(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/faqDelete' />");
			comSubmit.addParam("FAQ_NUM", $("#FAQ_NUM").val());
			comSubmit.submit();
			
		}
	</script>
</body>
</html>
