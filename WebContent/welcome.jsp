<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link href="./resources/css/blog-home.css"/>
<link href="./resources/css/bootstrap.css" rel="stylesheet"/>
	<title>상품 </title>
	<style>
      p { margin:20px 0px; }
    </style>
</head>

<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">아 뭐먹지</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">홈
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">로그인</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
 
	
	<div class="container">
      <div class="row">
      <!-- Blog Entries Column -->
 			<%
				for(int i=0;i<6;i++){
			%>
        <div class="col-4">
        <p>  </p>
        	<div class="card">
          	<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title"><%=i+1 %>번째</h2>
            <p class="card-text">ㅇㄹㅇㄹㅇㄹ</p>
            <a href="#" class="btn btn-primary">Read More &rarr;</a>
          </div>
        </div>
        </div>
        	<% } %>
      </div>
    </div>
 
  <!-- Footer -->
  <p></p>
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>	

 <!-- Bootstrap core JavaScript -->
  <script src="./resources/css/jquery.min.js"></script>
  <script src="./resources/css/bootstrap.bundle.min.js"></script>

</body>
</html>