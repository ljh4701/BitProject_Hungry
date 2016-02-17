<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

<!-- 초기화 -->
<link href="css/normalize.css" rel="stylesheet">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->


<!-- 부트스트랩을 불러오기 전 jQuery 컴파일버전 최신버전 연결 -->
<!-- 최신버전 다운로드 링크 : http://jquery.com/download/ -->
<script src="js/jquery-1.12.0.min.js"></script>

<!-- 부트스트랩 컴파일 버전 연결 -->
<script src="js/bootstrap.min.js"></script>

<!-- CDN 사용시 좋은 점 : 이미 다른 웹페이지를 통해 다운로드를 받아놨으면, 로딩속도가 더욱 빨라진다.
Latest compiled and minified CSS
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

jQuery library
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

Latest compiled JavaScript
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 -->
 
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/assets/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Masonry JS-->
<script src="js/masonry.pkdg.min.js"></script>

<style>
* { box-sizing: border-box; }

body { font-family: sans-serif; }

/* ---- grid ---- */

.grid {
	 text-align: justify;
	 background: #EEE;
	 max-width: 100%;
}

/* clearfix */
.grid:after {
  content: '';
  display: inline-block;
  /* clear: both; */
  width: 100%;
}

/* ---- grid-item ---- */

.grid-item {
  width: 300px;
  height: 320px;
  background-color: #2195c9;
  border-radius: 10px;
/*   padding:20px; */
  margin: 0 auto;
  /* margin-bottom: 30px; */
}

.navbar {
	margin-bottom: 0;
	z-index: 9999;
	border: 0;
	font-size: 24px !important;
	padding: 10px;
}

.progress {
	min-height: 50px;
	margin-bottom: 0;
	position: relative;
	border-radius: 15px 15px 15px 15px;
}

.progress span {
    position: absolute;
    display: block;
    width: 100%;
    text-size: 24px;
    line-height: 50px;
    color: black;
 }
</style>

<script>
 
/* 	$(function() {
		$('.grid').masonry({
			  itemSelector: '.grid-item',
			  columnWidth: 310,
			  percentPosition: true,
			});
	}); */

</script>

</head>
<body>
	
<div class="navbar navbar-default">
	<div class="progress">
	  <div class="progress-bar progress-bar-striped active text-center" role="progressbar"
	  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
	    	<span>40%</span>
	  </div>
	</div>
</div>	

<div class="grid" >
		<span class="grid-item">
			제목
		</span>
		<span class="grid-item"></span>
		<span class="grid-item"></span>
		<span class="grid-item"></span>
		<span class="grid-item"></span>
		<span class="grid-item"></span>
</div>


</body>

</html>