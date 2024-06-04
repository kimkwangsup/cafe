<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Join</title>
<meta charset="UTF-8">
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
      };
    #chkBtn {
        width: 85px;
        height: 40px;
    };
</style>

<script type="text/javascript">
    $(document).ready(function(){
        // 비밀번호 관련 메세지 태그 숨김 처리
        $('#pw').change(function(){
	        var spw = $(this).val();
        	var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*_\-+/])([a-zA-Z0-9!@#$%^*_\+/]{8,15})$/;
	        if(pattern.test(spw)){
	        	$('#pwmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-blue');
				$('#pwmsg').removeClass('w3-hide');
	        	$('#pwmsg').html('사용할 수 있는 비밀번호 입니다.');
	        }else{
	        	$('#pwmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-red');
				$('#pwmsg').removeClass('w3-hide');
	        	$('#pwmsg').html('형식에 맞지 않는 비밀번호 입니다.');
	        	
	        }
        });
       
        
        
        
        $('#mAvt, #fAvt').css('display','none');

        // 이메일 유효성 검사
        // 이메일 아이디는 대소문자와 숫자 그리고 특수문자(*&$#!+%.) 를 사용할 수 있도록 한다.
        $('#mail').change(function(){
            // 이메일 유효성 검사 코드 여기에 작성
        });

        // 전화번호 유효성 검사
        $('#tel').change(function(){
            // 전화번호 유효성 검사 코드 여기에 작성
            var pattern = /^010-([0-9]{4})-([0-9]{4})$/;
           	var stel = $(this).val();
           	if(pattern.test(stel)){
           		$('#tellmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-blue');
				$('#tellmsg').removeClass('w3-hide');
	        	$('#tellmsg').html('전화번호 형식에 맞습니다.');
           	}else{
           		$('#tellmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-red');
				$('#tellmsg').removeClass('w3-hide');
	        	$('#tellmsg').html('전화번호 형식에 맞지않 습니다.');
           	}
            
        });

        // 성별 체크 이벤트
        $(document.frm.gen).change(function(){
            var sgen = $(this).val();

            if(sgen == 'F'){
                // 성별을 여자로 선택한 경우
                $('#mAvt').stop().slideUp(300, function(){
                    $('#fAvt').slideDown(300);
                });
            } else if(sgen == 'M'){
                // 성별을 남자로 선택한 경우
                $('#fAvt').stop().slideUp(300, function(){
                    $('#mAvt').slideDown(300);
                });
            }
        });

        $('#home').click(function(){
            $(location).attr('href', '/cafe/main.cafe');
        });

        // 아이디 체크이벤트
        $('#chkBtn').click(function(){
            var sid = $('#id').val();
            if(!sid){
                // id에 입력된 값이 없는 경우
                // id에 포커스이동
                $('#id').focus();
                return;
            }

            // 정규표현식
            var pattern = /^[a-z][a-z0-9]{5,9}$/;

            // 정규표현식 검사
            if(pattern.test(sid)){
                // 검사에 통과한 경우 서버로 전송해서 결과 받고....
                // 이 부분은 나중에 처리

                $('#idmsg').text('사용가능한 아이디 입니다.');
                $('#idmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-blue');
                $('#idmsg').css('display', 'block');
                $('#idmsg:not(".w3-hide")').addClass('w3-hide');

                $.ajax({
                    url: 'http://localhost/cafe/member/idCheck.cafe',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        id: sid
                    },
                    success: function(obj){
                        obj = obj.result;
                        if(obj == 'YES'){
                            $('#idmsg').html('사용 가능한 아이디 입니다.');
                            $('#idmsg').removeClass('w3-text-red').addClass('w3-text-blue').removeClass('w3-hide');
                        } else {
                            $('#idmsg').html('이미 사용중인 아이디 입니다.');
                            $('#idmsg').removeClass('w3-text-blue').addClass('w3-text-red').removeClass('w3-hide');
                        }
                    },
                    error: function(){
                        alert('서버 통신 에러');
                    }
                });
            } else {
                $('#idmsg').text('사용할 수 없는 아이디 형식입니다.');
                $('#idmsg').removeClass('w3-text-blue').addClass('w3-text-red');
                $('#idmsg').css('display', 'block');
            }
        });

        $('#join').click(function(){
            var sid = document.frm.id.value;
            var spw = document.frm.pw.value;
            var srepw = document.frm.repw.value;

            if(spw != srepw){
                document.frm.repw.value = '';
                document.frm.repw.focus();
                alert('비밀번호가 일치하지 않습니다.');
                return;
            }

            var smail = document.frm.mail.value;
            var stel = document.frm.tel.value;
            var sgen = document.querySelectorAll('[name="gen"]:checked')[0].value;
            var sano = document.querySelectorAll('[name="ano"]:checked')[0].value;

            if(!sid || !spw || !smail || !stel || !sgen || !sano){
                alert('모든 필드를 채워주세요.');
                return;
            }

            $('#frm').submit();
        });
		$('#repw').change(function(){
			var spw = $('#pw').val();
			var respw = $(this).val();
			if(spw != respw){
				$('#repwmsg').html('비밀번호가 일치하지 않습니다.');
				$('#repwmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-red');
				$('#repwmsg').removeClass('w3-hide');
			}else{
				$('#repwmsg').html('비밀번호가 일치합니다.');
				$('#repwmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-blue');
				$('#repwmsg').removeClass('w3-hide');
			}
		});
        $('#reset').click(function(){
            document.frm.reset();
        });
    });
