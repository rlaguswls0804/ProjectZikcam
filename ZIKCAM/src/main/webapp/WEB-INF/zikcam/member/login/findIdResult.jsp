<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<div>
<c:if test="${id.MEMBER_ID==null || id.MEMBER_ID==''}">
조회된 아이디가 없습니다.
</c:if>
<c:if test="${id.MEMBER_ID!=null && id.MEMBER_ID!=''}">
입력하신 정보로 등록된 아이디는 '${id.MEMBER_ID}'입니다.
</c:if>
<br>
<a href="#" onclick="javascript:history.go(-1);">뒤로가기</a>
<a href="#" onclick="javascript:window.close();">닫기</a>
</div>

</body>
</html>