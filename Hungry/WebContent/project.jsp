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
* {
	box-sizing: border-box;
}

body {
	font-family: sans-serif;
}

/* ---- grid ---- */
#grid {
	background: #EEE;
	max-width: 98%;
	margin: 0 auto;
	display: -webkit-flex; /* Safari */
    -webkit-justify-content: space-around; /* Safari 6.1+ */
    display: flex;
    justify-content: space-around;
}

/* ---- grid-item ---- */
.grid-item {
	width: 300px;
	height: 400px;
	float: right;
	display: block;
	margin: 5px;
	background-color: #02B34F;
	border-radius: 10px;
	padding: 10px;
}

/* clearfix */
.grid:after {
  content: '';
  display: block;
  clear: both;
}

.navbar {
	margin-bottom: 0;
	z-index: 9999;
	border: 0;
	font-size: 24px !important;
	padding: 10px;
	margin: 10px;
}

.navbar .progress {
	min-height: 50px;
	margin-bottom: 0;
	position: relative;
	border-radius: 20px 20px 20px 20px;
}

.navbar .progress-bar {
	background-color: #08B452;
}

.navbar .progress span {
	position: absolute;
	display: block;
	width: 100%;
	font-size: 32px;
	font-weight: bold;
	line-height: 50px;
	color: red;
}

.grid-item .progress {
	height: 15px;
	margin-bottom: 3px;
	position: relative;
	border-radius: 0 0 3px 3px;
}

.grid-item .progress-bar {
	background-color: #eecccc;
}

.grid-item .progress span {
	position: absolute;
	display: block;
	width: 100%;
	line-height: 15px;
	color: black;
	font-weight: bold;
}

.grid-item .todotile {
	width: 100%;
	background-color: #25C007;
	border-radius: 5px 5px 5px 5px;
}

.grid-item .todotileTitle {
	background-color: #B31002;
	border-radius: 5px 5px 0 0;
	font-size: 24px;
	padding: 3px;
	color: white;
	text-align: center;
}

.grid-item .todotile .todotilecontent {
	padding: 5px;
	background-color: #25C007;
	height: 320px;
	overflow : auto;
	border-radius: 0 0 5px 5px;
}

.grid-item .todotile .todotilecontent .todotilesubject {
	background-color: #ffffff;
	padding: 10px;
}

