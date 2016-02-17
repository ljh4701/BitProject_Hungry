<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.row {
    text-align: justify;
    min-width: 412px;
    border: 1px solid green;
    width: 80%; /* it changes by screen size actually */
    height: 90px;
    padding: 5px;
}

.row:after {
    content: '';
    display: inline-block;
    width: 100%;
}
.col {
    display: inline-block;
}
.box {
    border: 1px solid #DDD;
    width: 80px;
    height: 80px;
    margin: 0 auto;
}
</style>

</head>
<body>

<script>
</script>

<div class="row">
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
</div>
<div class="row">
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
</div>
<div class="row">
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
    <div class ="col">
        <div class="box"></div>
    </div>
</div>
</body>
</html>