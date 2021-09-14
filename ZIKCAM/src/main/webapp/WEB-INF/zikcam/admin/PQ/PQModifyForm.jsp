<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
</head>
<body>
	<main>
		<section class="py-5">
			<div style="width: 90%;" class="container px-4 px-lg-5 mt-5">
				<h3>문의 수정</h3>
				<br/> <br/> 
				<div align="center" style="overflow:auto;">
					<!--  문의 수정 영역 -->
					<form id="modifyForm">
						<hr/>
						<table>
							<tr>
								<td colspan="1" align="center" style="background-color:#E6E6E6;">제목</td>
								<td colspan="3">
									<input style="width:100%;" type="text" id="TITLE" name="TITLE" value="${map.PQ_TITLE }"/>
								</td>
							</tr>
							<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">내용</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<textarea style=" width:100%;" id="CONTENT" name="CONTENT" rows="20" cols="100" title="${map.PQ_CONTENT }">${map.PQ_CONTENT }</textarea>
								<input type="hidden" id="NUM" name="NUM" value="${map.PQ_NUM }">
							</td>
						</tr>
						</table>
						<br/><br/><hr/>
					</form>
				
				<!-- 하단 버튼 영역 -->
				<table align="right">
					<tr>
						<td>
							<button
								class="btn btn-outline-dark" value="list" id="list"
								onclick="location.href = '#this'">문의내역</button>&nbsp;&nbsp;&nbsp;
							<button
								class="btn btn-outline-light" value="modify" id="modify"
								onclick="location.href = '#this'">답변수정</button>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
				<br/> <br/> <br/>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) {
				e.preventDefault();
				fn_openPQList();
			});
		});
		
		$(document).ready(function() {
			$("#modify").on("click", function(e) {
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

		function fn_openPQList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/PQList' />");
			comSubmit.submit();
		}
		
		function fn_modifyPQ(){
				var comSubmit = new ComSubmit("modifyForm");
				comSubmit.setUrl("<c:url value='/admin/PQModify' />");
				comSubmit.submit();
		}
		
		function fn_validation(table) { 	   	   
			if(CKEDITOR.instances.CONTENT.getData() == '' 
					|| CKEDITOR.instances.CONTENT.getData().length == 0){
			alert("내용을 입력해주세요.");
			 $("#CONTENT").focus();
				  return false;
				}else if(!$("#TITLE").val()){
					alert("제목을 입력해주세요.");
				}else
					fn_modifyPQ();
			}
		
	</script>
</body>
</html>