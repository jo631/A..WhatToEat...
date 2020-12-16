<%@ page import="java.util.Random"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/css/blog-home.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



<title>메인</title>
<style>
p {
	margin: 20px 0px;
}

.filter {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px 500px 30px 500px;
	border: 5px solid #3126ff;
	border-radius: 250px;
	box-shadow: 12px 10px 8px gray;
	padding: 10px;
}

.button {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.whatToEat {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	margin: 0px 600px 70px 600px;
	border: 5px solid #2da64d;
	border-radius: 50px;
	box-shadow: 12px 10px 8px gray;
	padding: 30px;
}
#select{
	display: block;
	font-size: 30px;
	padding: 20px;
	cursor: pointer;
	transition: all 2s;
}
#result{
	padding: 20px;
	font-size: 30px;
	display: none;
	transition: all 2s;
}

.check {
	padding: 10px 10px;
}
</style>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>
	<!-- Filter -->
	<%
	List<String> foods = (List<String>) request.getAttribute("foods");
	if (foods == null)
		foods = new ArrayList<String>();

	List<String> allFood = new ArrayList<>(Arrays.asList("구이", "국밥", "도시락", "디저트", "분식", "아시안", "양식", "일식", "족발,보쌈", "주점",
			"중식", "찜,탕", "치킨", "패스트푸드", "피자", "한식"));
	%>
	

	
	<form name="form" action="FoodServlet" method="post" class="filter">
		<div style="font-weight: bold; font-size: 25px">이건 제외해주세요!</div>
		<br>
		<%
			for (int i = 0; i < allFood.size(); i++) {
				if (i % 6 == 0) {
		%>
				<div style="display: flex">
		<%
				}
		%>
					<div class="check"><input type='checkbox' name="food" value=<%=allFood.get(i)%>
						<%=foods.contains(allFood.get(i)) ? "checked" : ""%> /><%=allFood.get(i)%></div>
		<%
				if (i % 6 == 5 || i+1 == allFood.size()) {
		%>
				</div>
		<%
				}
			}
		%>
		<input type='hidden' name="rand" value="" />
		<button type="button" onclick="onSubmit()" class="btn btn-primary">선택</button>
	</form>


	<%
		for (String i : foods) {
		allFood.remove(i);
	}
	//필터에 있는것들 제거한 뒤 randValue에 
	String randValue;
	Random r = new Random();
	if (allFood.isEmpty()) {
		randValue = "필터에 전부 다 체크돼있어요";
	} else {
		randValue = allFood.get(r.nextInt(allFood.size()));
	}
	%>
	
	<div class="whatToEat">
		<!-- <div id="select">아 뭐먹지?</div> -->
		<div style="padding:50px;">		
			<div id="select" class="badge rounded-pill bg-primary text-white">아 뭐먹지?</div>
			<div id="result" class="badge rounded-pill bg-success text-white">Success</div>
		</div>
		<div class="button">
			<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
				<form name="go" action="result.jsp" method="post">	
					<input type="radio" name="range" value="3" >3km
					<input type="radio" name="range" value="5" checked>5km
					<input type="radio" name="range" value="10" >10km
					<input type="radio" name="range" value="100" >100km
					<input type="hidden" id="latitude" name="latitude" value="">
					<input type="hidden" id="longitude" name="longitude" value=""> 
					<input type="hidden" name="value" value=<%=allFood.isEmpty() ? "" :randValue %>>
					<div class="button">
						<button type="submit" class="btn btn-success">검색</button>
					</div>
				</form>
				
				<form name="restart" action="FoodServlet" method="post"
					style="margin-top: 20px;">
					<%
						for (String i : foods) {
					%>
					<input type="hidden" name="food" value=<%=i%> />
					<%
						}
					%>
					<input type="hidden" name="rand" value=<%=allFood.isEmpty() ? "" :randValue %> />
					<button type="button" class="btn btn-warning" onclick="onRestart()">재시작</button>
				</form>
			
			</div>
		</div>
	</div>
	
	<!-- Button -->
	
	<script type="text/javascript">
		function checkForm() {
			var food = [];
			var checkCount = document.getElementsByName("food").length;

			for (var i = 0; i < checkCount; i++) {
				if (document.getElementsByName("food")[i].checked == true) {
					food.push(document.getElementsByName("food")[i].value);
				}
			}
			console.log(food);
		}

		function onSubmit() {
			var form = document.form;
			form.submit();
		}

		function onRestart() {
			var form = document.restart;
			form.submit();
		}
	</script>


	<script>
			$(function() {
				// Geolocation API에 액세스할 수 있는지를 확인
				if (navigator.geolocation) {
					//위치 정보를 얻기
					navigator.geolocation.getCurrentPosition(function(pos) {
						$('#latitude').html(pos.coords.latitude); // 위도
						$('#longitude').html(pos.coords.longitude); // 경도
						
						document.go.latitude.value = pos.coords.latitude;
						document.go.longitude.value = pos.coords.longitude;	
					});
				} else {
					alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
					//구하지 못했을때 latitude랑 longitude 초기값 설정하기
				}
			});

			 </script>
	
	<script>
	$(function(){
	    $('#select').click(function(){
	        $('#select').text("<%=randValue%>");
	        $('#result').text("<%=randValue%>");
	        $('#result').css("display","block");
	        $('#select').css("display","none");
	    });
	});
	
	</script>
	
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>