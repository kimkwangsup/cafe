<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>login</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css">
<script type="text/javascript" src="/cafe/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/cafe/js/colorClass.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#home').click(function(){
    		$(location).attr('href', '/cafe/main.cafe');
    	});
    	$('#join').click(function(){
    		$(location).attr('href', '/cafe/member/join.cafe');
    	});
    	$('#login').click(function(){
    		var sid = $('#id').val();
    		if(!sid){
    			$('#id').focus();
    			return;
    		}
    		var spw = $('#pw').val();
    		if(!spw){
    			$('#pw').focus();
    			return;
    		}
    		$('#frm').attr('method', 'get').attr('action', '/cafe/member/loginProc.cafe');
    		$('#frm').submit();
    	});
    });
</script>
<style type="text/css">
	body {
            background-image: url('https://pbs.twimg.com/media/EB1mjJ1UIAYdGQn?format=jpg&name=medium');
            background-size: cover; /* 이미지가 전체 화면을 덮도록 설정 */
            background-position: center;
            background-repeat: no-repeat; /* 이미지가 반복되지 않도록 설정 */
            height: 100vh; /* 뷰포트의 전체 높이를 설정 */
	        }
</style>
</head>
<body>
   	<div class="w3-content mxw700">
       	<h1 class="w3-col w3-btn w3-dark-gray w3-padding w3-round-large w3-card-4" id="home">로그인</h1>
    	<form class="w3-content w3-center w3-margin-top" id="frm" name="frm">
            <div class="w3-col w3-padding w3-card-4">
	            <div class="w3-col w3-padding">
	                <label for="id" class="w3-col m3 w3-right-align w3-text-gray lbl">ID : </label>
	                <input type="text" class="w3-col m7 w3-input w3-border"
	                        name="id" id="id" placeholder="아이디를 입력하세요.">
	            </div>
	            <div class="w3-col w3-padding">
	                <label for="pw" class="w3-col m3 w3-right-align w3-text-gray lbl">PW : </label>
	                <input type="password" class="w3-col m7 w3-input w3-border"
	                    name="pw" id="pw" placeholder="비밀번호를 입력하세요.">
	            </div>
			</div>
        <div class="w3-col w3-margin-top w3-card-4 w3-round-large frHidden">
            <div class="w3-half w3-btn w3-light-gray" id="join">회원가입</div>
            <div class="w3-half w3-btn w3-blue-gray" id="login">로그인</div>
        </div>
    </form>
	</div>
<script type="text/javascript">
</script>
</body>
</html>