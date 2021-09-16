<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <%@ include file="/WEB-INF/include/include-header.jspf" %>
        <script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    </head>
    
    <body> 
        <input type="hidden" id="start_date" value="${start_date}"/>
		<input type="hidden" id="end_date" value="${end_date}"/>
        <hr />
        <hr style="background-color:#a2b7cd; height:20px; padding-top: 2.5rem !important; padding-bottom: 3rem !important;">
        <div style="background-color:#ffcf03"><br><br>
	        <h1 align="center"><font color="#373737"><b>대여하실 일정을 선택해주세요<b></b></h1><br>
	        <div class="text" align="center">
		        <tr><td>
		        <div id="rental_title"></div>
		        <label for="start"><font color="white" style="font-size:1.5em">대여 시작일 :&nbsp;</font></label>
		
				<input style="size:1.5em; width:160px; height:32px" type="text" id="testDatepicker1" name="start_date" value="${start_date }" placeholder="날짜를 선택해주세요.">
				 
				&nbsp;
		
		        <label for="end"><font color="white" style="font-size:1.5em">대여 종료일 :&nbsp;</font></label>
		
				<input style="size:1.5em; width:160px; height:32px" type="text" id="testDatepicker2" name="end_date" value="${end_date }" placeholder="날짜를 선택해주세요.">
				
			    </td></tr>
		    
		    </div>
		    <br><br>
		    <div class="text-center">
			    
			    <a href="#this" id="list">
			    	<button style="background-color:#373737; border-color:black; color:white; font-size:1.5em" id="nextbt"><img src="images/" alt="">확인</button>
				</a>
			</div>
		    <br><br>
	    </div>
	    
	    <hr style="background-color:#a2b7cd; height:20px"><hr />
<%@ include file="/WEB-INF/include/include-body.jspf" %>       
<script type="text/javascript">
	$.datepicker.setDefaults({
		showOn:"both",
		buttonImage:"../resources/images/calendar-icon.png",
		buttonImageOnly:true,
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    minDate:"M+1",
	});
	
	$("#testDatepicker1").datepicker();
	$("#testDatepicker2").datepicker();
	
	$("#testDatepicker1").datepicker('setDate',$('input#start_date').val());
	$("#testDatepicker2").datepicker('setDate',$("input#end_date").val());
	
    $(document).ready(function(){
    	if('${startdate != null}'){
			$('#testDatepicker1').val('${start_date}');
			$('#testDatepicker2').val('${end_date}');
		}else{
			$('#testDatepicker1').val('${rental_start}');
			$('#testDatepicker2').val('${rental_end}');
		}
    	
    	$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_openRentalList();
				
				$.ajax({
	   				 url : '../prod/selectRentalList', 
	   	              type : "get", 
	   	              data : {"start_date" : $("#start_date").val(), "end_date" : $("#end_date").val()},
	   	              success : function(data){ 
	   	            	fn_openRentalList();
	   	                 
	   	              },
	   	              error : function(data){
	   	            	 alert('error');
	   	                
	   	              }
	   				})
	    			console.log(start_date);
			});
    	
    	$('button#nextbt').on('click', function() {
        	// 대여 기간이 공백일때
	        if ($("#testDatepicker1").val() == "" || $("#testDatepicker2").val() == "") {
	        	$("#rental_title").html("<font color='red'> * 대여할 기간을 선택해주세요.</font><br>");
	        	document.getElementById('testDatepicker1').focus();
	        		
	        	if($("#testDatepicker1").val() != "") {
	        		document.getElementById('testDatepicker2').focus();
	        	}
	        	return false;
	        } else {
	        	// 종료일이 시작일보다 앞설때
		        var date1 = new Date($("#testDatepicker1").datepicker("getDate"));
		        var date2 = new Date($("#testDatepicker2").datepicker("getDate"));
		            
		        console.log(date1);
		        console.log(date2);
		            
		        if (date1 >= date2) {
		            $("#rental_title").html("<font color='red'> * 대여 종료일은 대여 시작일 다음날부터 선택가능합니다.</font><br>");
		            document.getElementById('testDatepicker1').focus();
		            return false;
		        }else{
		        	var start_date = $.datepicker.formatDate("yy-mm-dd",$("#testDatepicker1").datepicker("getDate"));
    	        	var end_date = $.datepicker.formatDate("yy-mm-dd",$("#testDatepicker2").datepicker("getDate"));
		        	$.ajax({
		   				 url : '../prod/selectRentalList', 
		   	              type : "get", 
		   	              data : {"start_date" : $("input[name=start_date]").val(), "end_date" : $("input[name=start_date]").val()},
		   	              success : function(data){ 
		   	            	fn_openRentalList();
		   	                 
		   	              },
		   	              error : function(data){
		   	            	 alert('error');
		   	                
		   	              }
		   				})
		        }
	        }
	    });
    });
	 	
	function fn_openRentalList(){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='../prod/rentalList' />");
		comSubmit.addParam("start_date", $("input[name=start_date]").val());
		comSubmit.addParam("end_date", $("input[name=end_date]").val());
		comSubmit.submit();
	}
    </script>    
    </body>
</html>
