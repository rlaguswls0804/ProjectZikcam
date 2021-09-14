<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
				<h3>문의 상세</h3>
				<br/> <br/> 
				<p style="color:#f82d24;">*모든 문의는 영업일 기준 48시간이 지나기 전에 답변이 되어야합니다.</p>
				<font color="gray">
					문의를 임의로 삭제할 경우 불이익이 발생할 수 있습니다. 고객의 요청이 있지 않은 경우 삭제를 지양하십시오.
				</font>
				<hr />
				<div align="center" style="overflow:auto;">
					<!--  회원 문의 영역 -->
					<table style="width:100%;">
						<tr>
							<td colspan="1" align="center" style="background-color:#E6E6E6;">제목</td>
							<td colspan="3">${map.QNA_TITLE }</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#E6E6E6;">작성자</td>
							<td>${map.MEMBER_ID }</td>
							<td align="center" style="background-color:#E6E6E6;">작성일</td>
							<td>${map.QNA_DATE }</td>
						</tr>
						<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">내용</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<div class="gdsDes">${map.QNA_CONTENT }</div>
							</td>
						</tr>
					</table>
						<input type="hidden" id="NUM" name="NUM" value="${map.QNA_NUM }">
						<input type="hidden" id="PNUM" name="PNUM" value="${map.QNA_NUM }">
						<c:if test="${empty sub.QNA_NUM }">
							<input type="hidden" id="SNUM" name="SNUM" value="0">
						</c:if>
					 <br>
					<br /> <br />
					<hr />
				</div>
				<!-- 관리자 답변 영역 -->
				<c:choose>
				<c:when test="${not empty sub.QNA_NUM }">
					<div>
					
						<!-- 관리자 답변 내용 -->
						<br> 
						<table style="width:100%; overflow:auto;">
						<tr>
							<td colspan="1" align="center" style="background-color:#E6E6E6;">제목</td>
							<td colspan="3">${sub.QNA_TITLE }</td>
						</tr>
						<tr>
							<td align="center" style="background-color:#E6E6E6;">작성자</td>
							<td>${sub.MEMBER_ID }</td>
							<td align="center" style="background-color:#E6E6E6;">작성일</td>
							<td>${sub.QNA_DATE }</td>
						</tr>
						<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">내용</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<div class="gdsDes">${sub.QNA_CONTENT }</div>
							</td>
						</tr>
					</table>
						<input type="hidden" id="SNUM" name="SNUM" value="${sub.QNA_NUM }">
						<hr />
					</div>
				</c:when>
				
				<c:when test="${empty sub.QNA_NUM && map.QNA_DEL == 0}">
					<form id="replyForm">
						<br/> <br/> <br/>
						<h4>답변하기</h4>
						<hr/>
						<table>
							<tr>
								<td colspan="1" align="center" style="background-color:#E6E6E6;">제목</td>
								<td colspan="3">
									<input style="width:100%;" type="text" id="TITLE" name="TITLE" value="답변입니다."/>
								</td>
							</tr>
							<tr>
							<td colspan="4" align="center" style="background-color:#E6E6E6;">내용</td>
						</tr>
						<tr style="min-height:100px;">
							<td colspan="4">
								<textarea style=" width:100%;" id="CONTENT" name="CONTENT" rows="20" cols="100" title="내용"></textarea>
							</td>
						</tr>
						</table>
						<input type="hidden" id="ID" name="ID" value="${session_MEM_ID }"/> <!-- 로그인 로직이 만들어지고 수정할 것 -->
						<input type="hidden" id="PNUM" name="PNUM" value="${map.QNA_NUM }">
						<br/><br/><hr/>
					</form>
				</c:when>
				</c:choose>
				<!-- 하단 버튼 영역 -->
				<table align="right">
					<tr>
						<td>
							<button
								class="btn btn-outline-dark" value="list" id="list"
								onclick="location.href = '#this'">문의내역</button>&nbsp;&nbsp;&nbsp;
							<c:if test="${empty sub.QNA_PNUM && map.QNA_DEL != 1}">
								<button
									class="btn btn-outline-light" value="reply" id="reply"
									onclick="location.href = '#this'">답변쓰기</button>&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${not empty sub.QNA_PNUM && map.QNA_DEL != 1}">
								<button
									class="btn btn-outline-light" value="modify" id="modify"
									onclick="location.href = '#this'">답변수정</button>&nbsp;&nbsp;&nbsp;</c:if>
							<c:if test="${map.QNA_DEL == 0}">		
								<button
									class="btn btn-outline-alert" value="delete" id="delete"
									onclick="location.href = '#this'">문의삭제</button>&nbsp;&nbsp;&nbsp;</c:if>
						</td>
					</tr>
				</table>
				<br/> <br/> <br/>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) {
				e.preventDefault();
				fn_openQnAList();
			});
		});
		
		$(document).ready(function() {
			$("#reply").on("click", function(e) {
				e.preventDefault();
				fn_validation();
			});
		});
		
		$(document).ready(function() {
			$("#modify").on("click", function(e) {
				e.preventDefault();
				fn_openModifyFrom();
			});
		});
		
		$(document).ready(function() {
			$("#delete").on("click", function(e) {
				e.preventDefault();
				fn_QnAAlert();
			});
		});
		
		var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 }; 
				 
				 CKEDITOR.replace("CONTENT", ckeditor_config);

		function fn_openQnAList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QnAList' />");
			comSubmit.submit();
		}
		
		function fn_replyQnA(){
				var comSubmit = new ComSubmit("replyForm");
				comSubmit.setUrl("<c:url value='/admin/QnAReply' />");
				comSubmit.submit();
		}
		
		function fn_deleteQnA(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QnADelete' />");
			if($("#PNUM").val()){
				comSubmit.addParam("SNUM", $("#SNUM").val());
			}else if(!$("#PNUM").val){
				comSubmit.addParam("SNUM", 0); 
				//삭제로직은 글번호의 값이 0이 아닌 경우를 판단해서 작동하므로 시퀀스 시작값이 1이어야하고 DB에 글번호 0번이 존재하지 않아야함
				//엄밀히 설명하면 글번호가 0인 글을 삭제하면 파라미터값을 받아오지 못하므로 오류가 뜨며 삭제되지 않음
			}
			comSubmit.addParam("NUM", $("#NUM").val());
			comSubmit.submit();
		}
		
		function fn_openModifyFrom(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QnAModifyForm' />");
			comSubmit.addParam("NUM", $("#SNUM").val());
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
					$("#TITLE").focus();
					return false;
				}else if($("#TITLE").val().length >= 33){
					alert("제목은 30자 이하여야 합니다.");
					$("#TITLE").focus();
					return false;
				}else if($("#CONTENT").val().length >= 1200){
					alert("내용은 1200자 이하여야 합니다.");
					$("#CONTENT").focus();
					return false;
				}else
					fn_replyQnA();
			}
		
		function fn_QnAAlert(){
			if(!confirm("문의가 삭제처리 됩니다. 계속하시겠습니까?")){
				alert("삭제가 취소되었습니다.");
				return false;
			}else{
				alert("문의가 삭제되었습니다.");
				fn_deleteQnA();
			}
		}
		
	</script>
</body>
</html>
