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
			var path = '/cafe/reboard/reboardWrite.cafe';
			$('#frm').attr('action', path);
			$('#frm').submit();
		});
		$('.pageBtn').click(function(){
			var spno = $(this).attr('id');
			$('#nowPage').val(spno);
			$('#frm').attr('action', '/cafe/reboard/reboard.cafe');
			$('#frm').submit();
		});
		$('.delete').click(function(){
			var sbno = $(this).attr('id').substring(1);
			$('#frm').append('<input type="hidden" name="bno" value="'+ sbno +'">');
			$('#frm').attr('action', '/cafe/reboard/delReboard.cafe?nowPage=' + $('#nowPage').val());
			$('#frm').submit();
			
		});
		$('.append').click(function(){
			var sbno = $(this).attr('id').substring(1);
			$('#frm').append('<input type="hidden" name="bno" value="'+ sbno +'">');
			$('#frm').attr('action', '/cafe/reboard/reboardRewrite.cafe');
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<form method="POST" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="id" value="${SID}">
	</form>
	<div class="w3-content mxw700">
		<h1 class="w3-col w3-dark-gray w3-padding w3-card-4 w3-center w3-round-large w3-btn" id="home">
			댓글 게시판
			<c:if test="${not empty SID}">
				<small> [ ${SID} ]</small>		
			</c:if>
		</h1>
		<div class="w3-col">
			<c:if test="${not empty SID}">
				<div class="w3-small w3-btn w3-gray w3-right" id="logout">로그아웃</div>	
				<div class="w3-small w3-btn w3-blue-gray w3-left" id="reWrite">댓글쓰기</div>	
			</c:if>
			<c:if test="${empty SID}">
				<div class="w3-small w3-btn w3-light-gray w3-right" id="login">로그인</div>
				<div class="w3-small w3-btn w3-blue-gray w3-right" id="join">회원가입</div>
			</c:if>
		</div>
		<!-- 게시글 태그 -->
		<c:if test="${not empty LIST }">
			<div class="w3-col">
				<c:forEach var="DATA" items="${LIST}">
					<div class="w3-col w3-margin-top"  style="padding-left: ${(DATA.level - 1) * 50}px;">
						<div class="w3-col w3-card-4 w3-light-gray">
							<div class="w3-col" style="width: 100px;">
								<div class="w3-col imgBox2 pd5">
									<img src="/cafe/avatar/${DATA.savename }" class="w3-col img80" style="border-radius: 50%; width: 100%; height: auto;">
								</div>
								<h6 class="w3-col w3-center mgh0">${DATA.id}</h6>
							</div>
							<div class="w3-rest pd10">
								<div class="w3-col w3-border-bottom" style="padding-bottom: 3px;">
									<p class="w3-left mgh0" style="font-size: 9pt;">작성일 : ${DATA.sdate}</p>
									<p class="w3-right mgh0" style="font-size: 9pt;"><i class="w3-text-red fa fa-heart"></i> 좋아요 : ${DATA.goods}</p>
								</div>
								<div class="w3-col w3-padding">
									<pre class="contentBox" style="margin: 0px;">${DATA.body}</pre>
								</div>
								<div class="w3-col">
									<c:if test="${SID eq DATA.id}">
										<div class="w3-btn w3-tiny w3-blue-gray w3-left delete" id="d${DATA.bno}">글삭제</div>
									</c:if>
									<c:if test="${not empty SID and DATA.level lt 3}">
										<div class="w3-btn w3-tiny w3-dark-gray w3-right append" id="r${DATA.bno}">댓글쓰기</div>
									</c:if>
									<div class="w3-hide" id = '${DATA.regroup}'></div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="w3-col w3-center w3-margin-top">
				<div class="w3-bar w3-round w3-border-dark-gray">
					<c:if test="${PAGE.startPage eq 1}">
						<span class="w3-bar-item w3-light-gray" id="${PAGE.startPage - 1}" >&laquo;</span>
					</c:if>
					<c:if test="${PAGE.startPage ne 1}">
						<span class="w3-bar-item w3-button w3-light-gray w3-hover-blue-gray pageBtn" id="${PAGE.startPage - 1}" >&laquo;</span>
					</c:if>
					<c:forEach var="pno" begin="${PAGE.startPage}" end="${PAGE.endPage}">
						<c:if test="${PAGE.nowPage eq pno}">
									<span class="w3-bar-item w3-dark-gray" id="${pno}">${pno}</span>
						</c:if>
						<c:if test="${PAGE.nowPage ne pno}">
							<span class="w3-bar-item w3-button pageBtn w3-hover-blue-gray" id="${pno}">${pno}</span>
						</c:if>
					</c:forEach>
					<c:if test="${PAGE.endPage ne PAGE.totalPage}">
						<span class="w3-bar-item w3-button w3-light-gray w3-hover-blue-gray pageBtn" id="${PAGE.endPage + 1}">&raquo;</span>
					</c:if>
					<c:if test="${PAGE.endPage eq PAGE.totalPage}">
						<span class="w3-bar-item w3-light-gray">&raquo;</span>
					</c:if>
				</div>
			</div>
		</c:if>
		<c:if test="${empty LIST }">
			<div class="w3-col w3-margin-top">
				<h2 class="w3-center w3-text-gray w3-border-bottom">▶ 아직 작성된 글이 없습니다. ◀</h2>
			</div>
		</c:if>
	</div>
</body>
</html>





