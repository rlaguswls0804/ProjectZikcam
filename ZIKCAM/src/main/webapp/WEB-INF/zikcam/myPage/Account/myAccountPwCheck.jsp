<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>

			<main>
				<section class="py-5">
					<div class="container px-4 px-lg-5 mt-5">
						<h2>회원정보 확인</h2>
						<br/>
						<br/>
						<hr/>
						<br>
						<br>
						<div>
							<div align="center">
							<form id="frm"></form>
								<table align="center" style="width : 50%;">
									<tr>
										<td>아이디</td>
										<td><c:out value="${map.MEMBER_ID }"/></td>
									</tr>
									<tr>
										<td>패스워드</td>
										<td><input type="password" id="MEMBER_PW" width="100px" style="width : 80%"></td>
									</tr>
								</table>
								<br/>
								<br/>
								<hr/>
								<div align="center">
								<a href="#this" id="pwcheck"><button 
										style="outline:0; border:0;  border-radius: 6px; width: 160px; height:40px; background-color:black; color:white;" 
										value="updatemem">확인</button></a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</main>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
		
		$(document).ready(function(){
			$("#pwcheck").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				checkIt();
			});
			
		});
		
		function fn_PW_Check(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='../myPage/myAccountModifyForm'/>");
			comSubmit.addParam("MEMBER_PW", $("#MEMBER_PW").val());
			comSubmit.submit();
		}
		
		function checkIt(){
	         if(!$("#MEMBER_PW").val()){
	            alert("비밀번호를 입력하지 않으셨습니다.");
	            return false;
	         
	         }else {
				return fn_PW_Check();
			}

	   }
		
</script>
</body>
</html>