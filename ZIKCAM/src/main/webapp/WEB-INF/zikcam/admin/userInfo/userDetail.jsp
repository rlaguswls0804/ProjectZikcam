<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<script type="text/javascript"> 
		$(document).ready(function(){ 
			$("#list").on("click", function(e){ 
				e.preventDefault(); 
				fn_openUserList(); 
			}); 
		}); 
		
		$(document).ready(function(){ 
			$("#update").on("click", function(e){ 
				e.preventDefault(); 
				fn_validation();
			}); 
		}); 
		
	function fn_openUserList(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/admin/userList' />"); 
		comSubmit.submit(); 
	}
	
	function fn_modifyUserInfo(){ 
		var comSubmit = new ComSubmit("userModify"); 
		comSubmit.setUrl("<c:url value='/admin/userModify' />"); 
		comSubmit.submit(); 
	} 
	
	function fn_validation(table) { 	   	   
			if(!$("#PASSWORD").val()){
				alert("비밀번호를 입력해주세요.");
				$("#PASSWORD").focus();
			  	return false;
			}else if(!$("#PHONE1").val()){
				alert("전화번호를 입력해주세요.");
				$("#PHONE1").focus();
			  	return false;
			}else if(!$("#ZONCODE").val()){
				alert("우편번호를 입력해주세요.");
				$("#ZONCODE").focus();
			  	return false;
			}else if($("#pwModify").checked){
				
			}else if($("#PASSWORD").val() != ${map.MEMBER_PW }){
				alert("비밀번호가 다릅니다.");
				return false;
			}else if($("#DEL").val() == 1){
				if(!confirm("계정이 삭제처리 됩니다. 계속하시겠습니까?")){
					alert("삭제가 취소되었습니다.");
					return false;
				}else{
					alert("계정이 삭제처리 되었습니다.");
					fn_modifyUserInfo();
				}
			}else if($("#DEL").val() == 0){
				if(!confirm("계정이 수정됩니다. 계속하시겠습니까?")){
					alert("수정이 취소되었습니다.");
					return false;
				}else{
					alert("계정이 수정되었습니다.");
					fn_modifyUserInfo();
				}
			}
		}
	
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ZONCODE').value = data.zonecode;
                document.getElementById("ADDRESS1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ADDRESS2").value = '';
                document.getElementById("ADDRESS2").focus();
            }
        }).open();
    }
</script>
	<main>
		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<h2>회원수정</h2>
				<br /> <br /> <br />

				<font color="gray">
					회원 정보를 수정할 수 있습니다. 잘못된 수정으로 인한 회원정보 소실을 주의해주시기 바랍니다.
				</font>
				<hr />

				<div>
					<div align="center">
						<form id="userModify">
							<table class="user_view" style="width: 90%;">
							<tr>
								<td colspan="2">기본정보</td>
							</tr>
							<tr bgcolor="#212926"
								style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<td style="width: 20%">구분</td>
								<td style="width: 30%">상세</td>
								<td style="width: 20%">구분</td>
								<td style="width: 30%">상세</td>
							</tr>
							<tr>
								<td scope="row">아이디</td>
								<td>${map.MEMBER_ID }</td>
								<td scope="row">회원번호</td>
								<td>${map.MEMBER_NUM }
									<input type="hidden" id="NUM" name="NUM" value="${map.MEMBER_NUM }"></td>
							</tr>
							<tr>
								<td scope="row">가입일</td>
								<td>${map.MEMBER_DATE }</td>
								<td>이름</td>
								<td>${map.MEMBER_NAME }</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input id="PASSWORD" name="PASSWORD" type="text" style="width: 75%"
									value="${map.MEMBER_PW }"></td>
								<td>
									<input type="checkbox" id="pwModify" name="pwModify" value="on">비밀번호 수정<br>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>핸드폰번호</td>
								<td><input id="PHONE1" name="PHONE1" type="text" style="width: 75%"
									value="${map.MEMBER_PHONE1 }"></td>
								<td>전화번호</td>
								<td><input id="PHONE2" name="PHONE2" type="text" style="width: 75%"
									value="${map.MEMBER_PHONE2 }"></td>
							</tr>
							<tr>
								<td>회원등급</td>
								<td><select id="RANK" name="RANK" style="width: 50%">
										<option value="0" <c:if test="${map.MEMBER_RANK == 0}">selected</c:if>>관리자</option>
										<option value="1" <c:if test="${map.MEMBER_RANK == 1}">selected</c:if>>일반회원</option>
								</select></td>
								<td>탈퇴여부</td>
								<td><select id="DEL" name="DEL" style="width: 50%">
										<option value="0" <c:if test="${MEMBER_DEL == 0}">selected</c:if>>N</option>
										<option value="1" <c:if test="${MEMBER_DEL == 1}">selected</c:if>>Y</option>
								</select></td>
							</tr>
							<tr>
								<td colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4">주소정보</td>
							</tr>
							<tr bgcolor="#212926"
								style="color: white; border-collapse: collapse; outline: 0; border: 0;">
								<td style="width: 20%">구분</td>
								<td colspan="3" style="width: 70%">상세</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td>
									<input type="text" id="ZONCODE" name="ZONCODE" placeholder="우편번호" value="${map.MEMBER_ZONCODE }">
								<td colspan="2">
									<input class="btn btn-outline-light" type="button" name="search" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="3">
									<input type="text" style="width: 90%;" id="ADDRESS1" name="ADDRESS1" placeholder="주소" value="${map.MEMBER_ADDRESS1 }"><br>
								</td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td colspan="3">
									<input type="text" style="width: 90%;" id="ADDRESS2" name="ADDRESS2" placeholder="상세주소" value="${map.MEMBER_ADDRESS2 }">
								</td>
							</tr>
							<tr>
								<td>참고항목</td>
								<td colspan="3">
									<input type="text" style="width: 90%;" id="sample6_extraAddress" placeholder="참고항목">
								</td>
							</tr>
						</table>
						</form>
						<br /> <br />
					</div>
					<br /> <br />
					<hr />
					<div align="right">
						<button class="btn btn-outline-alert"
							style="outline: 0; border: 1; border-radius: 6px; width: 160px; height: 40px;"
							value="update" id="update" onclick ="location.href = '#this'">수정</button>
						<button class="btn btn-outline-dark"
							style="outline: 0; border: 1; border-radius: 6px; width: 160px; height: 40px;"
							class="btn" value="list" id="list" onclick ="location.href = '#this'">목록으로</button>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>