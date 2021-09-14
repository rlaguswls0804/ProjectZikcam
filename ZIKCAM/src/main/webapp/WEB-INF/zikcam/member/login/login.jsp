<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	if(message!=null && message!=''){
		alert(message);
		if(url!=null && url!=''){
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='/prod/main'/>";
	}
})
/* message는 아이디가 없을 때,비밀번호가 맞지않을 때 이메일 인증을 하지 않았을 때, 제재기한이 남았을때 출력
url은 메인으로 스크립트 */
</script>
</head>
</html>