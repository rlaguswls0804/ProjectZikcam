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
						<h3>직캠소식</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">*이미지, 동영상 첨부하실 때는 반드시 줄 바꿈(Enter)후 첨부해주세요.</font>
						<hr />
						
						<form id="frm" name="frm" method="get" enctype="multipart/form-data">
						<table class="table">
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">직캠소식 등록</th>
							</tr>
							<tr>
								<th scope="row" width="25%">분류</th>
									<td> 
										<select id="NOTICE_CATEGORY" name="NOTICE_CATEGORY" size="1">
											<option value="">선택하세요.</option>
											<option value="공지사항" id="NOTICE_CATEGORY">공지사항</option>
											<option value="이벤트" id="NOTICE_CATEGORY">이벤트</option>
											<option value="정보" id="NOTICE_CATEGORY">정보</option>
											<option value="기타" id="NOTICE_CATEGORY">기타</option>
										</select>
									</td>
								
					 		</tr>
							<tr>
								<th scope="row" width="20%">제목</th>
									<td><input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE" style="width: 100%"></td>
				
							</tr>
							
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4"><textarea style="width:100%;" rows="15" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea></td>
								
							</tr>
							<!-- <tr>
								<th scope="row">첨부파일</th>
								<td colspan="4">
								<input type="file" name="file">
									<div id="fileDiv">
										<p>
											<input type="file" name="file_0"/>
											<a href="#this" class="btn" id="delete" name="delete">[삭제]</a>
										</p>
									</div>
							 	</td>
							</tr> -->
							
						</table>
					
						<hr/>
						
						 
						
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
		/* <input type="file">태그의 name이 동일한 경우 서버에는 단 하나의 파일만 전송되는 문제 발생 */
		/* 태그가 추가될때 마다 그 값을 1씩 증가시켜 name값이 계속 바뀌도록 함 */
		var gfv_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_validation();
			});
			
			$("#addFile").on("click", function(e){ //파일추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("#a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});	
		
		/* $(function(){
			CKEDITOR.replace('NOTICE_CONTENT',{
				filebrowserUploadUrl: '${pageContext.request.contextPath }/mine/imageUpload'
			});
		}); */
		 var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 }; 
				 
				 CKEDITOR.replace("NOTICE_CONTENT", ckeditor_config);
		
		
		
		/* $(function(){
    		CKEDITOR.replace('#NOTICE_CONTENT',{
                width:'100%',
                height:'600px',
    			filebrowserUploadUrl: "<c:url value='../ckeditor/fileupload'/>"
    		});
    	}); */
		
		//목록으로 가기
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/noticeList' />");
			comSubmit.submit();
		}
		//작성하기
		function fn_insertNotice(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../cs/noticeWrite' />");
			comSubmit.submit();
		}
		//파일 추가
		function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>[삭제]</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});		
		}
		
		function fn_deleteFile(obj) {
			obj.parent().remove();
		}
		
		//유효성검증, 데이터입력  
		function fn_validation(table) { 	   
		   if(!$("#NOTICE_CATEGORY").val()){
		      alert("카테고리를 선택해주세요.");
		      $("#NOTICE_CATEGORY").focus();
		      return false;
			}else
		   if(!$("#NOTICE_TITLE").val()){
			  alert("제목을 입력해주세요.");
			  $("#NOTICE_TITLE").focus();
			  return false;
			}/* else
		   if(!$("#NOTICE_CONTENT").val()){
			  alert("내용을 입력해주세요.");
			  $("#NOTICE_CONTENT").focus();
			  return false;
			} */else{
				fn_insertNotice();
			}
		}
	</script>
</body>
</html>
