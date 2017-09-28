<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-drawer/1.0.6/css/bootstrap-drawer.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-drawer/1.0.6/js/drawer.js"></script>
        <link href="https://unpkg.com/botframework-webchat/botchat.css" rel="stylesheet" />
    </head>
    <style>
    .wc-chatview-panel {
	    width: 320px;
	    height:700px;
	    position: relative;
	    z-index: 2;
	    font-size: 18px;
	}	
    </style>
	<body class="has-drawer"> <!— add this class to your body for proper sizing —>
    <div id="drawerExample" class="drawer dw-xs-3 dw-sm-3 dw-md-3 fold" aria-labelledby="drawerExample">
        <div class="drawer-controls">
            <a href="#drawerExample" data-toggle="drawer" aria-foldedopen="true" aria-controls="drawerExample" class="btn btn-primary btn-sm">챗봇</a>
        </div>
        <div class="drawer-contents">
            <div class="drawer-heading">
                <h2 align="center" class="drawer-title">카드 추천 챗봇</h2>
            </div>
            <div class="drawer-body">
                <div id="bot"></div>
			   <div style="clear:both;"></div>
				<script src="https://unpkg.com/botframework-webchat/botchat.js"></script>
			    <script>
			        BotChat.App({
			            directLine: {
			                token: "mojUuY88eAc.cwA.6Gk.Uncul7vKodOrA7n7TfgeVu9mWCGiDIQzjxllGeH7PTM"
			            },
			            user: { id: 'hjlee1118' }, //사용자 Session id 넣기
			            bot: { id: 'card_recommend_bot' },
			        }, document.getElementById("bot"));
			    </script>
            </div>
        </div>
    </div>
    <div class="container">
        …비바라니러ㅏㅣㅁㄴ어ㅣㄹㄴㅁ어
    </div>
</body>
</html>