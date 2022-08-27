<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- paytosement연결 -->
<script src="https://js.tosspayments.com/v1"></script>
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- ajax cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#Pay_button1").click(function() {
			$.ajax({
				type: "get",
				url: "../PayMain",
				data: {
					"ordernum" : "3221220825"
					},
				dataType: "json",
				success: function (data, status, xhr) {
					$("#Pay_span1_CLASSNAME").html(data.CLASSNAME);
					$("#Pay_span2_PLACE").html(data.PLACE);
					$("#Pay_span3_countDate").html( data.countDate+"회");
					$(".Pay_span4_price").html(data.price);
					$("#customerName").val(data.customerName);
					$("#orderNum").val(data.orderNum);
					
				},
				error: function(xhr, status, error) {
					/* console.log(status+error); */
				}
			});//ajax
		});//button.click
		
	});//document
</script>
</head>
<body>
<!-- 부트스트랩 번들 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<button id="Pay_button1" class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">결제</button>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h4 id="offcanvasRightLabel">결제 목록을 확인해 주세요</h4>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <span id="Pay_span1_CLASSNAME"></span>
    <br>
    <br>
    <span id="Pay_span2_PLACE"></span>
    <br>
    <br>
    <span id="Pay_span3_countDate"></span> &nbsp;&nbsp;    
    <span id="Pay_price" class="Pay_span4_price"></span>
    <span>원</span>
 	<br>
 	<br> 
 	<input type="hidden" id="customerName" value="">
 	<input type="hidden" id="orderNum" value="">
 	
 	
 	<section>
      <!-- ... -->
      <span>총 주문금액</span>
      <span class="Pay_span4_price" id="Pay_span4_price"></span>
      <span>원</span>
      <button id="payment-button">결제하기</button>
    </section>
    
    <script>
      var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
      var tossPayments = TossPayments(clientKey)
      var button = document.getElementById('payment-button') // 결제하기 버튼
	  var Cname = document.getElementById("Pay_span1_CLASSNAME"); //결제할 class이름
	  var Cprice = document.getElementById("Pay_span4_price");
      var CnameT = Cname.innerText/* +"외 3건" */;
      var Cusername = document.getElementById("customerName");
      var CorderNum = document.getElementById("orderNum");
	  
      button.addEventListener('click', function () {
    	  console.log(CnameT); //????????????????????????????????왜때문 빈칸????????????????

        tossPayments.requestPayment('카드', {
          amount: Cprice.innerText,
          orderId: CorderNum.value,
          orderName: Cname.innerText,
          customerName: Cusername.value,
          successUrl:'http://localhost:8097/Pay/success.jsp',
          failUrl: 'http://localhost:8097/Pay/fail.jsp',
        })
      })
    </script>

  </div>
</div>


</body>
</html>