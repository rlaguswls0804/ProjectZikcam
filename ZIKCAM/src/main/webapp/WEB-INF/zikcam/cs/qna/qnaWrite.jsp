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
						
						관리자가 아닐때만 활성화
						<form id="frm" name="frm" method="GET" enctype="multipart/form-data">
						<table class="table">
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">문의추가</th>
							</tr>
							
							<tr>
								<th scope="row" width="20%">제목</th>
									<td><input type="text" name="QNA_TITLE" id="QNA_TITLE" style="width:100%;"></td>
							</tr>
							
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4">
									<textarea style="width:100%; height: 500" rows="15" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
								</td>
							
							</tr>
							<!-- <tr>
								<th scope="row">첨부파일</th>
									<td colspan="4">
									<div id="fileDiv">
										<p>
											<input type="file" name="file_0"/>
											<a href="#this" class="btn" id="delete" name="delete">[삭제]</a>
										</p>
									</div>
								</td>
							</tr> -->
							
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
				fn_openQnaList();
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
				 
				 CKEDITOR.replace("QNA_CONTENT", ckeditor_config);
		
		//목록으로 가기
		function fn_openQnaList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/qnaList' />");
			comSubmit.submit();
		}
		//작성하기
		function fn_insertQna(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../cs/qnaWrite' />");
			comSubmit.submit();
		}
		/* //파일 추가
		function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>[삭제]</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});		
		} */
		
		function fn_deleteFile(obj) {
			obj.parent().remove();
		}
		
		//유효성검증, 데이터입력  
		function fn_validation(table) { 	   	   
		   if(!$("#QNA_TITLE").val()){
			  alert("제목을 입력해주세요.");
			  $("#QNA_TITLE").focus();
			  return false;
			}else{
				fn_insertQna();
			}
		}
</script>
</body>
</html>
