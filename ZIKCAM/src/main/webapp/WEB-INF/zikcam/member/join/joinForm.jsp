<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">

$(function(){
	$(document).on("click", "#emailBtn", function(){ //이메일 발송
	$.ajax({
		type:"get",
		url : "<c:url value='/member/createEmailAuth'/>",
		data : "userEmail=" + $("#email1").val()+"@"+$("#email2").val() + "&random=" + $("#random").val(),
		success : function(data){
			if(data == true){
			alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
			}else{
				alert("이미 사용중인 이메일");
			}
		},
		error: function(data){
			alert("에러가 발생했습니다.");
			return false;
		}
	});
	});	
	
	$(document).on("click", "#emailAuthBtn", function(){ //인증번호 확인
		$.ajax({
			type:"get",
			url:"<c:url value='/member/emailConfirm'/>",
			data:"authCode="+$('#emailAuth').val()+"&random="+$("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증 완료되었습니다.");
					$('#chkEm').html("이메일 인증 완료").css("color", "blue");  
				}else if(data=="false"){
					alert("인증번호를 잘못 입력하셨습니다.");
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.")
			}
		});
	}); 
});


function zipcode() {//우편번호 검색창
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEMBER_ZONCODE').value = data.zonecode;
                document.getElementById("MEMBER_ADDRESS1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MEMBER_ADDRESS2").focus();
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                alert("도로명 주소를 입력해주세요.");
            	return false;
            }
           
        }
    }).open();
}

   function back(){
      history.go(-1);
   }
   $(document).ready(function() { //id check
      $("#idCheck").on("click", function(e) {
         e.preventDefault();
         fn_idCheck();
      });
   });
 
   $(function(){ //email select  
   $(document).ready(function(){
      $('select[name=email]').change(function() {
         if($(this).val()=="self"){
            $('#email2').val("");
            $("#email2").attr("readonly", false);
            $('#email2').focus();
         } else {
            $('#email2').val($(this).val());
            $("#email2").attr("readonly", true);
         }
      });
   });
   });

   function fn_idCheck(){ //id check
       var MEMBER_ID = {MEMBER_ID : $('#MEMBER_ID').val()};
       $.ajax({
           url:"<c:url value='/member/idCheck'/>",
           type:'get',
           data: MEMBER_ID,
           success:function(data){              
               if($.trim(data)=="0"){
                  $('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");         
               }else{
                  $('#chkMsg').html("사용불가능한 아이디 입니다.").css("color", "red");
               }
           },
           error:function(){
                   alert("에러입니다");
           }
       });
   };
  
   $(document).ready(function(){ //email select value
         $("#email").change(function(){
            $("#email2").val($(this).val());
         });
      });

   $(document).ready(function() { //비밀번호 일치 확인
        //[1] lblError 레이어 클리어
        $('#MEMBER_PW').keyup(function() {
            //$('#pwr').remove(); // 제거
            $('#pw').text(''); // 제거가 아니라 클리어
               $('#password2').val('');
        });
        //[2] 암호 확인 기능 구현
        $('#password2').keyup(function() {
            if ($('#MEMBER_PW').val() != $('#password2').val()) {
                $('#pw').text(''); // 클리어
                $('#pw').html("암호가 일치하지 않습니다.").css("color", "red");          //레이어에 HTML 출력
            }
            else {
                $('#pw').text(''); // 클리어
                $('#pw').html("암호가 일치합니다.").css("color", "blue");
            }
        });
    });
   
   $(document).ready(function() { //회원가입 버튼 클릭시
      $("#join").on("click", function(e) {
         e.preventDefault();
         fn_join();
      });
   });
   
   function fn_join(joinForm) { //회원가입 버튼 클릭시(유효성검증, 데이터입력)
      var chk = $("input[name=agree_required]");
      if(!$("#MEMBER_ID").val()){
         alert("아이디를 입력해주세요.");
         $("#MEMBER_ID").focus();
         return false;
      }
      if($("#chkMsg").html()!="사용가능한 아이디 입니다."){
         alert("아이디 중복확인을 해주세요.");
         return false;
      }
      if(!$("#MEMBER_PW").val()){
         alert("비밀번호를 입력해주세요.");
         $("#MEMBER_PW").focus();
         return false;
      }
      if(!$("#password2").val()){
         alert("비밀번호 확인을 입력해주세요.");
         $("#password2").focus();
         return false;
      }
      if($("#pw").html()!="암호가 일치합니다."){
         alert("암호가 일치하지 않습니다.");
         return false;
      }
      if(!$("#MEMBER_NAME").val()){
         alert("이름을 입력해주세요.");
         $("#MEMBER_NAME").focus();
         return false;
      }
      /* if(!$("#MEMBER_JUMIN").val()){
          alert("주민등록번호를 입력해주세요.");
          $("#MEMBER_JUMIN").focus();
          return false;
       } */
      
     
      if(!$("#jumin1").val() || !$("#jumin2").val()){
          alert("주민등록번호를 입력해주세요.");
          if(!$("#jumin1").val()){
             $("#jumin1").focus(); 
          }else{
             $("#jumin2").focus();
          }
          return false;
       }
      
      if(!$("#email1").val() || !$("#email2").val()){
         alert("이메일을 입력해주세요.");
         if(!$("#email1").val()){
            $("#email1").focus();
         }else{
            $("#email2").focus();
         }
         return false;
      }
      if($("#chkEm").html()!="이메일 인증 완료"){
          alert("이메일 인증을 해주세요.");
          return false;
      } 
      if(!$("#phone2").val() || !$("#phone3").val()){
         alert("휴대전화를 입력해주세요.");
         if(!$("#phone2").val()){
            $("#phone2").focus();
         }else{
            $("#phone3").focus();
         }
         return false;
      }

      if(!$("#MEMBER_ZONCODE").val()){
          alert("우편번호를 입력해주세요.");
          $("#MEMBER_ZONCODE").focus();
          return false;
       }
      if(!$("#MEMBER_ADDRESS1").val()){
          alert("집주소 입력해주세요.");
          $("#MEMBER_ADDRESS1").focus();
          return false;
       }
      if(!$("#MEMBER_ADDRESS2").val()){
          alert("상세주소를 입력해주세요.");
          $("#MEMBER_ADDRESS2").focus();
          return false;
       }
      if(chk[0].checked==false){ 
         alert("서비스 이용약관에 동의해주세요.");
         return false; 
      }
      var email = $("#email1").val()+"@"+$("#email2").val();
      var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
      var jumin = $("#jumin1").val()+"-"+$("#jumin2").val();
      var comSubmit = new ComSubmit("joinForm");
      comSubmit.setUrl("<c:url value='/member/memberVerify'/>");
      $("#MEMBER_EMAIL").val(email);
      $("#MEMBER_PHONE1").val(phone);
      $("#MEMBER_JUMIN").val(jumin);
      comSubmit.submit();
   } 
   $("#joinForm").on("submit",function(e){
   });
   </script>
   <script>
   $(".login-form").validate({
	   rules: {
	     username: {
	       required: true,
	       minlength: 4
	     },     
	     email: {
	       required: true,
	       email:true
	     },
	     password: {
	       required: true,
	       minlength: 5
	     },
	     cpassword: {
	       required: true,
	       minlength: 5,
	       equalTo: "#password"
	     }
	   }, 
	   //For custom messages
	   messages: {
	     username:{
	       required: "Enter a username",
	       minlength: "Enter at least 4 characters"
	     }
	   },
	   errorElement : 'div',
	   errorPlacement: function(error, element) {
	     var placement = $(element).data('error');
	     if (placement) {
	       $(placement).append(error)
	     } else {
	       error.insertAfter(element);
	     }
	   }
	 });

	 </script>
</head> 
<body> 
        <!--회원가입 부분-->
        <section class="signup-wrap">
			<div id="login-page" class="row" style="width:100%;">
			  <div class="col s12 z-depth-4 card-panel" style="border-radius: 20px;">
			  <br>
			  <button class="btn btn-outline-dgray" 
					style="outline: 1; border: 1; font-size: 1em; width: 150px; height: 30px;" onclick="location.href='/zikcam/prod/main'">메인으로
			  </button> 
			    <form id="joinForm" method="get">
			      <div class="row">
			        <div class="input-field col s12 center">
			          <h4><img src="/zikcam/resources/images/zikcam_black_300.png"></h4>
			          
			        </div>
			      </div>
			          <p class="margin center medium-small sign-up" align="right">이미 가입되어 있으신가요? <a href="/zikcam/member/loginForm">Login</a></p>
			        
			      <div class="row margin">
			        <div class="input-field col s12">
			          <p>아이디</p>
			          <input type="text" id="MEMBER_ID" name="MEMBER_ID"  style="width:95%;" placeholder="아이디">
			          <button class="btn btn-outline-dgray" type="button"
						style="outline: 1; border: 1; font-size: 1em; width: 175px; height: 30px;" onclick="fn_idCheck();">아이디 중복 확인
			 		  </button>
			          <label for="username"></label>
			       
			          <!-- <button onclick="fn_idCheck();" type="button">아이디 중복 확인</button> -->
			            
			        </div>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id = "chkMsg"></span>
			      </div>
			      
			      <div class="row margin">
			        <div class="input-field col s12">
			          <p>비밀번호</p>
			          <input type="password" id="MEMBER_PW" name="MEMBER_PW" style="width:90%;" placeholder="비밀번호">
			          
			          <label for="username"></label>
			        </div>
			      </div>
			      
			      <div class="row margin">
			        <div class="input-field col s12">
			          <p>비밀번호 확인</p>
			          <input type="password" id="password2" style="width:95%;" placeholder="비밀번호 확인">
			          
			          <label for="username"></label>
			        </div>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="pw"></span>
			      </div>
			      
			       
			      <div class="row margin">
			        <div class="input-field col s12">
			        <p>이름</p>
			          <input type="text" id="MEMBER_NAME" name="MEMBER_NAME" style="width:90%;" placeholder="이름">
			          
			          <label for="username"></label>
			        </div>
			      </div>
			        
			      <div class="row margin">
			        <div class="input-field col s12">
			        <p>주민등록번호</p>
			          <input type="hidden" id="MEMBER_JUMIN" name="MEMBER_JUMIN">
			          	<input type="text" id="jumin1" name="jumin1" style="width:45%;" maxlength='6'> 
			               -
			          	<input type="password" id="jumin2" name="jumin2" style="width:45%;" maxlength='7'> 
			          <label for="username"></label>
			        </div>
			      </div>
			       
			      <!-- <div class="row margin">
			        <div class="input-field col s12">
			             <input type="radio" id="MEM_GEN_M" name="MEM_GEN" value="남성"/>&nbsp;&nbsp;남성&nbsp;&nbsp;
			             <input type="radio" id="MEM_GEN_F" name="MEM_GEN" value="여성"/>&nbsp;&nbsp;여성&nbsp;&nbsp;
			             
			        </div>
			      </div> -->
			       <br/>
			      <div class="row margin">
			        <div class="input-field col s12">
			        <p>이메일</p>
			       		<p><font color="gray" size="1.5px">*이메일 발송에 1분 이상 소요될 수 있습니다.</font></p>
			       		<p><font color="gray" size="1.5px">* 한번 클릭하신 후 차분히 기다려주세요. 알림창이 뜹니다.</font></p>
			       		<br>
			          	   <input type="hidden" id="MEMBER_EMAIL" name="MEMBER_EMAIL">
			               <input type="text" id="email1" name="email1" style="width:45%;" placeholder="이메일"> 
			               @
			               <input type="text" id="email2" name="email2" value="" style="width:45%;" > 
			            	<!--
			               <select id="email" name="email">
			                  <option value="self">직접입력</option>
			                  <option value="naver.com">naver.com</option>
			                  <option value="hanmail.net">hanmail.net</option>
			                  <option value="gmail.com">gmail.com</option>
			                  <option value="nate.com">nate.com</option>
			               </select>
			 				-->
			 			 <button class="btn btn-outline-dgray" type="button" id="emailBtn"
							style="outline: 1; border: 1; font-size: 1em; width: 150px; height: 30px; style="background-color:#26a69a; border-color:#26a69a;">이메일 발송
			 		  	 </button> 
			               <!-- <button type="button" id="emailBtn">이메일 발송</button> -->
			               <br/>
			               <br/>
			               <input type="text" id="emailAuth" name="emailAuth" placeholder="인증번호" style="width:85%;" />
			               <br>
			             <button class="btn btn-outline-dgray" type="button" id="emailAuthBtn"
							style="outline: 1; border: 1; font-size: 1em; width: 150px; height: 30px;">이메일 인증
			 		  	 </button>
			 		  
			 		  <!-- <button type="button" id="emailAuthBtn">이메일 인증</button> -->
			               <input type="hidden" path="random" id="random" value="${random }"/>
			          <label for="username"></label>
			        </div>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id = "chkEm"></span>
			      </div>
			       <br>
			       <br>
			      <div class="row margin">
			      	<p>전화번호</p>
			        <div class="input-field col s12">
			          <input type="hidden" id="MEMBER_PHONE1" name="MEMBER_PHONE1">
			         <input type="text" id="phone1" name="phone1" style="width:30%;" value="010" maxlength='3'>
          
          			 -<input type="text" id="phone2" name="phone2" style="width:30%;" maxlength='4'> 
          
          			 -<input type="text" id="phone3" name="phone3" style="width:30%;" maxlength='4'> 
			          
			          <label for="username"></label>
			        </div>
			      </div>
			       
			      <div class="row margin">
			        <div class="input-field col s12">
			        <p>우편번호</p>
			          <input type="text" id="MEMBER_ZONCODE" name="MEMBER_ZONCODE" style="width:90%;" placeholder="우편번호">
			            <button class="btn btn-outline-dgray" type="button"
							style="outline: 1; border: 1; font-size: 1em; width: 160px; height: 30px;" onclick="zipcode()" value="우편번호 찾기">우편번호 찾기
			 		  	</button>
			 		  	 <!-- <input type="button" onclick="zipcode()" value="우편번호 찾기"> -->
			 		  	 <br>
			          <label for="username"></label>
			        </div>
			      </div>
			       
			      <div class="row margin">
			        <div class="input-field col s12">
			        <p>주소</p>
			          <input type="text" id="MEMBER_ADDRESS1" name="MEMBER_ADDRESS1" style="width:90%;" placeholder="주소">
			          <label for="username"></label>
			        </div>
			      </div>
			       
			      <div class="row margin">
			        <div class="input-field col s12">
			        <p>상세주소</p>
			          <input type="text" id="MEMBER_ADDRESS2" name="MEMBER_ADDRESS2" style="width:90%;" placeholder="상세주소">
			          <label for="username"></label>
			        </div>
			      </div>
			      
			      <div>
			          <label> 
			          <fieldset> 
			          <legend>ZIKCAM 서비스 이용약관 동의</legend>
			             <svg width="280" height="30" viewBox="0 0 31 31">
			                <g fill="none" fill-rule="evenodd">
			                   <g>
			                      <circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
			                      <circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
			                   </g>
			                   <path stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
			                </g>
			             </svg>
			          </label>
			          <div class="lReCa">
			             <iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/station3_180816_dabang_serviceaccessterms.html"
			                scrolling="yes" width="100%" height="100%" frameborder="0" allowtransparency="true"></iframe>
			          </div>
			          <br/>
			          <input type="checkbox" name="agree_required"> 동의합니다.
			          </fieldset>
			       </div>
			      
			      <div class="row">
			        <div class="input-field col s12">
			        	<button id="join" class="btn btn-outline-dgray" style="outline: 1; border: 1; font-size: 1em; width: 150px; height: 50px;">회원가입</button>
			        	
			         	<button onclick="back();" type="button" class="btn btn-outline-dgray" style="outline: 1; border: 1; font-size: 1em; width: 150px; height: 50px;">취소</button>
			          
			          
			        </div>
			        
			      </div>
			    </form>
			  </div>
			</div>
           
        </section>
</body>
</html>