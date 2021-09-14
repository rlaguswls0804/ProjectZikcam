<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/include-body.jspf" %> 
</head>
<body> 
	<input type="hidden" id="MEMBER_ID" name="MEMBER_ID" value="${session_MEM_ID}"/>
	<input type="hidden" id="PROD_NAME" name="PROD_NAME" value="${map.prod_name}"/>
	<input type="hidden" id="ORDER_RCV_NAME" name="ORDER_RCV_NAME" value="${map.rcv_name}"/>
	<input type="hidden" id="ORDER_RCV_ZONCODE" name="ORDER_RCV_ZONCODE" value="${map.rcv_zoncode}"/>
	<input type="hidden" id="ORDER_RCV_ADDRESS1" name="ORDER_RCV_ADDRESS1" value="${map.rcv_address1}"/>
	<input type="hidden" id="ORDER_RCV_ADDRESS2" name="ORDER_RCV_ADDRESS2" value="${map.rcv_address2}"/>
	<input type="hidden" id="ORDER_RCV_PHONE" name="ORDER_RCV_PHONE" value="${map.rcv_phone}"/>
	<input type="hidden" id="ORDER_DPRICE" name="ORDER_DPRICE" value="${map.dprice}"/>
	<input type="hidden" id="ORDER_PRICE" name="ORDER_PRICE" value="${map.lastPrice}"/>
	<input type="hidden" id="ORDER_MEMO" name="ORDER_MEMO" value="${map.memo}"/>
	<input type="hidden" id="ORDER_PAYTYPE" name="ORDER_PAYTYPE" value="${map.pay}"/>
	<input type="hidden" id="RENTAL_START" name="RENTAL_START" value="${rental_start}"/>
	<input type="hidden" id="RENTAL_END" name="RENTAL_END" value="${rental_end}"/>
	<input type="hidden" id="email" name="email" value="${map.email}"/>
	
    <script> 
    $(function(){ 
        var IMP = window.IMP; // 생략가능
        IMP.init('imp66479795'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'inicis',
            /*
            'kakao':카카오페이,
            html5_inicis':이니시스(웹표준결제)
            'nice':나이스페이
            'jtnet':제이티넷
            'uplus':LG유플러스
            'danal':다날
            'payco':페이코
            'syrup':시럽페이
            'paypal':페이팔
            */
			pay_method : 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			*/
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '직캠상품',
         	//결제창에서 보여질 이름
            amount : "${map.lastPrice}",
          	//가격
          	buyer_email : 'rlaguswls0804@naver.com',
            buyer_name : "${map.rcv_name}",
            buyer_tel : "${map.rcv_phone}",
            buyer_addr : "${map.rcv_address2}",
            buyer_postcode : "${map.rcv_zoncode}",
            //m_redirect_url : 'http://www.naver.com'
            /*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                })
                //성공시 이동할 페이지
                $.ajax({
			        type: "POST",
			    	url: "<c:url value='/prod/orderTable'/>",
			    	data:{
				    		MEMBER_ID:$("input#MEMBER_ID").val(), 
				    		ORDER_RCV_NAME:$("input#ORDER_RCV_NAME").val(),
				    		ORDER_RCV_ZONCODE:$("input#ORDER_RCV_ZONCODE").val(), 
				    		ORDER_RCV_ADDRESS1:$("input#ORDER_RCV_ADDRESS1").val(),
				    		ORDER_RCV_ADDRESS2:$("input#ORDER_RCV_ADDRESS2").val(),
				    		ORDER_RCV_PHONE:$("input#ORDER_RCV_PHONE").val(), 
				    		ORDER_DPRICE:$("input#ORDER_DPRICE").val(), 
				    		ORDER_PRICE:$("input#ORDER_PRICE").val(), 
				    		ORDER_MEMO:$("input#ORDER_MEMO").val(),
				    		ORDER_PAYTYPE:$("input#ORDER_PAYTYPE").val(),
				    		RENTAL_START:$("input#RENTAL_START").val(), 
				    		RENTAL_END:$("input#RENTAL_END").val()
			    		},
			    	success: function(data){
			    		location.href="../prod/orderPaySuccess";
			    	},
			    	error:function(request, error) {
			    		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    	}
			    });
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="../prod/orderPayFail";
                alert(msg);
            }
        });
        
    });
     
    
    </script>
 
</body>
</html>
