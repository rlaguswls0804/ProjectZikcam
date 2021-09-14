<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var qnaNum = -1;
$(document).ready(function(){
$('.qa_li .question').click(function(){
	    q = $(".qa_li .question").index(this); 
	    if(q!=qnaNum){
	        $('.qa_li .answer').stop(true, true).slideUp(400);
	        $('.qa_li').removeClass('open');
	        TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:0});
	        qnaNum = q;
	        $('.qa_li').eq(qnaNum).addClass('open');
	        $('.qa_li .answer').eq(qnaNum).stop(true, true).slideDown(400);
	        //TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:180});
	        TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:0});
	    }else{
	        $('.qa_li .answer').eq(qnaNum).stop(true, true).slideUp(400);
	        $('.qa_li').eq(qnaNum).removeClass('open');
	        TweenMax.to($('.qa_li').eq(qnaNum).find('.question p'), 0.4, {rotation:0});
	        qnaNum = -1;
	    } 
	});
});
</script> 
<style>
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');
ul, li, p { list-style:none; padding:0; margin:0; }
.listWrap { font-family:'Noto Sans KR', sans-serif; margin-bottom:20px; }
.listWrap .qa_li { position:relative; display:block; padding:0; border-bottom:1px solid #ededed; cursor:pointer; }
.listWrap .qa_li:first-child { border-top:1px solid #a6a6a6; }
.listWrap .qa_li .ca_name { margin-bottom:14px; font-weight:400; color:#999; font-size:18px; }
.listWrap .qa_li .tit { color:#222; font-size:24px; transition:color 0.3s ease-out; }
.listWrap .qa_li:hover .tit { color:#0a7ac8; }
.qa_li .question { position:relative; display:block; padding:12px 100px 12px 120px; background:url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_q.png') 40px center no-repeat; }
.qa_li .question .iconDiv { position:absolute; right:40px; top:50%; -webkit-transform:translateY(-50%); -moz-transform:translateY(-50%); -o-transform:translateY(-50%); -ms-transform:translateY(-50%); transform:translateY(-50%); }
.qa_li .answer { position:relative; display:none; padding:40px 120px; font-size:16px; color:#222; line-height:28px; background:#f6f6f6 url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_a.png') 40px 40px no-repeat; border-top:1px solid #e4e4e4; }
.modA { position:absolute; right:30px; bottom:30px; color:#e82b2b; }
</style>
</head>

</body>
</html>