<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!-- jQuery -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zikcam</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="/zikcam/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="<c:url value='/resources/css/styles2.css'/>" />

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<c:url value='/resources/js/scripts.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

</head>

<body>
	<!-- // header -->
	<tiles:insertAttribute name="header"/>
		
	
		<!-- sideBar -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<tiles:insertAttribute name="left"/>
		</div>
		<!-- container --> 
		<div id="layoutSidenav_content">
			<tiles:insertAttribute name="body"/>
		</div>
		
	</div> 
	<!-- footer -->
	<tiles:insertAttribute name="footer"/>
	<tiles:insertAttribute name="insertScript"/>	
</body>
</html>