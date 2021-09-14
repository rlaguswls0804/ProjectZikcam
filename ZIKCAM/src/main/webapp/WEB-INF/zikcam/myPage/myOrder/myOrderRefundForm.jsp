<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<img src="/zikcam/resources/images/zikcam_black.png" alt="ZikCam_Logo" width="130"
				height="30">
		</div>
	</nav>
	<table align="center" style="text-align : center;">
		<tr>
			<th colspan="4" style="width : 200px; text-align:center;"> 상품명 : ${refundProduct.PROD_NAME }</th>
		</tr>
		<tr>
			<td><input type="radio" name="category" value="1">상태 불량</td>
			<td><input type="radio" name="category" value="2">단순 변심</td>
			<td><input type="radio" name="category" value="3">주문 실수</td>
			<td><input type="radio" name="category" value="4">기 타</td>
		</tr>
		<tr>
			<td colspan="4"><textarea cols="60" rows="3" style="resize : none;" placeholder="기타 선택시 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="#this" id="change">
			<button
										style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
										value="update">교환신청</button>
										</a>
										</td>
			<td colspan="2">
			<a href="#this" id="return">
			<button
										style="outline: 0; border: 0; border-radius: 6px; width: 140px; background-color: gray; color: white;"
										value="update">반품신청</button>
										</a>
										</td>
		</tr>
	</table>
	<input type="hidden" id="DORDER_NUM" value="${refundProduct.DORDER_NUM }">
	<input type="hidden" id="ORDER_NUM" value="${refundProduct.ORDER_NUM }">
	${refundProduct.ORDER_NUM }
	${refundProduct.DORDER_NUM }
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#change").on("click", function(e) {  
			e.preventDefault();
			fn_orderChange();
		});
		$("#return").on("click", function(e) {
			e.preventDefault();
			fn_orderReturn();
		});
	});
	
	function fn_orderChange() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../myPage/myOrderRefund' />");
		comSubmit.addParam("DORDER_NUM", $("#DORDER_NUM").val());
		comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
		comSubmit.addParam("type", "change");
		comSubmit.submit();
	}
	
	function fn_orderReturn() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='../myPage/myOrderRefund' />");
		comSubmit.addParam("DORDER_NUM", $("#DORDER_NUM").val());
		comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
		comSubmit.addParam("type", "return");
		comSubmit.submit();
	}

	function reload(){
	    window.opener.location.reload();
	    window.close();
	}
	
</script>
	
	
</body>
</html>
