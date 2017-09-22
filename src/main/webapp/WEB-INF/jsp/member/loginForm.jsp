<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<c:set var="context" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${context}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css?ver=2"
	rel="stylesheet">
<link href="${context}/resources/custom/css/main.css?ver=2"
	rel="stylesheet">
<link href="${context}/resources/custom/css/topMenu.css?ver=2"
	rel="stylesheet">
<link href="${context}/resources/custom/css/cleardiv.css?ver=2"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="${context}/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css?ver=2"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${context}/resources/bootstrap/css/clean-blog.min.css?ver=2"
	rel="stylesheet">
<link href="${context}/resources/bootstrap/css/main.css?ver=2"
	rel="stylesheet">
<link href="${context}/resources/custom/css/pollForm.css?ver=2"
	rel="stylesheet">

<!-- Script File -->
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script><%-- 
<script src="${context}/resources/custom/js/poll.js"></script> --%>
<script type="text/javascript">

function go_join_form() {
	location.replace("${context}/member/join.do");
}


	function checkForm() {

		var lists = $('#joinForm').find('input');
		
		for (var i = 2; i < 10; i++) {
			if ($(lists[i]).val() == "") {
				$(lists[i]).focus();
				return false;
			}
		}

		var currentId = $('#inputId').val();

		if (idCheck(currentId) && passwordForm() && passwordCheckForm()
				&& isValidEmailAddress()) {

			if (!$('input:radio[name=type]').is(':checked')) {
				alert('회원 유형을 선택해 주세요.')
				return false;
			}
			return true;
		
		} else {
			return false;
		}

	}

	$(function() {
		$('#loginButton').click(function() {

			if (!checkForm()) {
				return false;
			}

		});
		
	})
</script>
<style type="text/css">
#loginButton {
	border: 1px solid black;
	color: #FFF;
	background: black;
	padding: 10px;
	font-family: 'Noto Sans KR', serif;
	text-align: center;
	width: 14%;
	margin-right: 1%;
}

#joinButton {
	border: 1px solid #333;
	color: black;
	background: white;
	padding: 10px;
	font-family: 'Noto Sans KR', serif;
	text-align: center;
	width: 14%;
	margin-left: 1%;
}

.check-id-button{
	border : 1px solid #333;
	color : black;
	background : white;
	padding : 3px;
	font-family: 'Noto Sans KR', serif;
	text-align: center;
}

.custom-join-input-value{
	width: 30%;
	border : 0;
	border-bottom: 1px solid #333;
	text-align: left;
}

.custom-join-input-value-3{
	width: 8.5%;
	border : 0;
	border-bottom: 1px solid #333;
	text-align: left;
}

/* 인풋 */
input[type=radio] {display:none;}
.radio-label {
  display:inline-block;
  width:14%;
  height:30px;
  padding:0 20px;
  border:1px solid rgba(0,0,0,0.08);
  margin-right:20px;
  line-height:30px;
  cursor:pointer;
  -webkit-transition: all 0.3s ease-out;
  -moz-transition: all 0.3s ease-out;
  -ms-transition: all 0.3s ease-out;
  -o-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
  text-align: center;
}

.radio-label i {
  margin-right:10px;
  opacity: 0;
  -webkit-transition: opacity 0.3s ease-out;
  -moz-transition: opacity 0.3s ease-out;
  -ms-transition: opacity 0.3s ease-out;
  -o-transition: opacity 0.3s ease-out;
  transition: opacity 0.3s ease-out;
}

.radio:checked + .radio-label {background:rgba(4, 120, 193,0.1);
}

.radio:checked + .radio-label i { opacity: 1;}

.radio + .radio-label span {
    display:inline-block;
    font-size:15px;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -ms-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
  -webkit-transform:translateX(-13px);
  -moz-transform:translateX(-13px);
  -ms-transform:translateX(-13px);
  -o-transform:translateX(-13px);
  transform:translateX(-13px);
}

.radio:checked + .radio-label span {
  -webkit-transform:translateX(0);
  -moz-transform:translateX(0);
  -ms-transform:translateX(0);
  -o-transform:translateX(0);
  transform:translateX(0);
}

select {
    width: 200px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #333;
    border: 1px solid #E0E0E0;
    border-radius: 3px;
}

#search #search-input, #search .hint {
    padding-left: 43px;
    padding-right: 43px;
    border-radius: 23px;
}

.input-lg {
    height: 46px;
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 6px;
}

.form-control {
    display: inline-block;
    width: 25%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
    -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
site.css:5
input, button, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}

.custom-input-join-group-addon {
    padding: 6px 12px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: left;
    width: 200px;
    white-space: nowrap;
    vertical-align: middle;
    display: inline-table;
}

div#subMenu > a{
	margin: 5px;
}

div#subMENU{
	font-family: 'Noto Sans KR', serif;
	font-size: 10pt;
}

.login-main{
	width:100%;
}

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />


	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container">
		<a href="${context}" style="margin:0"><i class="fa fa-home" aria-hidden="true"></i></a>
		<a href="${context}">홈</a>><a>회원정보</a>><a href="${context}/member/login.do">로그인</a>
	</div>
	<hr style="margin-bottom: 0px; margin-top: 5px; clear: both;">



	<div class="login-main">

		<section class="section-wrapper"
			style="padding-top: 100px; padding-bottom: 100px;">
			<div class="container">
				<div id="poll_title" class="row"
					style="margin: 0px; text-align: center;">
					<b>로그인</b>
				</div>
				<div style="color: gray;">
					기존 GoodCard 앱 계정으로 이용하실 수 있습니다.<br> 
					최상의 카드 추천 서비스를 제공해드립니다.Good Card <br>
				</div>
				<div style="height: 30px; clear: both;"></div>
				<div style="height: 30px; clear: both;"></div>
				
					<form id="joinForm" method="post"
							action="${context}/member/login.do">

					<div style="width:100%">
						<span class="custom-input-join-group-addon">회원 유형
						</span>&nbsp; 
						<span class="wrap">
						<input name="type" type="radio" id="radio0" class="radio" value="U">
						<label for="radio0" class="radio-label">
							<i class="fa fa-check"></i>
							<span>개인</span>
						</label>
						<input name="type" type="radio" id="radio1" class="radio" value="O">
						<label for="radio1" class="radio-label">
							<i class="fa fa-check"></i>
							<span>사업자</span>
						</label>
						</span>
					</div>
					<div style="height: 20px; clear: both;"></div>
				
					<div style="width: 100%">
						<span class="custom-input-join-group-addon "> 아이디 </span>
						<input type="text" id="inputId" name="id"
							class="custom-join-input-value">
					</div>
					
					<div style="height: 20px;  clear: both;"></div>
					
					<div style="width: 100%">
						<span class="custom-input-join-group-addon "> 비밀번호 </span>
						<input
							type="password" id="inputPassword" name="password"
							class="custom-join-input-value">
					</div>					
					
					<div style="height: 20px; clear: both;"></div>
									
				<div style="width: 100%">
						<span class="custom-input-join-group-addon "> </span>
						<input id="loginButton" type="submit" class="path_button" value="로그인">
						<input id="joinButton" type="button" class="path_button" onclick="go_join_form()" value="회원가입">
				</div>
				
				</form>
								
				<div style="height: 50px; clear:both;"></div>

			</div>
		</section>
	</div>
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script
		src="${context}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${context}/resources/bootstrap/vendor/popper/popper.min.js"></script>
	<script
		src="${context}/resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${context}/resources/bootstrap/js/clean-blog.min.js"></script>


</body>
</html>