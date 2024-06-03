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
	p {
		margin: 0px!important
	};
	hr {
		margin:	3px!important 
	};
	#wmodal{
		display: none;
	};
	#msg{
		display: block;
	};
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
		
		// reset 버튼 클릭이벤트
		$('#reset').click(function(){
			$('#body').val('');
		});
		$('#list').click(function(){
			$('#frm').submit();
		});
		$('#write').click(function(){
			var sbody = $('#body').val();
			if(!sbody){
				$('#body').focus();
				return;
			}
			
			var el = document.createElement('input');
			$(el).attr('type', 'hidden');
			$(el).attr('name', 'body');
			$(el).val(sbody);
			$('#frm').append(el);
			$('#frm').attr('action', '/cafe/reboard/reboardWriteProc.cafe');
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-col w3-dark-gray w3-center w3-padding w3-card-4 w3-round-large w3-btn" id="home">댓글 게시글 작성</h1>
		<div class="w3-col">
			<c:if test="${empty SID }"><!-- 로그인 안한 경우 -->
				<div class="w3-light-gray w3-btn w3-right w3-small" id="login">로그인</div>
				<div class="w3-dark-gray w3-btn w3-right w3-small" id="join">회원가입</div>
			</c:if>
			<c:if test="${not empty SID }"><!-- 로그인한경우 -->
				<div class="w3-blue-gray w3-btn w3-right w3-small" id="logout">로그아웃</div>
			</c:if>
		</div>
		<form method="post" action="/cafe/reboard/reboard.cafe" id="frm" class="w3-col w3-margin-top">
			<input type="hidden" name="nowPage" id="nowPage" value="${DATA.nowPage}">
			<c:if test="${DATA.regroup ne 0 }">
				<input type="hidden" name="upno" value="${DATA.upno}">
				<input type="hidden" name="regroup" value="${DATA.regroup}">
			</c:if>
			<div class="w3-container w3-padding w3-margin-bottom w3-card-4" style="padding: 15px 20px!important;">
				<div class="w3-col">
					<label class="w3-col m2 lbl w3-right-align">작성자 :</label>
					<input type="text" name="id" value="${SID}" class="w3-col m9 w3-input" readonly>
				</div>
				<div class="w3-col">
					<label for="body" class="w3-col m2 lbl w3-right-align">내  용 : </label>
				</div>
				<div class="w3-col">
					<div class="w3-col m2"><p> &nbsp;</p></div>
					<div class="w3-col m9">
						<textarea name="body" id="body" class="w3-input w3-border w3-col" rows="5" style="resize: none;" placeholder="인사글을 작성하세요!"></textarea>
					</div>
				</div>
			</div>
			<footer class="w3-col w3-margin-top">
				<div class="w3-third w3-light-gray w3-btn" id="reset">초기화</div>
				<div class="w3-third w3-gray w3-btn" id="list">목록</div>
				<div class="w3-third w3-blue-gray w3-btn" id="write">작성</div>
			</footer>
		</form>
	</div>
</body>
</html>