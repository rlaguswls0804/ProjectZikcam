<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="/WEB-INF/include/include-header.jspf"%> --%>
<style type="text/css">
  .nav_new {
  position: fixed;
  top: 56px;
  width: 100%;
  left: 0;
  right: 0;
  z-index: -1;
}
</style>
</head>
<body>
<!-- 	사이드바 영역 -->
<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="../cs/csIndex" 
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
						<div class="menu sb-sidenav-menu-heading">고객센터</div>
						</a>
						<hr />
						<a id="intro" class="nav-link" href="../cs/introList"  name="sortType3" value="intro"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
								<i class="fas fa-table"></i>직캠소개
						</a> <a id="qna" class="nav-link" href="../cs/qnaList" name="sortType3" value="qna"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
								<i class="fas fa-table"></i>Q&A
						</a> <a id="faq" class="nav-link" href="../cs/faqList" name="sortType3" value="faq"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
								<i class="fas fa-table"></i>FAQ
						</a> <a id="notice" class="nav-link" href="../cs/noticeList" name="sortType3" value="notice"
							style="font-weight: bold; font-size: 1.5em; line-height: 20px;">
								<i class="fas fa-table"></i>직캠소식
						</a> 
					</div>
				</div>
			</nav>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	$("a[name=sortType3]").on('click', function(){
		
		var sortType = $(this).val();
		
		if(document.URL.indexOf("../cs/introList")) {
			$('#sortType').val('intro');
			$('a[value=intro]').addClass('active');
			$('a[value=qna]').removeClass('active');
			$('a[value=faq]').removeClass('active');
			$('a[value=notice]').removeClass('active');
		} else if(sortType == 'qna') {
			$('#sortType').val('qna');
			$('a[value=qna]').addClass('active');
			$('a[value=intro]').removeClass('active');
			$('a[value=faq]').removeClass('active');
			$('a[value=notice]').removeClass('active');
		} else if(sortType == 'faq') {
			$('#sortType').val('faq');
			$('a[value=faq]').addClass('active');
			$('a[value=intro]').removeClass('active');
			$('a[value=qna]').removeClass('active');
			$('a[value=notice]').removeClass('active');
		} else if(sortType == 'notice') {
			$('#sortType').val('notice');
			$('a[value=notice]').addClass('active');
			$('a[value=intro]').removeClass('active');
			$('a[value=qna]').removeClass('active');
			$('a[value=faq]').removeClass('active');
		}
	});
}); 
</script>
</body>
</html>