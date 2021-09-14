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
						<h3>Q&A</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">*이미지, 동영상 첨부하실 때는 반드시 줄 바꿈(Enter)후 첨부해주세요.</font>
						<hr />
						
					
					
						
						<form id="frm" name="frm" enctype="multipart/form-data">
						<table class="table">
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">수정하기</th>
							</tr>
							<tr>
								<th scope="row" width="25%">제목</th>
									<td colspan="3"><input type="text" name="QNA_TITLE" id="QNA_TITLE" style="width:100%;" value="${boardMap.QNA_TITLE}" ></td>
								
							</tr>
							<tr>
								<th scope="row" width="25%">답변상태</th>
									<td>${boardMap.QNA_REPLY_CH}</td>
								<th scope="row" width="25%">글번호</th>
									<td>
										${boardMap.QNA_NUM}
										
									</td>
							</tr>
							
							<tr>
								<th scope="row" width="25%">작성일</th>
									<td width="25%">${boardMap.QNA_DATE}</td>
								<th scope="row" width="25%">작성자</th>
									<td width="25%">${boardMap.MEMBER_ID}</td>	
							</tr>
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4">
									<textarea style="width:100%;" rows="15" title="내용" id="QNA_CONTENT" name="QNA_CONTENT">
									${boardMap.QNA_CONTENT}</textarea>
									<input type="hidden" name="QNA_NUM" ID="QNA_NUM" value="${boardMap.QNA_NUM}">
								</td>
							
							</tr>
							
						</table>
						</form>
					
						
						
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
			
			$("#update").on("click", function(e){ //문의수정 버튼
				e.preventDefault();
				fn_openQnaUpdate();
			});
		});
		
		var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 };
				 
				CKEDITOR.replace("QNA_CONTENT", ckeditor_config);
	
		function fn_openQnaList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/qnaList' />");
			comSubmit.submit();
		}
		
		function fn_openQnaUpdate(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../cs/qnaModify'/>");
			/* comSubmit.addParam("QNA_NUM", $("#QNA_NUM").val()); */
			comSubmit.submit();
		}
</script>		
</body>
</html>
