<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<center>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX}</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID}</td>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM}</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE}</td>
			</tr>
			<tr>
				<td colspan="4">${map.CONTENTS}</td>
			</tr>
			<tr>
				<td scope="row">첨부파일</td>
				<td colspan="3">
					<c:forEach var="row" items="${map.list}">
						<c:choose>
							<c:when test="${fn:length(row.ORIGINAL_FILE_NAME) > 0}">
								<input type="hidden" id="IDX" value="${row.IDX}"/>
								<a href="#this" name="file" id="file">${row.ORIGINAL_FILE_NAME}</a>
								(${row.FILE_SIZE}kb)
							</c:when>
							<c:otherwise>
								첨부파일이 없습니다.
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</td>
			</tr>
		</tbody>
	</table>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
</center>	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
			
			$("a[name='file']").on("click", function(e){ //다운받기 버튼
					e.preventDefault();
					fn_downloadFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_downloadFile(obj){
			var idx = obj.parent().find("#IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
	</script>
</body>
</html>