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
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<!-- // header -->
	<tiles:insertAttribute name="header"/>
		
	
		<!-- sideBar -->
	<div id="layoutSidenav">
		<!-- container --> 
		<div id="layoutSidenav_content">
			<tiles:insertAttribute name="body"/>
		</div>
		
	</div> 
		
</body>
</html>