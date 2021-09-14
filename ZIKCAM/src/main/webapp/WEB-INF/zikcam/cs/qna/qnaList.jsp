<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ZikCam! - 직접 고른 캠핑 용품</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
		
			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h3>Q&A</h3>
						<font color="gray">상품문의는 구매내역에서 작성하실 수 있습니다.</font>
						<!-- <ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="index.html">구매</a></li>
							<li class="breadcrumb-item active">대여</li>
						</ol> --> 
						
						<!--  검색 영역 -->
						<form action="../cs/qnaList" method="get" style="float: right;">
							<fieldset> 
								<div class="input-group">
									<input class="form-control" type="text" placeholder="제목 + 내용" name="keyword" id="keyword" value="${keyword}" aria-label="Search for..." aria-describedby="btnNavbarSearch" />
									<input type="hidden" name="searchType" id="searchType" value="all">
									<button class="btn btn-primary" id="btnNavbarSearch2" type="submit" style="border-top-right-radius: 3px; border-bottom-right-radius: 5px; background-color: #6c757d; border-color: #6c757d"><i class="fas fa-search"></i>
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
			               			
			               			<form action="../cs/qnaList" method="get">
				               				<input type="hidden" name="sortType" id="sortType" value=""/>
				               		</form>
			                	
				                   	<button class="btn btn-outline-dgray" 
				                   			style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="nothing">미답변
				                   	</button>
				                
				                    <button class="btn btn-outline-dgray" 
					                   		style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="clear">답변완료
					                </button>
					          
				                
				                   	<button class="btn btn-outline-dgray" 
				                   			style="outline: 1; border: 1; font-size: 0.7em; width: 100px; height: 40px;" name="sortType" value="mine">내 문의
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
									<th width="15%" scope="col">작성자</th>
									<th width="15%" scope="col">답변상태</th>
									<th width="15%" scope="col">작성일</th>
								</tr>
							</thead>	
							<tbody>
							<%-- <c:choose>
                				<c:when test="${fn:length(qnaList) > 0}">
                    				<c:forEach items="${qnaList}" var="row">
                        		<tr>
                            		<td>${row.QNA_NUM}</td>
                            		<td class="title">
                                		<a href="#this" name="title">${row.QNA_TITLE}</a>
                                		<input type="hidden" id="QNA_NUM" value="${row.QNA_NUM}">
                            		</td>
                            		<td>${row.QNA_MEMBER_ID}</td>
                            		<td>${row.QNA_REPLY}</td>
                            		<td>${row.QNA_DATE}</td>
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
						
						<div class="page_nation">
							<div id="PAGE_NAVI"></div>
							<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
						</div>
						
						
						<form style="float: right;">
						<a href="#this" id="write">
							<button class="btn btn-outline-dgray" 
				            	style="outline: 1; border: 1; font-size: 0.7em; width: 80px; height: 30px;">문의추가
				            </button>
						</a>
						</form>
		
					</div>
			</section>
		</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){
		fn_selectQnaList(1);
			
		$("#write").on("click", function(e){ //글쓰기 버튼
			e.preventDefault();
			fn_openQnaWrite();
		});	
			
		$("tr[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openQnaDetail($(this));
		}); 
		
		$("button[name=sortType]").on('click', function(){
			
			var sortType = $(this).val();
			
			if(sortType == 'nothing') {
				$('#sortType').val('nothing');
				$('button[value=nothing]').addClass('active');
				$('button[value=clear]').removeClass('active');
				$('button[value=mine]').removeClass('active');
			} else if(sortType == 'clear') {
				$('#sortType').val('clear');
				$('button[value=clear]').addClass('active');
				$('button[value=nothing]').removeClass('active');
				$('button[value=mine]').removeClass('active');
			} else if(sortType == 'mine') {
				$('#sortType').val('mine');
				$('button[value=mine]').addClass('active');
				$('button[value=nothing]').removeClass('active');
				$('button[value=clear]').removeClass('active');
			} 
			
			$.ajax({
				 url : '../cs/selectQnaList', 
	              type : "get", 
	              data : {"sortType" : sortType},
	              success : function(data){ 
	                 console.log(sortType);
	                
	              	 fn_selectQnaList(1);
	                 
	              },
	              error : function(data){
	            	 alert('error');
	               
	              }
				})
			console.log(sortType);
		});
	});
		
		
	function fn_openQnaWrite(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../cs/openQnaWrite' />");
		comSubmit.submit();
	}
		
	function fn_openQnaDetail(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../cs/qnaDetail' />");
		comSubmit.addParam("QNA_NUM", obj.children().find("#QNA_NUM").val());
		comSubmit.submit();
	} 
	 	  
	function fn_selectQnaList(pageNo){
		var comAjax = new ComAjax();
		var id="${session_MEM_ID}";
		comAjax.setUrl("<c:url value='../cs/selectQnaList' />");
		comAjax.setCallback("fn_selectQnaListCallback");
		comAjax.addParam("id", id); 
		comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.addParam("keyword", $('#keyword').val());
		comAjax.addParam("searchType", $('#searchType').val());
		comAjax.addParam("sortType", $('#sortType').val());
		comAjax.ajax();
	} 
		 
	function fn_selectQnaListCallback(data){
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
				eventName : "fn_selectQnaList"
			};
		gfn_renderPaging(params);
				
		var str = "";
		$.each(data.qnaList, function(key, value){
			str += "<tr name='title' onclick=\"location.href = '#this'\">" + 
						"<td>" + value.QNA_NUM + 
						"<input type='hidden' id='QNA_NUM' value=" + value.QNA_NUM + ">" +
						"</td>" + 
						"<td class='title'>" +
							value.QNA_TITLE +
						"</td>" + 
						"<td>" + value.MEMBER_ID + "</td>" +
							"<input type='hidden' id='MEMBER_ID' value=" + value.MEMBER_ID + ">" +
                		"<td>" + value.QNA_REPLY_CH + "</td>" +
                		"<td>" + value.QNA_DATE + "</td>" +
					"</tr>";
		});
		body.append(str);
			
		$("a[name='title']").on("click", function(e){ //제목 
			e.preventDefault();
			fn_openQnaDetail($(this));
		});
		}
	}
</script>	
</body>
</html>
