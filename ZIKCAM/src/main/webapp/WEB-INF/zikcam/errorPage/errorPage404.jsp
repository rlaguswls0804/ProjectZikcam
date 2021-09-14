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
	<h1>페이지가 존재하지 않습니다!</h1>
	<hr/> <br/> <br/>
	<h4>아래의 사항을 확인해주세요.</h4>
	<br/>
	<b>입력한 주소를 확인해주세요.</b>
	<ul>
		<li>주소를 잘못 입력했을 수 있습니다.</li>
		<li>더 이상 존재하지 않는 페이지 일 수 있습니다.</li>
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