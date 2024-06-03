<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css">
<link rel="stylesheet" href="/cafe/css/font-awesome-4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/cafe/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="/cafe/js/colorClass.js"></script>
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
		$('#home').click(function(){
			$(location).attr('href', '/cafe/main.cafe');
		});
		$('#login').click(function(){
			$(location).attr('href', '/cafe/member/login.cafe');
		});
		$('#logout').click(function(){
			$(location).attr('href', '/cafe/member/logoutProc.cafe');
		});
		$('#join').click(function(){
			$(location).attr('href', '/cafe/member/join.cafe');
		});
		$('#reWrite').click(function(){
			$(location).attr('href', '/cafe/reboard/reboardWrite.cafe');
		});
		
	});
</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-col w3-dark-gray w3-padding w3-card-4 w3-center w3-round-large w3-btn" id="home">댓글 게시판</h1>
		<div class="w3-col">
			<c:if test="${not empty SID}">
				<div class="w3-small w3-btn w3-gray w3-left" id="logout">로그아웃</div>	
				<div class="w3-small w3-btn w3-blue-gray w3-left" id="reWrite">댓글쓰기</div>	
			</c:if>
			<c:if test="${empty SID}">
				<div class="w3-small w3-btn w3-light-gray w3-right" id="login">로그인</div>
				<div class="w3-small w3-btn w3-blue-gray w3-right" id="join">회원가입</div>
			</c:if>
		</div>
		<!-- 게시글 태그 -->
		<div class="w3-col w3-margin-top">
			<c:forEach var="DATA" items="${LIST}">
				<div class="w3-col w3-margin-top"  style="padding-left: ${(DATA.level - 1) * 50}px;">
					<div class="w3-col w3-card-4">
						<div class="w3-col" style="width: 100px;">
							<div class="w3-col imgBox2 pd10">
								<img src="/cafe/avatar/img_avatar22.png" class="w3-col w3-circle img80">
							</div>
							<h6 class="w3-col w3-center mgh0">${DATA.id}</h6>
						</div>
						<div class="w3-rest pd10">
							<div class="w3-col w3-border-bottom" style="padding-bottom: 3px;">
								<p class="w3-left mgh0" style="font-size: 9pt;">작성일 : ${DATA.sdate}</p>
								<p class="w3-right mgh0" style="font-size: 9pt;"><i class="fa fa-heart"></i> 좋아요 : ${DATA.goods}</p>
							</div>
							<div class="w3-col w3-padding">
								<pre class="contentBox" style="margin: 0px;">${DATA.body}</pre>
							</div>
							<div class="w3-col">
								<div class="w3-btn w3-tiny w3-orange w3-left" id="d${DATA.bno}">글삭제</div>
								<div class="w3-btn w3-tiny w3-pink w3-right" id="r${DATA.bno}">댓글쓰기</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>





