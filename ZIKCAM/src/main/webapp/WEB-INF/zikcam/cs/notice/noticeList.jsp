<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
		
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>직캠소식</h3>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> -->
						<font color="gray">직접고르는 캠핑용품</font>
						 
						<!--  검색 영역 -->
						<form action="../cs/noticeList" method="get" style="float: right;">
							<fieldset>
								<div class="input-group">
									<input class="form-control" type="text" placeholder="제목 + 내용" name="keyword" id="keyword" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
									<input type="hidden" name="searchType" id="searchType" value="all">
									
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d""><i class="fas fa-search"></i>
				                    	<div id='search-button'>
										    <img src='/zikcam/resources/images/white_search_icon_16x16.png' />
										</div>
			                    	</button>
								</div>
							</fieldset>
						</form>
						
						<!-- 카테고리 별로 -->
						<div class="navbar navbar-expand-xl arcodian">
			                <div id="rentalDivision" align="left">
			               			
			               			<form action="../cs/noticeList" method="get">
				               				<input type="hidden" name="sortType" id="sortType" value=""/>
				               		</form>
			                	
				                   	<button class="btn btn-outline-dgray" 
				                   			style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="notice">공지사항
				                   	</button>
				                
				                    <button class="btn btn-outline-dgray" 
					                   		style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="event">이벤트
					                </button>
					          
				                
				                   	<button class="btn btn-outline-dgray" 
				                   			style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="info">정보
				                   	</button>
				               
				                   	<button class="btn btn-outline-dgray" 
				                   			style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="etc">기타
				                   	</button>
				               
				             </div> 		
				       	</div>
						
						<table class="table table-hover"
						style="width: 100%; text-align: center;">
							<thead>	
								<tr bgcolor="#212926"
							style="color: white; border-collapse: collapse; outline: 0; border: 0;">
									<th width="10%" scope="col">글번호</th>
									<th width="45%" scope="col">제목</th>
									<th width="15%" scope="col">분류</th>
									<th width="15%" scope="col">조회수</th>
									<th width="15%" scope="col">작성일</th>
								</tr>
							</thead>	
							<tbody>
							
								<%-- <c:choose>
	                				<c:when test="${fn:length(noticeList) > 0}">
	                    				<c:forEach items="${noticeList}" var="row">
	                        		<tr>
	                            		<td>${row.NOTICE_NUM}</td>
	                            		<td class="title">
	                                		<a href="#this" name="title">${row.NOTICE_TITLE}</a>
	                                		<input type="hidden" id="NOTICE_NUM" value="${row.NOTICE_NUM}">
	                            		</td>
	                            		<td>${row.NOTICE_CATEGORY}</td>
	                            		<td>${row.NOTICE_HITCOUNT}</td>
	                            		<td>${row.NOTICE_DATE}</td>
	                        		</tr>
	                    				</c:forEach>
	                				</c:when>
	                				<c:otherwise>
	                    			<tr>
	                        			<td colspan="4">조회된 결과가 없습니다.</td>
	                   				</tr>
	                				</c:otherwise>
	            				</c:choose> --%>
            				
							</tbody>	
						</table>
						
						<div class="page_wrap">
   							<div class="page_nation">
								<div id="PAGE_NAVI"></div>
								<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
							</div>
						</div>
						
					<c:if test="${session_MEM_RANK == 0}">
						<form style="float: right;">
						<a href="#this" id="write">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">소식등록
				           	</button>
						</a>
						</form>
					</c:if>
					</div>
				</section>
			</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectNoticeList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openNoticeWrite();
			});	
			
			$("tr[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openNoticeDetail($(this));
			});
			
			$("button[name=sortType]").on('click', function(){
				
    			var sortType = $(this).val();
    			
    			if(sortType == 'notice') { 
    				$('#sortType').val('notice');
    				$('button[value=notice]').addClass('active');
    				$('button[value=event]').removeClass('active');
    				$('button[value=info]').removeClass('active');
    				$('button[value=etc]').removeClass('active');
    			} else if(sortType == 'event') {
    				$('#sortType').val('event');
    				$('button[value=event]').addClass('active');
    				$('button[value=notice]').removeClass('active');
    				$('button[value=info]').removeClass('active');
    				$('button[value=etc]').removeClass('active');
    			} else if(sortType == 'info') {
    				$('#sortType').val('info');
    				$('button[value=info]').addClass('active');
    				$('button[value=notice]').removeClass('active');
    				$('button[value=event]').removeClass('active');
    				$('button[value=etc]').removeClass('active');
    			} else if(sortType == 'etc') {
    				$('#sortType').val('etc');
    				$('button[value=etc]').addClass('active');
    				$('button[value=notice]').removeClass('active');
    				$('button[value=event]').removeClass('active');
    				$('button[value=info]').removeClass('active');
    			}
    			
    			
    			$.ajax({
   				 url : '../cs/selectNoticeList', 
   	              type : "get", 
   	              data : {"sortType" : sortType},
   	              success : function(data){ 
   	                 console.log(sortType);
   	                
   	              	 fn_selectNoticeList(1);
   	                 
   	              },
   	              error : function(data){
   	            	 alert('error');
   	                
   	              }
   				})
    			console.log(sortType);
			});
			
		});
		
		/* function fn_openNoticeSort(){
			var comSubmit = new ComSubmit();
			if(sortType == 'notice') {
				$('#sortType').val('notice');
			} else if(sortType == 'event') {
				$('#sortType').val('event');
			} else if(sortType == 'info') {
				$('#sortType').val('info');
			} else if(sortType == 'etc') {
				$('#sortType').val('etc');
			}
			comSubmit.setUrl("<c:url value='../cs/noticeList'/>");
			comSubmit.submit();
		} */
		  
		 
		function fn_openNoticeWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/openNoticeWrite'/>");
			comSubmit.submit();
		}
		
		function fn_openNoticeDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='../cs/noticeDetail'/>");
			comSubmit.addParam("NOTICE_NUM", obj.children().find("#NOTICE_NUM").val());
			comSubmit.submit();
		}
		
		function fn_selectNoticeList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='../cs/selectNoticeList' />");
			comAjax.setCallback("fn_selectNoticeListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
						    			 
			comAjax.ajax();
		}	
		
		function fn_selectNoticeListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
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
					eventName : "fn_selectNoticeList"
				};
			gfn_renderPaging(params);
				
			var str = "";
			$.each(data.noticeList, function(key, value){ //오류나면 빼기
				str +=	"<tr name='title' onclick=\"location.href = '#this'\">" +
			        		"<td>" + value.NOTICE_NUM +
			        		"<input type='hidden' id='NOTICE_NUM' value=" + value.NOTICE_NUM + ">" +
			        		"</td>" +
			        		"<td class='title'>" +
			            		 value.NOTICE_TITLE + 
			            		
			        		"</td>" +
			        		"<td>" + value.NOTICE_CATEGORY + "</td>" +
			        		"<td>" + value.NOTICE_HITCOUNT + "</td>" +
			        		"<td>" + value.NOTICE_DATE + "</td>" + 
			        	"</tr>";
			});
			body.append(str);
			
			$("tr[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openNoticeDetail($(this));
			});
			}
		}
		
		
</script>	
	
	
</body>
</html>
