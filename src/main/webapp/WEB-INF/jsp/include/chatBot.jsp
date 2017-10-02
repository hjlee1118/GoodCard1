<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-drawer/1.0.6/css/bootstrap-drawer.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
 --><script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-drawer/1.0.6/js/drawer.js"></script>
<link href="https://unpkg.com/botframework-webchat/botchat.css" rel="stylesheet" />
<script>

$(function(){
	$('#display').click(function(){
		$('#display_off').toggle();
		$('#display_on').toggle();
	});
});


</script>
<style>
.wc-chatview-panel {
	width: 100%;
	height: 750px;
	position: relative;
	z-index: 2;
	font-size: 18px;
}

.wc-chatview-panel{
	background: white;
}

#bot > div > div > div.wc-console > div > input{
	text-align: left;
}
</style>

<input id="memberId" type="hidden" value="${ loginUser.id }">

<div id="drawerExample" class="drawer dw-xs-3 dw-sm-3 dw-md-3 fold"
	aria-labelledby="drawerExample">
	<div class="drawer-controls">
		<a id="display" href="#drawerExample" data-toggle="drawer" aria-foldedopen="true" aria-controls="drawerExample" class="btn btn-primary btn-sm" style="background:black; border: black; padding: 15px; border: 0px; margin-right: 0px;">
            	<i id="display_on" class="fa fa-commenting-o fa-lg" aria-hidden="true" style="margin-right: 0px;" title="Good Card 실시간 채팅"></i>
            	<i id="display_off" class="fa fa-times fa-lg" aria-hidden="true" style="display: none; margin-right: 0px;" title="닫기"></i>
            </a>
	</div>
	<div class="drawer-contents">
		<div class="drawer-heading">
			<div style="height:20px; clear: both;"></div>
			<h3 align="center" class="drawer-title" style="border-bottom: 1px solid #E0E0E0; font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; padding-bottom: 3px;">&nbsp;Good Card&nbsp;</h3>
			<div style="text-align:center; font-size:12pt;font-family: 'Nanum Gothic', serif;">실시간 채팅</div>
			<div style="height:20px; clear: both;"></div>
		</div>
		<div class="drawer-body" style="width: 100%; float: center;">
			<div id="bot" style="width: 100%;"></div>
			<div style="clear: both;"></div>
			<script src="https://unpkg.com/botframework-webchat/botchat.js"></script>
			<script>
				var inputId = $('#memberId').val();
				if(inputId == null || inputId == ''){
				BotChat.App({
			            directLine: {
			                token: "mojUuY88eAc.cwA.6Gk.Uncul7vKodOrA7n7TfgeVu9mWCGiDIQzjxllGeH7PTM"
			            },
			            user: { id: 'GoodCard-nonmember' }, //사용자 Session id 넣기
			            bot: { id: 'card_recommend_bot' },
			        }, document.getElementById("bot"));
				}
				else{
					BotChat.App({
			            directLine: {
			                token: "mojUuY88eAc.cwA.6Gk.Uncul7vKodOrA7n7TfgeVu9mWCGiDIQzjxllGeH7PTM"
			            },
			            user: { id: inputId }, //사용자 Session id 넣기
			            bot: { id: 'card_recommend_bot' },
			        }, document.getElementById("bot"));
				}
			    </script>
		</div>
	</div>
</div>
