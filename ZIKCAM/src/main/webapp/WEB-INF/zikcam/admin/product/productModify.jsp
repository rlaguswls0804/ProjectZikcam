<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
					<form id="frm" name="frm" enctype="multipart/form-data">
						<input id="PROD_NUM" name="PROD_NUM" type="hidden" value="${map.PROD_NUM}">
					
						<p><h3><b>상품 수정</b></h3></p>
						<hr/>
						<br/>
						
						<h5><b>기본 정보</b>&nbsp;&nbsp;<font color="red" size="3">* 필수 입력 사항</font></h5>
						
						<hr/>
						
						<table class="table">
							<tr>
								<td width="20%" align="right"><font color="red" size="3">* </font>상품명</td>
								<td width="80%">
									<input id="PROD_NAME" name="PROD_NAME" type="text" style="width:50%" value="${map.PROD_NAME}">
								</td>
							</tr>
							<tr>
								<td align="right"><font color="red" size="3">* </font>카테고리</td>
								<td>
									<%-- <input type="hidden" id="PROD_CATEGORY" name="PROD_CATEGORY" value="${map.PROD_CATEGORY}">${map.PROD_CATEGORY} --%>
									<select size="1" id="PROD_CATEGORY" name="PROD_CATEGORY" > 
										<option value="${map.PROD_CATEGORY}" id="PROD_CATEGORY">${map.PROD_CATEGORY}</option>
										<option value="텐트/타프" id="PROD_CATEGORY">텐트/타프</option>
										<option value="매트/침낭" id="PROD_CATEGORY">매트/침낭</option>
										<option value="테이블/체어" id="PROD_CATEGORY">테이블/체어</option>
										<option value="기타" id="PROD_CATEGORY">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">구매 가격</td>
								<td><input id="PROD_PRICE" name="PROD_PRICE" type="text" style="width:50%" value="${map.PROD_PRICE}"></td>
							</tr>
							<tr>
								<td align="right">구매 수량</td>
								<td><input id="PROD_STOCK" name="PROD_STOCK" type="text" style="width:50%" value="${map.PROD_STOCK}"></td>
							</tr>
							<tr>
								<td align="right">대여 가격</td>
								<td><input id="PROD_RPRICE" name="PROD_RPRICE" type="text" style="width:50%" value="${map.PROD_RPRICE}"></td>
							</tr>
							<tr>
								<td align="right">대여 수량</td>
								<td><input id="PROD_RSTOCK" name="PROD_RSTOCK" type="text" style="width:50%" value="${map.PROD_RSTOCK}"></td>
							</tr>
						</table>
						<br/><br/>
						
						<h5><b>이미지 정보</b>&nbsp;&nbsp;<font color="red" size="3">* 필수 입력 사항</font></h5>
						<hr/>
						
						<table class="table">
							<!-- <tr>
								<td width="20%" align="right"><font color="red" size="3">* </font>메인 이미지</td>
								<td width="40%"><input id="main_image" type="text" style="width:100%"></td>
								<td width="40%"><button type="button" class="btn btn-outline-dark">이미지 등록</button></td>
							</tr>
							<tr>
								<td align="right">서브 이미지 1</td>
								<td><input id="sub_image1" type="text" style="width:100%"></td>
								<td><button type="button" class="btn btn-outline-dark">이미지 등록</button></td>
							</tr>
							<tr>
								<td align="right">서브 이미지 2</td>
								<td><input id="sub_image2" type="text" style="width:100%"></td>
								<td><button type="button" class="btn btn-outline-dark">이미지 등록</button></td>
							</tr>
							<tr>
								<td align="right">서브 이미지 3</td>
								<td><input id="sub_image3" type="text" style="width:100%"></td>
								<td><button type="button" class="btn btn-outline-dark">이미지 등록</button></td>
							</tr>
							<tr>
								<td align="right">서브 이미지 4</td>
								<td><input id="sub_image4" type="text" style="width:100%"></td>
								<td><button type="button" class="btn btn-outline-dark">이미지 등록</button></td>
							</tr>
							<tr>
								<td align="right">상세 이미지</td>
								<td><input id="detail_image" type="text" style="width:100%"></td>
								<td><button type="button" class="btn btn-outline-dark">이미지 등록</button></td>
							</tr> -->
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">썸네일 이미지</th>
							</tr>
							<tr> 
								
								<td colspan="4"><textarea style="width:100%;" rows="15" title="메인 이미지" id="PROD_THUMB" name="PROD_THUMB">${map.PROD_THUMB}</textarea></td>
							</tr>
							<tr bgcolor="gray" align="center">
								<th scope="row" colspan="4">서브 이미지</th>
							</tr> 
							<tr>
								<td colspan="4"><textarea style="width:100%;" rows="15" title="서브 이미지" id="PROD_CONTEXT" name="PROD_CONTEXT">${map.PROD_CONTEXT}</textarea></td>
							</tr>
						</table>
						
						<br/><br/>
						
						<div id="last">
							<center>
								<button type="button" style="width:200px; height:60px; font-size:20px; font-weight:bold; color:white; background-color: #dc3545;" class="btn btn-outline-danger" name="updatebt">상품 수정</button>
							</center>
						</div>
						
					</form>
					</div>
				</section>
			</main>
			
<%@ include file="/WEB-INF/include/include-body.jspf" %>			
<script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	/* var cate = $('#PROD_CATEGORY').val();
	    	$("#category").val(cate).prop("selected", true); */
	    	
	    	$("button[name='updatebt']").on("click", function(e) {
	            e.preventDefault();
	            fn_openProductModify();
	         });
	    	//상품 수정
	    	/* $('button#updatebt').on('click', function() {
	    		var e = document.getElementById("category");
	    		var category = e.options[e.selectedIndex].text;
	    		
	    		// 상품 이미지 수정 --> 현진님 부탁해요!
	    		
	    		// 상품 테이블 수정
	        	 $.ajax({
	        		type: "POST",
	        		url:"<c:url value='/admin/productModify'/>",
	    			data:{PROD_NUM:$('input#prod_num').val(), PROD_NAME:$('input#prod_name').val(), PROD_CATEGORY:category,
	    				PROD_PRICE:$('input#prod_price').val(), PROD_STOCK:$('input#prod_stock').val(),
	    				PROD_RPRICE:$('input#prod_rprice').val(), PROD_RSTOCK:$('input#prod_rstock').val()},
	    			success: function(data){
	    				location.href="../admin/productList"; // 상품테이블 수정 성공하면 관리자페이지 상품목록으로 넘어감.
	    			}
	         	}); 
	    	})*/
	    }); 
	    function fn_openProductModify() {
	         var comSubmit = new ComSubmit("frm");
	         comSubmit.setUrl("<c:url value='/admin/productModify' />");
	         comSubmit.submit();
	      }
	    
	    var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 }; 
				 
		CKEDITOR.replace("PROD_THUMB", ckeditor_config);
		
		 var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/goods/ckUpload"
				 }; 
				 
		CKEDITOR.replace("PROD_CONTEXT", ckeditor_config);
				 
</script>	
</body>
</html>