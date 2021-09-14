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
	<h1>서버 점검중</h1>
	<hr/> <br/> <br/>
	<h4>현재 점검중인 페이지입니다.</h4>
	<br/>
	<b>빠르게 문제를 해결하도록 하겠습니다.</b>
	<ul>
		<li>해당 페이지가 지속적으로 나타날 경우 고객센터에 문의해주시기 바랍니다.<p style="color:gray;">고객센터: 1800-77** 운영시간: 09:00 ~ 18:00</p></li>
	</ul>
	<button class="btn btn-outline-dark" id="main" name="main" style="" onclick="location.href = '../prod/main'">메인으로</button>
	<br/> <br/> <br/> <br/> <br/> 
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	
	</script>
</body>
</html>