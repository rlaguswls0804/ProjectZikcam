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
						<font color="gray">*이미지, 동영상 첨부하실 때는 반드시 줄 바꿈(Enter)후 첨부해주세요.</font>
						<hr />
					
						<form id="frm" name="frm" enctype="multipart/form-data">
						<table class="table">
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">수정하기</th> 
							</tr>
							<tr>
								<th scope="row" width="25%">제목</th>
									<td colspan="3"><input type="text" name="NOTICE_TITLE" id="NOTICE_TITLE" 
									 value="${map.NOTICE_TITLE}" style="width:100%;"></td>
							</tr>
							<tr> 
								<th scope="row" width="25%">글번호</th>
									<td>
										${map.NOTICE_NUM}
										<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM}">
									</td>
								<th scope="row" width="25%">분류</th>
									<td> 
										<select id="NOTICE_CATEGORY" name="NOTICE_CATEGORY" size="1">
											<option value="${map.NOTICE_CATEGORY}" id="NOTICE_CATEGORY">${map.NOTICE_CATEGORY}</option>
											<option value="공지사항" id="NOTICE_CATEGORY">공지사항</option>
											<option value="이벤트" id="NOTICE_CATEGORY">이벤트</option>
											<option value="정보" id="NOTICE_CATEGORY">정보</option>
											<option value="기타" id="NOTICE_CATEGORY">기타</option>
										</select>
									</td>
							</tr>
							<tr>
								<th scope="row" width="25%">조회수</th>
									<td width="25%">${map.NOTICE_HITCOUNT}</td>
								<th scope="row" width="25%">작성일</th>
									<td width="25%">${map.NOTICE_DATE}</td>
							</tr>
							
							<tr bgcolor="#212926" style="color: white; border-collapse: collapse; outline: 0; border: 0;" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4"><textarea style="width:100%;" rows="15" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">
									${map.NOTICE_CONTENT}</textarea>
								</td>
							
							</tr>
							<%-- <tr>
								<th scope="row">첨부파일</th>
								<td colspan="3">
									<div id="fileDiv">				    <!-- varStatus.index -> 몇번째꺼 인지 -->
										<c:forEach var="row" items="${list}" varStatus="var">
											<p>
												<input type="hidden" id="FILE_PARENT_NUM" name="FILE_PARENT_NUM_${var.index}" value="${row.FILE_PARENT_NUM}">
												<a href="#this" id="name_${var.index}" name="name_${var.index}">${var.FILE_STD}</a>
												<input type="file" id="file_${var.index}" name="file_${var.index}"> 
												<!-- 파일 삭제 버튼 -->
												<a href="#this" class="btn" id="delete_${var.index}" name="delete_${var.index}">[삭제]</a>
											</p>
										</c:forEach>
									</div>
								</td>
							</tr> --%>
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
		var gfv_count = '${fn:length(list)+1}';
		
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openNoticeList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateNotice();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteNotice();
			});
			
		});
		
		var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 };
				 
				 CKEDITOR.replace("NOTICE_CONTENT", ckeditor_config);
		
		function fn_openNoticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/noticeList'/>");
			comSubmit.submit();
		}
		
		function fn_updateNotice(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../cs/noticeModify'/>");
			comSubmit.submit();
		}
		
		function fn_deleteNotice(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/noticeDelete'/>");
			comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
			comSubmit.submit();
			
		}
		
		
	</script>
</body>
</html>
