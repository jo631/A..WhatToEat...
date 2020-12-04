<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="vendor/css/blog-home.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	>
<link
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css"
	rel="stylesheet" />


<title>메인</title>
<style>
p {
	margin: 20px 0px;
}
.filter{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 30px 200px;
	border: 1px solid black;
}
.button{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.whatToEat{
	display: flex; 
	justify-content: center; 
	align-items: center; 
	height: 200px;
	margin: 0px 500px 20px 500px;
	border: 1px solid black;
}

.check{
	padding: 0 10px;
}
</style>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>
	
	<!-- Filter -->
	<div class="filter">
		<div style="display: flex;">
			<div class="check"><input type='checkbox' name="food" value="치킨"/> 치킨</div>
			<div class="check"><input type='checkbox' name="food" value="피자"/> 피자</div>
			<div class="check"><input type='checkbox' name="food" value="분식"/> 분식</div>
			<div class="check"><input type='checkbox' name="food" value="일식"/> 일식</div>
			<div class="check"><input type='checkbox' name="food" value="아시안"/> 아시안</div>
			<div class="check"><input type='checkbox' name="food" value="중식"/> 중식</div>
		</div>
		
		<div style="display: flex;">
			<div class="check"><input type='checkbox' name="food" value="족발/보쌈"/> 족발/보쌈</div>
			<div class="check"><input type='checkbox' name="food" value="찜/탕"/> 찜/탕</div>
			<div class="check"><input type='checkbox' name="food" value="양식"/> 양식</div>
			<div class="check"><input type='checkbox' name="food" value="주점"/> 주점</div>
			<div class="check"><input type='checkbox' name="food" value="국밥"/> 국밥</div>
		</div>
		
		<button type="button" class="btn btn-primary">선택</button>
	</div>
	
	<div class="whatToEat">
		이미지나 먹거리 이름이 들어갈 자리 
	</div>
	
	<!-- Button -->
	<div class="button">
		<button type="button" class="btn btn-success">아 뭐먹지?</button>
		<button style="margin-top:20px;" type="button" class="btn btn-warning">재시작</button>
	</div>

	<script tpye="text/javascript">
		function checkForm() {
			var food = [];
			var checkCount = document.getElementsByName("food").length;
			
			for(var i=0; i<checkCount; i++){
				if(document.getElementsByName("food")[i].checked == true){
					food.push(document.getElementsByName("food")[i].value);
				}
			}
			console.log(food);
		}
	</script>


	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>