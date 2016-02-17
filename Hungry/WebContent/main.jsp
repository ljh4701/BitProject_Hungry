<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="kr.co.hungry.TODOTileVO.DetailVO"%>
<%@page import="kr.co.hungry.TODOTileDAO.DetailDAO"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
	<link rel="stylesheet" href="css/custom.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<header class="header">
  <h2>Project Number</h2>
  <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
	</div>
  </div>
</header>
	<section>
		<div class="add">
			<img src="img/plus.png" width="50px"/>	
		</div>
	</section>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
        
   <!-- 데이터 베이스 detail테이블의 각 항목을 리스트 객체로 받아서 화면에 출력  -->
    <%
    	DetailDAO dDao = new DetailDAO();
    	DetailVO dVO = new DetailVO();
    	
    	List<DetailVO> detailList = dDao.getTabDetailList();
    %>
    
    <div class='todo'>
    	<div class='delete'>
    		<img src='img/close.png'>
    	</div>
    	<h4 id='todotilename'>Todo tile name</h4>
		<div class='progress_sub'>
			<div class='progress-bar progress-bar-striped active' role='progressbar'
				aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:40%'>
			</div>
		</div>
		<div class='subject'>
			<h5 id='sub_title'>subject name</h5>
    		<div class='progress_sub'>
    			<div class='progress-bar progress-bar-striped active' role='progressbar'
    				 aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:40%'>
    			</div>
    		</div>
	    	<div class='detail'>
	    		<% for(int i=0;i< detailList.size();i++ ){ 
	    			DetailVO detail = detailList.get(i);
	    		%>
	    		<div id='detail'><%=detail.getDetailContent() %>
	    			<input type="text" name='detailNo' value='<%=detail.getDetailNo() %>'>
	    		</div><%
		    		} %>
				<div class='innerPlus'>
					<img src='img/plus.png' width='10px'/>
				</div>
			</div>
		</div>
		<div class='addsub'>
			<img src='img/plus.png' width='30px'/>
		</div>
	</div>

    <!-- Menu Toggle Script -->
    <script>
	prev_text="";
	new_detail="<div id='detail'>detail</div>";
	new_progressbar="<div class='progress_sub'><div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:40%'></div></div>";
	new_subject="<div class='subject'><h5 id='sub_title'>subject name</h5>"+new_progressbar+"<div class='detail'>"+new_detail+"<div class='innerPlus'><img src='img/plus.png' width='10px'/></div></div></div><div class='addsub'><img src='img/plus.png' width='30px'/></div>";
	var detailCount = 0;
	
	//외부 + 버튼 클릭시 todotile{subject > detail} 생성
	$(".add").click(function() {
		$("section").prepend("<div class='todo'><div class='delete'><img src='img/close.png'></div><h4 id='todotilename'>Todo tile name</h4>"+new_progressbar+new_subject+ "</div>");
	});
	
	//내부 + 버튼 클릭시 subject {detail}  생성
	$(document).on("click",".innerPlus", function(){
		$(this).parent().children(':nth-last-child(1)').before(new_detail);
		return false;
	});
	
	//TO DO TILE NAME 클릭시 INPUT 타입의 박스로 전환
	$(document).on("click focus","#todotilename", function(){
		prev_text= $(this).text();
		//INPUT 박스로 변환과 동시에 TEXT 전체 선택
		$(this).replaceWith("<input id='todotitle' type='text' value='"+$( this ).text()+"'/>");
		$("#todotitle").select();
		$("#todotitle").mouseup(function() {
			// Prevent further mouseup intervention
			$("#todotitle").unbind("mouseup");
			return false;
		});
		//ESC 에 반응 및 변환전값 반환
		$( "#todotitle" ).keydown(function(e){
			if(e.which == 27){
				$(this).replaceWith("<h4 id='todotilename'>"+prev_text+"</h4>");
				return false;
			}
			//(ENTER)키를 제외한 값은 통과!	
			else if (e.which != 13){
				return;
			}
			//(ENTER)키 눌렸을 때 반응
			else{
				$(this).replaceWith("<h4 id='todotilename'>"+$( this ).val()+"</h4>");
				//DB UPDATE
			}
		});
		//FOCUSOUT
		$( "#todotitle" ).focusout(function(e){
			$(this).replaceWith("<h4 id='todotilename'>"+$( this ).val()+"</h4>");
		});
	});
	
	// subject 클릭시 INPUT 타입의 박스로 전환 
	$(document).on("click focus","#sub_title", function(){
		prev_text= $(this).text();
		//INPUT 박스로 변환과 동시에 TEXT 전체 선택
		$(this).replaceWith("<input id='subtitle' type='text' value='"+$( this ).text()+"'/>");
		$("#subtitle").select();
		$("#subtitle").mouseup(function() {
			// Prevent further mouseup intervention
			$("#subtitle").unbind("mouseup");
			return false;
		});
		//ESC 에 반응 및 변환전값 반환
		$( "#subtitle" ).keydown(function(e){
			if(e.which == 27){
				$(this).replaceWith("<h5 id='sub_title'>"+prev_text+"</h5>");
				return false;
			}
			//(ENTER)키를 제외한 값은 통과!	
			else if (e.which != 13){
				return;
			}
			//(ENTER)키 눌렸을 때 반응
			else{
				$(this).replaceWith("<h5 id='sub_title'>"+$( this ).val()+"</h5>");
				//DB UPDATE
			}
		});
		//FOCUSOUT
		$( "#subtitle" ).focusout(function(e){
			$(this).replaceWith("<h5 id='sub_title'>"+$( this ).val()+"</h5>");
		});
	});
	
	//detail 클릭시 INPUT 타입의 박스로 전환	
	$(document).on("click focus","#detail", function(){
		prev_text= $(this).text();
		//INPUT 박스로 변환과 동시에 TEXT 전체 선택
		$(this).replaceWith("<input id='deditible' type='text' value='"+$( this ).text()+"'/>");
		$("#deditible").select();
		$("#deditible").mouseup(function() {
			// Prevent further mouseup intervention
			$("#deditible").unbind("mouseup");
			return false;
		});
		
		//ESC 에 반응 및 변환전값 반환
		$( "#deditible" ).keydown(function(e){
			if(e.which == 27){
				$(this).replaceWith("<div id='detail'>"+prev_text+"</div>");
				return false;
			}
			//(ENTER)키를 제외한 값은 통과!	
			else if (e.which != 13){
				return;
			}
			//(ENTER)키 눌렸을 때 반응
			else{
				$(this).replaceWith("<div id='detail'>"+$( this ).val()+"</div>");
				//DB UPDATE
			}
		});
		//FOCUSOUT
		$( "#deditible" ).focusout(function(e){
			$(this).replaceWith("<div id='detail'>"+$( this ).val()+"</div>");
		});
	});
		
	// 새로운 subject를 Add
	$(document).on("click",".addsub", function(){
		$(this).replaceWith(new_subject);
		return false;
	});
	
/* 	// mouseover시 지울 수 있는 x버튼 표시
	$('.add').hover(function() {
		$(".delete",$(this)).stop(true).fadeIn();		
	}),
	function() {
		$(".delete",$(this)).stop(true).fadeOut();		
	}
	
	 $('.add').hover(function(){
	        $(this).children('.delete').show();
	    }, function(){
	        $(this).children('.delete').hide();
	    });
	 */
    </script>

</body>

</html>
