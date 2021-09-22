<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<style type="text/css">
.gdsDes img { max-width:600px; max-height:500px; width:auto; height:auto; }
</style>
</head>
<body>
	
		
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>FAQ</h3>
						
						<font color="gray">자주묻는질문</font>
						
						
						<form action="../cs/faqList" method="get" style="float: right;" >
							<fieldset>
							<div class="input-group">
								<input class="form-control" type="text" placeholder="제목 + 내용" name="keyword" id="keyword" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
								<input type="hidden" name="searchType" id="searchType" value="all">
								<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d""><i class="fas fa-search"></i>
			                    	<div id='search-button'>
									    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
									</div>
		                    	</button>
								<!-- <input type="submit" value="검색" class="search_btn" onClick="onSearch()"/> -->
								<input type="hidden" id="sortType" value="${sortType}" />
							</div>
							<c:if test="${session_MEM_RANK == 0}">
							
								<a href="#this" id="delete" style="float: right;">
									<button class="btn btn-outline-dgray" 
						            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">삭제하기
						            </button>
								</a>
								<a href="#this" id="update" style="float: right;">
									<button class="btn btn-outline-dgray" 
						            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">수정하기
						            </button>
								</a>
								<a href="#this" id="write" style="float: right;">
									<button class="btn btn-outline-dgray" 
						            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">FAQ등록
						            </button>
								</a>
							
							</c:if>
							</fieldset>
						</form>
						
					  
						<!-- 카테고리 별로 -->
						<div class="navbar navbar-expand-xl arcodian">
			                	<div id="rentalDivision" align="left">		
				                 <div style=" float:right; border-color:black; font-size:1em;">  	
				                   		<form action="../cs/faqList" method="get">
				               				<input type="hidden" name="sortType" id="sortType" value="deli"/>
				               			</form> 
				                   	
				                   		<button class="btn btn-outline-dgray active"  
				                   				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="deli">배송문의
				                   		</button>
				                   
				                   		<button class="btn btn-outline-dgray" 
				                   				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="refund">반품/환불
				                   		</button> 
		
				                   		<button class="btn btn-outline-dgray" 
				                   				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="order">주문/결제
				                   		</button>
				                   
				                   		<button class="btn btn-outline-dgray" 
				                   				style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="member">회원관련
				                   		</button>
				                   </div>	
				                </div>	  
						</div>
						
							<ul class="listWrap">
								
								
								<script>
								$('.listWrap').empty();
								</script>
							</ul>	
						    
						<div class="page_nation">
							<div id="PAGE_NAVI"></div>
							<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
						</div>
						
					</div>
				</section>
			</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
		$(document).ready(function(){
			fn_selectFaqList(1); 
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openFaqWrite();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openFaqUpdate();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteFaq();
			});
			
			
			$("button[name=sortType]").on('click', function(){
				
				var sortType = $(this).val();
				
				if(sortType == 'deli') {
					$('#sortType').val('deli');
					$('button[value=deli]').addClass('active');
					$('button[value=refund]').removeClass('active');
					$('button[value=order]').removeClass('active');
					$('button[value=member]').removeClass('active');
				} else if(sortType == 'refund') {
					$('#sortType').val('refund');
					$('button[value=refund]').addClass('active');
					$('button[value=deli]').removeClass('active');
					$('button[value=order]').removeClass('active');
					$('button[value=member]').removeClass('active');
				} else if(sortType == 'order') {
					$('#sortType').val('order');
					$('button[value=order]').addClass('active');
					$('button[value=deli]').removeClass('active');
					$('button[value=refund]').removeClass('active');
					$('button[value=member]').removeClass('active');
				} else if(sortType == 'member') {
					$('#sortType').val('member');
					$('button[value=member]').addClass('active');
					$('button[value=deli]').removeClass('active');
					$('button[value=refund]').removeClass('active');
					$('button[value=order]').removeClass('active');
				} 
				
				$.ajax({
					 url : '../cs/selectFaqList', 
		              type : "get", 
		              data : {"sortType" : sortType},
		              success : function(data){ 
		                 console.log(sortType);
		                 fn_selectFaqList(1); 
		                 var qnaNum = -1;
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
		                 
		              },
		              error : function(data){
		            	 alert('error');
		               
		              }
					})
				console.log(sortType);
			});
			
			
			
		});
		
		
		function fn_openFaqWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openFaqWrite' />");
			comSubmit.submit();
		}
		
		function fn_openFaqUpdate(){
			var idx = "${map.FAQ_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openFaqUpdate' />");
			comSubmit.addParam("FAQ_NUM", $("input[name='selectFaq']:checked").val());
			comSubmit.submit();
		}
		
		function fn_deleteFaq(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/faqDelete' />");
			comSubmit.addParam("FAQ_NUM", $("input[name='selectFaq']:checked").val());
			comSubmit.submit();
			
		}
		
		
		function fn_selectFaqList(pageNo){ 
			var comAjax = new ComAjax();
			var id="${session_MEM_ID}";
			comAjax.setUrl("<c:url value='../cs/selectFaqList' />");
			comAjax.setCallback("fn_selectFaqListCallback");
			comAjax.addParam("id", id);
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.ajax();
		}
		
		function fn_selectFaqListCallback(data){
			var total = data.TOTAL;
			var body = $(".listWrap");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
						"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
						"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectFaqList"
				};
			gfn_renderPaging(params);	
			
			var str = "";
			$.each(data.faqList, function(key, value){
				str +=	"<li class='qa_li'>" +
							"<div class='question'>" +
					        	"<font color='gray'>" + value.FAQ_CATEGORY + "</font>" +
					            "<p class='tit'>" + value.FAQ_QUESTION + "</p>" +
					            "<p class='iconDiv'><img src='https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png'></p>" +
					        "</div>" + 
					        "<div class='answer'>" + "<div class='gdsDes'>" + value.FAQ_ANSWER + "</div>" + "</div>" +
					    "</li>";
			});
			
			var str2 = "";
			$.each(data.faqList, function(key, value){
				str2 +=	"<li class='qa_li'>" +
							"<input type='radio' name='selectFaq' value=" + value.FAQ_NUM + ">" +
					    	"<div class='question'>" +
					        	"<font color='gray'>" + value.FAQ_CATEGORY + "</font>" +
					            "<p class='tit'>" + value.FAQ_QUESTION + "</p>" +
					            "<p class='iconDiv'><img src='https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png'></p>" +
					        "</div>" + 
					        "<div class='answer'>" + "<div class='gdsDes'>" + value.FAQ_ANSWER + "</div>" + "</div>" +
					    "</li>";
			});
			
			if("${session_MEM_RANK}" == '0'){
				body.append(str2);
			}else {
				body.append(str);
			}
		}
	}
	
</script>		
	
</body>
</html>
