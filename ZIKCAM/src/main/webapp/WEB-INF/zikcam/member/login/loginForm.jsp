<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta name="viewport" content="width=device-width, initial-scale=1">  
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
   <style>
  
   
   html {
      height: 100%;
   }
   
   body {
        background:linear-gradient(to bottom right, #fff, #fff);
        
   }
   
   
    .card {
    	
        margin: 0 auto; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        width: 100%;
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
   }
	.gdsDes { 
		max-width: 100%; max-height: 100%; width:auto; height:auto;
	}
   
   </style>
   <%-- <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script> --%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script type="text/javascript">

      function begin(){
         document.myform.MEMBER_ID.focus();
       }
       function checkIt(){
         if(!document.myform.MEMBER_ID.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.MEMBER_PW.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }

       }
       
       function fsubmit(){
          var id = $("#MEMBER_ID")[0].value;
          var pw = $("#MEMBER_PW")[0].value;
          if(id==null || id==''){
             alert("아이디를 입력하세요.");
             return false;
          }
          if(pw==null || pw==''){
             alert("비밀번호를 입력하세요.");
             return false;
          }
          myform.submit();
       }       
       
       $(document).ready(function(){
          
          // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
          var userInputId = getCookie("userInputId");
          $("#MEMBER_ID").val(userInputId);  
          
          if($("#MEMBER_ID").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
             $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
          }
          
          $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
             if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("#MEMBER_ID").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
             }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
             }
          });
          
          // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
          $("#MEMBER_ID").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
             if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("#MEMBER_ID").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
             }
          });
       });
       
       
        
       function setCookie(cookieName, value, exdays){ //쿠키 저장하는 함수
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays); //설정 일수만큼 현재시간에 만료값으로 지정
           var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
       }
        
       function deleteCookie(cookieName){ //쿠키 삭제
           var expireDate = new Date();
           expireDate.setDate(expireDate.getDate() - 1);
           document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
       }
        
       function getCookie(cookieName) { //쿠키 가져오는 함수
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if(start != -1){
               start += cookieName.length;
               var end = cookieData.indexOf(';', start);
               if(end == -1)end = cookieData.length;
               cookieValue = cookieData.substring(start, end);
           }
           return unescape(cookieValue);
       }
       
       function enterkey() {
           if (window.event.keyCode == 13) {
    
        	   fsubmit();
          	 }
  		}
   </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
   <form name="myform" action="login" method="post" class="form-signin">
      <div class="card align-middle" style="max-width:35rem; border-radius:20px;">
         <div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;"><img src="/zikcam/resources/images/zikcam_black_300.png"></h2>
            </div>
             
            <div class="card-body">   
               <INPUT type="text" name="MEMBER_ID" id="MEMBER_ID" size="15" maxlength="15" class="form-control" placeholder="ID" onkeyup="enterkey();"><br>  
            </div>
   
            <div class="card-body">
               <INPUT type=password name="MEMBER_PW" id="MEMBER_PW" size="15" maxlength="15" class="form-control" placeholder="Password" onkeyup="enterkey();"> <br>
            </div>
         
            <div class="card-body">
               <input type="button" class="btn btn-lg btn-primary btn-block" value="로그인" onclick="fsubmit();" style="background-color:#26a69a;">
            </div>
         
            <div align="center">
               <label> 
                  <input type="checkbox" id ="idSaveCheck" value="idSaveCheck" >아이디저장
               </label>
            </div>  
			 <div align="center">
			      <input type="button" value="회원가입" id="joinEv" onkeyup="enterkey();" onclick="location.href='/zikcam/member/join'" class="bttn-bordered bttn-xs bttn-primary"/>&nbsp;<input type="button" value="ID/PW 찾기" onclick="location.href='/zikcam/member/findId'" class="bttn-bordered bttn-xs bttn-primary"/>
			 </div>
    		<br/>
         </div>
      </div>
   </form>
   
</body>
</HTML>