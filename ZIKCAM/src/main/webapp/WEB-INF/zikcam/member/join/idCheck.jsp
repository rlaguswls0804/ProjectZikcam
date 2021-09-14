<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<title>아이디 중복 확인</title>
</head>
<body>
<c:if test="${idCheck==1}">
같은 이름의 아이디가 이미 존재합니다. 
</c:if>
<c:if test="${idCheck==0}">
현재 아이디를 사용하실 수 있습니다.
</c:if>
</body>
</html>