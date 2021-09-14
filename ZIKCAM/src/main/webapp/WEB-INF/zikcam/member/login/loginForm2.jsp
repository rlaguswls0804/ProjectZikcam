<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="main-container">
		<div class="main-wrap">
		<header>
			
			<div class="logo-wrap">
				<img src="/zikcam/resources/images/zikcam_black.png">
			</div>
		</header>
		<div class ="subtitle-wrap">
		<h1 align=center>로그인</h1>
		</div>
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="ID" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="Password" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button onclick="location.href='/zikcam/prod/main'">로그인 하기</button>
			</div>
			<div class="links">
            <a href="/zikcam/member/findId">ID 찾기</a> | <a href="/zikcam/member/findPw">PW 찾기</a> | <a href="/zikcam/member/join">회원가입</a>
        </div>
        
			 
		<section class="Easy-sgin-in-wrap">
			<div class="login-contact">
				<button>네이버 연동</button>
			</div>
		</section> 
		 <!-- Footer-->
       <footer class="py-5 bg-light" style="background-color:#808080">
           
         <div style="text-align:center;">
         	<img src="/zikcam/resources/images/New 직캠로고 검정 1.png" width="300" height="100"><br />
         </div>
         <br />
         <div class="container"><p class="m-0 text-center" style="color:#4b4b4b">회사명 : 직캠 &copy; 사업자등록번호 : 20210308_JR<br />
           																고객센터 총괄책임자 송다솔(사원) 연락처 : 010-xxxx-xxxx<br />
            															통신판매업신고 : 제 XX19 -  서울종로 - XX11호<br />
            															주소 : 서울특별시 종로구 관철동 15-5 미려빌딩 3층 302호 1팀 직캠컴퍼니</p></div>

         
    </footer>
        
</body>
</html>