<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<img src="/zikcam/resources/images/zikcam_black.png"
				alt="ZikCam_Logo" width="130" height="30">
		</div>
	</nav>
	신청이 완료되었습니다.

	<a href="#this" id="confirm">
		<button
			style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
			value="update">확인</button>
	</a>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#confirm").on("click", function(e) {
				e.preventDefault();
				reload();
			});
		});
		function reload() {
			window.opener.location.reload();
			window.close();
		}
	</script>

</body>
</html>