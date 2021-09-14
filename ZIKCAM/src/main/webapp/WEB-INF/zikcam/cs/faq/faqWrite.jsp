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
						<form id="frm" name="frm" method="get" enctype="multipart/form-data">
						<table class="table">
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">질문</th>
							</tr>
							<tr>
								
								<th scope="row" width="25%" align="left">분류</th>
									<td>
										<select id="FAQ_CATEGORY" name="FAQ_CATEGORY" size="1">
											<option value="">선택하세요.</option>
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
								<td colspan="4"><textarea style="width:100%;" rows="15" title="내용" id="FAQ_QUESTION" name="FAQ_QUESTION"></textarea></td>
							
							</tr>
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">답변내용</th>
							</tr>
							<tr>
								<td colspan="4"><textarea style="width:100%;" rows="15" title="내용" id="FAQ_ANSWER" name="FAQ_ANSWER"></textarea></td>
							
							</tr>
						</table>
						
						<a href="#this" id="write" style="float: right;">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">작성하기
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
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_validation();
			});	
			
		});	
		
		var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 };
				 
				CKEDITOR.replace("FAQ_QUESTION", ckeditor_config);
		
		 var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 };
				 
				 CKEDITOR.replace("FAQ_ANSWER", ckeditor_config);
		
		//목록으로 가기
		function fn_openFaqList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/faqList' />");
			comSubmit.submit();
		}
		//작성하기
		function fn_insertFaq(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../cs/faqWrite'/>");
			comSubmit.submit();
		}
		
		
		
		//유효성검증, 데이터입력  
		function fn_validation(table) { 
		   
		   if(!$("#FAQ_CATEGORY").val()){
		      alert("카테고리를 선택해주세요.");
		      $("#FAQ_CATEGORY").focus();
		      return false;
			}else{
				fn_insertFaq();
			}
		}
</script>
</body>
</html>