.grid-item .todotile .todotilecontent .todotilesubject .todotilesubjectTitle {
	font-size: 22px;
	background-color: #BFFFBF;
	border-radius: 5px 5px 0 0;
	padding: 5px;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail:first-child {
	border-top: 1px solid black;
	border-radius: 5px 5px 0 0;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail:nth-child(2n) {
	background-color: #CCCCCC;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail:last-child {
	background-color: #FFFFFF;
	border-radius: 0 0 5px 5px;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail {
	font-size: 15px;
	padding: 3px;
	border-right: 1px solid black;
	border-left: 1px solid black;
	border-bottom: 1px solid black;
	position: relative;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail:hover > .todotiledetailremove {
	display: block;
}

.grid-item .todotile .todotilecontent .todotilesubject .plus {
	text-align: center;
	font-weight: bold;
	font-size: 12px;
}

.grid-item .todotile .todotilecontent .todotilesubject .plus:hover {
	color: #cccccc;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail input[type=checkbox] {
	position: relative;
	float: left;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail label {
	font-weight: bold;
	cursor: text;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail .todotiledetailremove {
	position: absolute;
	top: 5px;
	right: 5px;
	
	cursor: pointer;
	
	border-radius: 50%;
    behavior: url(PIE.htc); /* remove if you don't care about IE8 */

    width: 20px;
    height: 20px;
    padding: 3px;

    background: #fff;
    border: 2px solid #666;
    color: #666;
    text-align: center;

    font: 9px Arial, sans-serif;
    display:none;
}

.grid-item .todotile .todotilecontent .todotilesubject  .todotiledetail .todotiledetailremove:hover {
	background-color: #cccccc;
}

.grid-item > .plus {
	line-height: 380px;
	text-align: center;
	background-color: #ffffff;
	font-size: 64px;
	cursor: pointer;
}

.grid-item > .plus:hover {
	background-color: #eeeeee;
}

.grid-item .todotile .todotilecontent .plus {
	text-align: center;
	font-size: 20px;
	cursor: pointer;
}

.grid-item .todotile .todotilecontent .plus:hover {
	color: #cccccc;
}

</style>

<script>
	var $grid;

	function createTODOTile() {
		var TODOTileTag = '';
		TODOTileTag += '<div class="grid-item" data-index="';
		TODOTileTag += $('#grid > .grid-item').length - 1;
		TODOTileTag += '">\n';
			TODOTileTag += '<div class="todotile">\n';
				TODOTileTag += '<div class="todotileTitle">\n';
					TODOTileTag += '새로운 TODO 타일 항목\n';
				TODOTileTag += '</div>\n';
				TODOTileTag += '<div class="progress todotileProgress">\n';
					TODOTileTag += '<div class="progress-bar progress-bar-striped active text-center" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">\n';
						TODOTileTag += '<span>작업 진행 상황 : 0%</span>\n';
					TODOTileTag += '</div>\n';
				TODOTileTag += '</div>\n';
				TODOTileTag += '<div class="todotilecontent">\n';
					TODOTileTag += '<div class="todotilesubject plus">\n';
							TODOTileTag += '헤더 추가하기\n';
					TODOTileTag += '</div>\n';
				TODOTileTag += '</div>\n';
			TODOTileTag += '</div>\n';
		TODOTileTag += '</div>\n';
		
		$('#grid > .grid-item:last-child').before(TODOTileTag);
		$('#grid').masonry('reloadItems').masonry('layout');
	}
	
	function createTODOTileSubject(todotileIndex) {
	
	}
	
	function createTODOTileDetail(todotileIndex, todotilesubjectIndex) {
		
	}
	
	function deleteTODOTile(todotileIndex, todotilesubjectIndex, todotiledetailIndex) {
	
	}
	
	function deleteTODOTileSubject(todotileIndex, todotilesubjectIndex) {
	
	}
	
	function deleteTODOTileDetail(todotileIndex) {
	
	}
	
	function masonry() {
		$grid = $('#grid').masonry({
			itemSelector: '.grid-item'
		});
	}
	
	$(function() {
		
		masonry();
		
		$grid.on('click', '.grid-item:last-child', function() {
			createTODOTile();
		});
		
		/*	
		$('#grid > .grid-item:last-child').on('click', function() {
			createTODOTile();
		});
		*/
		
		$('[data-toggle="tooltip"]').tooltip();
		
		createTODOTile();
		createTODOTile();
		createTODOTile();
	}); 
</script>

</head>
<body>

	<div class="navbar navbar-default">
		<div class="progress">
			<div class="progress-bar progress-bar-striped active text-center"
				role="progressbar" aria-valuenow="40" aria-valuemin="0"
				aria-valuemax="100" style="width: 40%">
				<span>작업 진행 상황 : 40%</span>
			</div>
		</div>
	</div>
	
	<hr>
	
	<div id="grid" class="masonry clearfix">
	<!--
		<div class="grid-item" data-index="0">
			<div class="todotile">
				<div class="todotileTitle">
					TODOTile Sample Title
				</div>
				<div class="progress todotileProgress">
					<div class="progress-bar progress-bar-striped active text-center"
						role="progressbar" aria-valuenow="40" aria-valuemin="0"
						aria-valuemax="100" style="width: 40%">
						<span>40%</span>
					</div>
				</div>
				<div class="todotilecontent">
					<div class="todotilesubject" data-index="0">
						<div class="todotilesubjectTitle">
							Subject Title
						</div>
						<div class="progress todotilesubjctProgress">
							<div class="progress-bar progress-bar-striped active text-center"
								role="progressbar" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100" style="width: 40%">
								<span>40%</span>
							</div>
						</div>
						<div class="todotiledetailcontent">
							<div class="todotiledetail" data-index="0">
								<label class="checkbox-inline"><input type="checkbox" name="detailchk" value="">Detail 1</label>
								<span class="todotiledetailremove" data-toggle="tooltip" data-placement="bottom" title="세부항목을 삭제합니다.">X</span>
							</div>
							<div class="todotiledetail" data-index="1">
								<label class="checkbox-inline"><input type="checkbox" name="detailchk" value="">Detail 2</label>
								<span class="todotiledetailremove" data-toggle="tooltip" data-placement="bottom" title="세부항목을 삭제합니다.">X</span>
							</div>
							<div class="todotiledetail" data-index="2">
								<label class="checkbox-inline"><input type="checkbox" name="detailchk" value="">Detail 3</label>
								<span class="todotiledetailremove" data-toggle="tooltip" data-placement="bottom" title="세부항목을 삭제합니다.">X</span>
							</div>
							<div class="todotiledetail plus">
								항목 추가하기
							</div>
						</div>
					</div>
					<div class="todotilesubject plus">
							헤더 추가하기
					</div>
				</div>
			</div>
		</div>
		-->
		<div class="grid-item">
			<div class="todotile plus" data-toggle="tooltip" data-placement="top" title="TODO 타일을 생성합니다.">
				+
			</div>
		</div>
		
	</div>

</body>

</html>