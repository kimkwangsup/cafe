<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe Main</title>
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css">
<script type="text/javascript" src="/cafe/js/jquery-3.7.1.min.js"></script>
<style type="text/css">
	body {
            background-image: url('https://pbs.twimg.com/media/EB1mjJ1UIAYdGQn?format=jpg&name=medium');
            background-size: cover; /* 이미지가 전체 화면을 덮도록 설정 */
            background-position: center;
            background-repeat: no-repeat; /* 이미지가 반복되지 않도록 설정 */
            height: 100vh; /* 뷰포트의 전체 높이를 설정 */
        }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#logout').click(function(){
			$(location).attr('href', '/cafe/member/logoutProc.cafe');
		});
		
		$('#login').click(function(){
			var sid = '${SID}';
			if(!sid || sid == 'null'){
				$(location).attr('href', '/cafe/member/login.cafe');
			} else {
				alert('이미 로그인 했습니다.');
			}
		});
		
		
		$('#join').click(function(){
			// 로그인 여부 검사
			var sid = '${SID}';
			if(!sid || sid == 'null'){
				$(location).attr('href', '/cafe/member/join.cafe');
			//	location.href = '/member/join.jsp';
			} else {
				return;
			}
		});
		
		
		
		
		$('#gboard').click(function(){
			$(location).attr('href', '/cafe/gboard/gboardList.cafe');
		});
		
		$('#gallery').click(function(){
			$(location).attr('href', '/cafe/gallery/galleryList.cafe');
		});
		
		$('#reboard').click(function(){
			$(location).attr('href', '/cafe/reboard/reboard.cafe');	
		});
		
	});
</script>
</head>
<body>
	<form method="POST" id="frm">
	</form>
	
	<div class="w3-content mxw700 w3-center">
		<h1 class="w3-light-gray w3-padding w3-card-4 w3-round-large">
			Cafe 
			메인
			<c:if test="${not empty SID}">
				<small> [ ${SID} ]</small>		
			</c:if>
		</h1>
		<div class="w3-col mgt10">
			<div class="w3-btn w3-small w3-dark-gray w3-left" id="reboard">댓글게시판</div>
			<div class="w3-btn w3-small w3-light-gray w3-left" id="gboard">방명록</div>
			<div class="w3-btn w3-small w3-gray w3-left" id="gallery">갤러리</div>
			<c:if test="${not empty SID}">
				<div class="w3-btn w3-small w3-blue-gray w3-right" id="logout">로그아웃</div>
			</c:if>
			<c:if test="${empty SID}">
				<div class="w3-btn w3-small w3-light-gray w3-right" id="join">회원가입</div>
				<div class="w3-btn w3-small w3-blue-gray w3-right" id="login">로그인</div>
			</c:if>
		</div>
	</div>
</body>
</html>