<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
					
					
<%-- 					<c:choose> --%>
<%-- 						<c:when test=${sortType == 'PQ' }><h3>ProductQuestion</h3></c:when> --%>
<%-- 						<c:otherwise><h3>REVIEW</h3></c:otherwise> --%>
<%-- 					</c:choose> --%>
						
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">*이미지, 동영상 첨부하실 때는 반드시 줄 바꿈(Enter)후 첨부해주세요.</font>
						
						<hr />
						<form id="frm" name="frm" method="GET" enctype="multipart/form-data">
						<input type="hidden" id="sortType" name="sortType" value="${sortType }">
						<input type="hidden" id="PROD_NUM" name="PROD_NUM" value="${PROD_NUM }">
						<table class="table">
							
							<tr>
								<th scope="row" width="20%">제목</th>
									<td>
									<input type="text" name="TITLE" id="TITLE" style="width:80%;">
									<c:if test="${sortType == 'REVIEW' }">
									평점 : <input type="text" name="REVIEW_LIKE" id="REVIEW_LIKE" value="${map.REVIEW_LIKE }" style="width : 30px;">점
									</c:if>
									</td>
							</tr>
							
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">내용</th>
							</tr>
							<tr>
								<td colspan="4">
									<textarea style="width:100%; height: 500" rows="15" title="내용" id="CONTENT" name="CONTENT"></textarea>
								</td>
							
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
				 
				 CKEDITOR.replace("CONTENT", ckeditor_config);
		
		//목록으로 가기
		function fn_openQnaList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../prod/prodDetail' />");
			comSubmit.submit();
		}
		//작성하기
		function fn_insertQR(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../prod/insertQR' />");
			comSubmit.submit();
		}

		
		//유효성검증, 데이터입력  
		function fn_validation(table) { 	   	   
			if(!${MEMBER_ID != NULL }){
				alert("로그인을 해주세요.");
				return false;
			}else  if(!$("#TITLE").val()){
			  alert("제목을 입력해주세요.");
			  $("#TITLE").focus();
			  return false;
			}else{
 				fn_insertQR();
			}
		}
</script>
</body>
</html>