</script>

</head>
<body>
    <div class="w3-content mxw700 w3-center " id="mainFr">
        <h1 class="w3-btn w3-col w3-gray w3-padding w3-card-4 w3-round-large w3-col" id="home">회원가입</h1>
        <form method="get" action="/cafe/member/joinProc.cafe" name="frm" id="frm" 
                class="w3-col w3-light-grey mgt20 w3-card-4 w3-padding pdh30">
            <div class="w3-col w3-padding">
                <label for="name" class="w3-col m3 lbl w3-text-gray w3-right-align">이 름 : </label>
                <input type="text" name="name" id="name" 
                        placeholder="이름을 입력하세요."
                        class="w3-col m8 w3-input w3-border">
            </div>
            <div class="w3-col w3-padding">
                <label for="id" class="w3-col m3 lbl w3-text-gray w3-right-align">아이디 : </label>
                <div class="w3-col m8">
                    <input type="text" name="id" id="id" 
                            placeholder="아이디를 입력하세요."
                            class="w3-col m9 w3-input w3-border">
                    <div class="w3-button w3-dark-gray w3-right" id="chkBtn">check</div>
                    <small class="w3-col s9" id="idmsg"></small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="pw" class="w3-col m3 lbl w3-text-gray w3-right-align">비밀번호 : </label>
                <div class="w3-col m8">
                    <input type="password" name="pw" id="pw" 
                            placeholder="비밀번호를 입력하세요."
                            class="w3-col w3-input w3-border">
                    <small class="w3-col" id="pwmsg"></small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="repw" class="w3-col m3 lbl w3-text-gray w3-right-align">비밀번호확인 : </label>
                <div class="w3-col m8">
                    <input type="password" name="repw" id="repw" 
                            placeholder="비밀번호를 확인해주세요."
                            class="w3-col w3-input w3-border">
                    <small class="w3-col w3-hide" id="repwmsg"></small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="mail" class="w3-col m3 lbl w3-text-gray w3-right-align">이메일 : </label>
                <input type="text" name="mail" id="mail" 
                        placeholder="이메일을 입력하세요."
                        class="w3-col m8 w3-input w3-border">
                <small class="w3-col" id="mailmsg"></small>
            </div>
            <div class="w3-col w3-padding">
                <label for="tel" class="w3-col m3 lbl w3-text-gray w3-right-align">전화번호 : </label>
                <input type="text" name="tel" id="tel" 
                        placeholder="전화번호를 입력하세요."
                        class="w3-col m8 w3-input w3-border">
                <small class="w3-col" id="tellmsg"></small>
            </div>
            <div class="w3-col w3-padding">
                <label class="w3-col m3 lbl w3-text-gray w3-right-align">성 별 : </label>
                <div class="w3-col m8">
                    <div class="w3-half w3-center">
                        <input type="radio" name="gen" id="F" value="F" class="w3-radio rdo" style="position: relative; top: 10px;">
                        <label for="F" class="genlbl w3-text-gray">여 자</label>
                    </div>
                    <div class="w3-half w3-center">
                        <input type="radio" name="gen" id="M" value="M" class="w3-radio rdo">
                        <label for="M" class="genlbl w3-text-gray">남 자</label>
                    </div>
                </div>
            </div>
            <div class="w3-col w3-padding" id="avtfr">
                <label class="w3-col m3 lbl w3-text-gray w3-right-align">아바타 : </label>
                <div class="w3-col m8">
                    <div class="w3-col w3-center" id="mAvt">
                        <div class="inblock avtBox w3-center">
                            <label for="11" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar11.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="11" class="w3-radio avtrdo" value="11">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="12" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar12.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="12" class="w3-radio avtrdo" value="12">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="13" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar13.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="13" class="w3-radio avtrdo" value="13">
                        </div>
                    </div>
                    <div class="w3-col w3-center" id="fAvt">
                        <div class="inblock avtBox w3-center">
                            <label for="21" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar21.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="21" class="w3-radio avtrdo" value="21">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="22" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar22.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="22" class="w3-radio avtrdo" value="22">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="33" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar23.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="23" class="w3-radio avtrdo" value="23">
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="w3-col w3-center w3-padding w3-margin-top">
            <div class="w3-button inblock w3-gray btnW1 w3-card-4 btnPd" id="reset">초기화</div>
            <div class="w3-button inblock w3-blue-gray btnW1 w3-card-4 btnPd" id="join">회원가입</div>
        </div>
    </div>
</body>
</html>