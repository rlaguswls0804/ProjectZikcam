<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="/WEB-INF/zikcam/member/login/userIdSearchModal.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/animate.css">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
  
  html {
      height: 100%;
   }
   
   body {
        background:linear-gradient(to bottom right, #fff, #fff);
   }
   
   
#modal {
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   
.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
</style>
</head>
<script>
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

$(document).ready(function() {
	/////////???///???///???///???///////////
	// 1. ????????? ?????? ????????????
	$('#background_modal').hide();
	$(document).on("click", "#searchBtn", function(){
		$('#background_modal').show();
		$(".className").remove(); 
	});
	// 2. ????????? ?????? ??????
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. ????????? ????????? ?????? ??? ??????
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
	
	
});

//????????? & ????????? ??? ???????????? ?????? ??????
var idV = "";
// ????????? ??? ?????? ???????????? ajax
var idSearch_click = function(){
	var name = $('#MEMBER_NAME').val();
	$.ajax({
		type:"POST",
		url:"../member/findIdResult?MEMBER_NAME="
				+name+"&MEMBER_EMAIL="+$('#MEMBER_EMAIL').val(),
		success:function(data){
			if(data == "0"){
				$('#MEMID').html("?????? ????????? ????????? ??????????????????.").css("color", "blue");
				
			} else{
				$('#MEMID').text(data); 
				// ???????????? ????????? ??????
				idV = data;
			}
		}
	});
}

var pwSearch_click = function(){
	var id = $('#MEMBER_ID').val();
	$.ajax({
		type:"get",
		url : "<c:url value='/member/findPwResult'/>",
		data : "MEMBER_ID="+ $("#MEMBER_ID").val() + "&MEMBER_EMAIL=" + $("#MEMBER_EMAIL2").val() + "&random=" + $("#random").val(),
		success : function(data){
			if(data == true){
			alert("????????????????????? ?????????????????????.");
			}else{
				alert("???????????? ????????? ????????? ???????????? ????????????.");
			}
		}
	});
	
}


//https://www.phpschool.com/gnuboard4/bbs/board.php?bo_table=qna_html&wr_id=144669 ->script ??????
//https://lsk925.tistory.com/32 -> ajax ??????
</script>
<body>
	<div class="full">
		<div class="container card" style="max-width:600px; padding:30px; border-radius: 20px; background-color:#fff;">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black">
					<h2>?????????/???????????? ??????</h2>
					<font color="gray">????????? ???????????? ?????? ????????? ???????????????.</font></p>
					<br/>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-black"	for="search_1">????????? ??????</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-black" for="search_2">???????????? ??????</label>
				</div>
				
				<!-- ????????? ?????? -->
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputName_1">??????</label>
						<div>
							<input type="text" class="form-control" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="ex) ?????????">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_1">?????????</label>
						<div>
							<input type="email" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="ex) Email@gmail.com"">
						</div>
					</div>
					<div id="background_modal" class="background_modal" align="center">
						<div class="modal_contents">
							<h4>
								<b>???????????? ?????????????</b><span class="close">&times;</span>
							</h4><br>
								<h2 id="MEMID"></h2>
							<br>
							
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block" style="background-color:#26a69a; border-color:#26a69a;">??????</button>
					<br>
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}" style="background-color:#26a69a; border-color:#26a69a;">??????</a>
					</div>
				</div>
				
				
				<!-- ???????????? ?????? -->
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputId">?????????</label>
						<div>
							<input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" placeholder="ex) kimhj0804">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_2">?????????</label>
						<div>
							<input type="email" class="form-control" id="MEMBER_EMAIL2" name="MEMBER_EMAIL2" placeholder="ex) Email@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwSearch_click()" class="btn btn-primary btn-block" style="background-color:#26a69a; border-color:#26a69a;">??????</button>
						<input type="hidden" path="random" id="random" value="${random}"/>
						<br>
				
					<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}" style="background-color:#26a69a; border-color:#26a69a;">??????</a>
				</div>
				</div>
			</div>
		</div>
	</div> 
	
	
</body>
</html>

