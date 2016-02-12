<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!--
	부트스트랩3은 모바일을 우선적으로 고려한다.
	width=device-width : 기기의 너비에 맞추어 페이지의 너비를 조절한다. 
	initial-scale : 브라우저의 의해 로딩되었을 때 초기 줌 레벨을 설정한다.
	maximum-scale = 최대 줌 레벨이 1로 설정한다. 
	user-scalable = 사용자의 줌을 막는다.
-->
<!-- 위  3개의  메타(meta)태그들은 반드시 처음에 와야한다. -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="">
<title>Hungry</title>

<!-- 컴파일 버전을 쓰는 이유 : 용량이 줄어든다. -->
<!-- 부트스트랩 컴파일 버전 연결 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="css/assets/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	$(document).ready(function() {
		$.ajax ({
			url: './api/getTODOTileList.jsp',
			type: 'post',
			data: { 'projectNo' : <%=request.getParameter("projectNo")%> },
			dataType: 'json',
			success:function(data) {
				$('#timezones').html(JSON.stringify(data));
			}
		});
	});
</script>

</head>
<body>
	<p id="timezones"></p>
</body>
</html>