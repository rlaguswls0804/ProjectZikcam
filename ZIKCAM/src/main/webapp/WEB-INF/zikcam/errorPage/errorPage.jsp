<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
<body>
	<br/> <br/> <br/> <br/> <br/> 
	<h1>잘못된 접근입니다!</h1>
	<hr/> <br/> <br/>
	<h4>아래의 사항을 확인해주세요.</h4>
	<br/>
	<b>로그인된 아이디를 확인해주세요.</b>
	<ul>
		<li>권한이 없으면 접근할 수 없는 페이지에 접근했을 수 있습니다.</li>
		
			<c:choose>
				<c:when test="${empty session_MEM_ID}">
					<li> <p style="color:gray;">*로그인 되지 않았습니다. 로그인을 해주세요.</p></li></c:when>
				<c:when test="${not empty session_MEM_ID}">
					<li> <p style="color:gray;"><p style="color:gray;">*아이디: ${session_MEM_ID } | 회원등급: 
			<c:if test="${session_MEM_RANK == 0 }">관리자</c:if>
			<c:if test="${session_MEM_RANK >= 1 }">일반회원</c:if></p></li></c:when>
			</c:choose>
	</ul>
	<br/>
	<b>일시적인 문제 일 수 있습니다.</b>
	<ul>
		<li>잠시후에 다시 시도해 주시기 바랍니다.</li>
		<li>문제가 지속될 경우 고객센터에 문의해주시기 바랍니다.<p style="color:gray;">고객센터: 1800-77** 운영시간: 09:00 ~ 18:00</p></li>
	</ul>
	<button class="btn btn-outline-dark" id="main" name="main" style="" onclick="location.href = '../prod/main'">메인으로</button>
	<br/> <br/> <br/> <br/> <br/> 
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	
	</script>
</body>
</html>