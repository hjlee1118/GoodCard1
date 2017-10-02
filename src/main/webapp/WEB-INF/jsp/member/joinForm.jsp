<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Good Card -회원 가입</title>

<!-- Bootstrap core CSS -->
<c:set var="context" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css?ver=7">
<link
	href="${context}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/main.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/topMenu.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/cleardiv.css?ver=7"
	rel="stylesheet">
<link
	href="${context}/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css?ver=7"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${context}/resources/bootstrap/css/clean-blog.min.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/pollForm.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/joinForm.css?ver=7"
	rel="stylesheet">

<!-- Script File -->
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script>
<script src="${context}/resources/custom/js/joinForm2.js"></script>
<script type="text/javascript">


function checkForm() {

	var lists = $('#joinForm').find('input');

	for (var i = 2; i < 10; i++) {
		if ($(lists[i]).val() == "") {
			alert(i);
			$(lists[i]).focus();
			return false;
		}
	}

	var currentId = $('#inputId').val();
	
	alert(idChecked(currentId));
	alert(passwordForm());
	alert(passwordCheckForm());
	alert(isValidEmailAddress());
	
	if (idChecked(currentId) && passwordForm() && passwordCheckForm()
			&& isValidEmailAddress()) {

		if (!$('input:radio[name=type]').is(':checked')) {
			alert('회원 유형을 선택해 주세요.');
			return false;
		}

		if (!$('input:radio[name=gender]').is(':checked')) {
			alert('성별을 선택해 주세요.');
			return false;
		}
		return true;
	} else {
		return false;
	}

}

function onlyNumber(obj) {
	$(obj).keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
}

function idChecked(currentId) {
	
	var idRegex = /^[a-zA-z0-9]{5,15}$/gi;
	var checkNumber = currentId.search(/[0-9]/g);
	var checkEnglish = currentId.search(/[a-z]/ig);
	
	if (!idRegex.test(currentId) || checkNumber < 0 || checkEnglish < 0) {
		$('#idMessage_form').show();
		return false;
	}
	
	var id = {
			'id' : currentId
	};
	
	$.ajax({
		type : "POST",
		url : "${context}/member/checkId.do",
		data : id,
		dataType : 'json',
		success : function(checkId) {
			if(checkId == 1){
				$('#idMessage_duple_x').show();
				return false;
			}
			else{
				$('#idMessage_duple_o').show();
				return true;	
			}
		},
		error : function(xhr, status, error) {
			alert('오류가 발생하였습니다. 관리자에게 문의하세요.');
		}
	});
	return true;	
}
function passwordForm() {
	var password = $('#inputPassword').val();
	var passwordCheck = $('#inputPasswordChk').val();
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;

	if (!passwordRegex.test(password)) {
		$('#passwordFormMsg').show();
		return false;
	} else {
		$('#passwordFormMsg').hide();
		return true;
	}
}

function passwordCheckForm() {
	var password = $('#inputPassword').val();
	var passwordCheck = $('#inputPasswordChk').val();
	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;

	if (!passwordRegex.test(password)) {
		$('#passwordFormMsg').show();
		return false;
	} else {
		$('#passwordFormMsg').hide();
		if (password != passwordCheck) {
			$('#passwordCheckUncorrectMsg').show();
			$('#passwordCheckCorrectMsg').hide();
			return false;
		} else {
			$('#passwordCheckUncorrectMsg').hide();
			$('#passwordCheckCorrectMsg').show();
			return true;
		}
	}
}

function isValidEmailAddress() {
	var emailAddress = $('#inputEmail').val();
	var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
	return pattern.test(emailAddress);
};

function setInputCardType(){
	var cardType = $('#inputCardType option:selected').val();
	$('#modal_submit').hide();
	
	if(cardType){
		$('#inputSearchType').show();
		$('#searchInput1').hide();
		$('#inputCreditCardBrand').hide();
		$('#inputCheckCardBrand').hide();
		$('#inputSearchType').find('option:first').attr('selected', 'selected');
		$('#inputCreditCardBrand').find('option:first').attr('selected', 'selected');
		$('#inputCheckCardBrand').find('option:first').attr('selected', 'selected');
	}else{
		$('#inputSearchType').find('option:first').attr('selected', 'selected');
		$('#inputCreditCardBrand').find('option:first').attr('selected', 'selected');
		$('#inputCheckCardBrand').find('option:first').attr('selected', 'selected');
		$('#inputSearchType').hide();
		$('#searchInput1').hide();
		$('#inputCreditCardBrand').hide();
		$('#inputCheckCardBrand').hide();
	}
	
};

function setInputSearchType(){
	
	var cardType = $('#inputCardType option:selected').val();
	var searchType = $('#inputSearchType option:selected').val();
	$('#modal_submit').show();
	
	if(searchType == 'cardName'){
		$('#searchInput1').show();
		$('#inputCheckCardBrand').hide();
		$('#inputCreditCardBrand').hide();
		$('#inputCreditCardBrand').find('option:first').attr('selected', 'selected');
		$('#inputCheckCardBrand').find('option:first').attr('selected', 'selected');
	}
	else{
		$('#searchInput1').hide();
		
		if(cardType == 'checkCard'){
			$('#inputCheckCardBrand').show();
			$('#inputCreditCardBrand').find('option:first').attr('selected', 'selected');
			$('#inputCheckCardBrand').find('option:first').attr('selected', 'selected');
			$('#inputCreditCardBrand').hide();
		}else{
			$('#inputCreditCardBrand').show();
			$('#inputCreditCardBrand').find('option:first').attr('selected', 'selected');
			$('#inputCheckCardBrand').find('option:first').attr('selected', 'selected');
			$('#inputCheckCardBrand').hide();
		}
	
	}
};
	

$(function() {
	$('#idMessage_form').hide();
	$('#idMessage_duple_o').hide();
	$('#idMessage_duple_x').hide();
	$('#passwordFormMsg').hide;
	$('#passwordCheckCorrectMsg').hide();
	$('#passwordCheckUncorrectMsg').hide();

	$('#inputId').focusout(function() {
		var currentId = $(this).val();
		$('#idMessage_duple_o').hide();
		$('#idMessage_form').hide();
		$('#idMessage_duple_x').hide();
		idChecked(currentId);
		/*if (idChecked(currentId)) {
			$('#idMessage_form').hide();
			 var v = $.get("${context}/member/checkId.do?currentId="+encodeURIComponent(currentId), showDupId);
			console.log(v); 
		}*/
	});

	$('#inputPassword').focusout(function() {
		passwordForm();
	});

	$('#inputPasswordChk').focusout(function() {
		passwordCheckForm();
	});

	$('#inputEmail').focusout(function() {
		if (isValidEmailAddress() == false) {
			$('#emailFormMsg_x').show();
			$('#emailFormMsg_o').hide();
		} else {
			$('#emailFormMsg_x').hide();
			$('#emailFormMsg_o').show();
		}
	});

	$('inputBirthDate').focusout(function() {
		var birthDate = $('#inputBirthDate').val();
		if (birthDate.length != 8) {
			alert('생년월일을 양식에 맞게 입력해주세요. ex. 19900101')
		}
	});

	$('#joinButton').click(function() {

		if (!checkForm()) {
			alert('항목을 양식에 맞게 모두 입력해주세요.');
			return false;
		}

	});
	
	$('#modal_submit').on('click', function(){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/mycard/search.do',
			type : 'POST',
			success: function(result){
				console.log(result);				
			},
			error : function(xhr, ajaxOptions, thrownError) {
				console.log('Error : ' + xhr.status + '\n' +
				'Message : ' + xhr.statusText + '\n' +
				'Response : ' + xhr.responseText + '\n' + thrownError);
			}


		});
		
	});
	
})

</script>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />


	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container" style="font-size: 11pt">
		<a href="${context}" style="margin:0"><i class="fa fa-home" aria-hidden="true"></i></a>
		<a href="${context}">홈</a><i class="fa fa-chevron-right" aria-hidden="true"></i><a>회원정보</a><i class="fa fa-chevron-right" aria-hidden="true"></i><a href="${context}/member/join.do">회원가입</a>
	</div>
	<hr style="margin-bottom: 0px; margin-top: 5px; clear: both;">



	<div class="poll-main">

		<section class="section-wrapper"
			style="padding-top: 100px; padding-bottom: 100px;">
			<div class="container">
				<div id="poll_title" class="row"
					style="margin: 0px; text-align: center;">
					<b>회원가입</b>
				</div>
				<div style="color: gray;">
					GoodCard에 오신 것을 환영합니다.<br> 
					회원이 되시면 회원 유형에 특화된 서비스를 이용하실 수 있습니다. <br>
				</div>
				<div style="height: 30px; clear: both;"></div>
				<div style="height: 30px; clear: both;"></div>
				
					<form id="joinForm" method="post"
							action="${context}/member/join.do">

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
							class="custom-join-input-value" placeholder="영문, 숫자 혼합, 5~15자">
						<span id="idMessage_duple_x"
							style="display: none; text-align: left; color: red;"
							class="custom-input-group">
							<span
							class="custom-input-group-addon custom-input-category"></span> ※
							중복된 아이디입니다.
						</span>
						<span id="idMessage_duple_o"
							style="display: none; text-align: left; color: green;"
							class="custom-input-group">
							<span
							class="custom-input-group-addon custom-input-category"></span> ※
							사용이 가능한 아이디입니다.
						</span>
						<span id="idMessage_form"
							style="display: none; text-align: left; color: red;"
							class="custom-input-group"> <span
							class="custom-input-group-addon custom-input-category"></span> ※
							영문, 숫자, 5~15자
						</span>
					</div>
					
					<div style="height: 20px;  clear: both;"></div>
					
					<div style="width: 100%">
						<span class="custom-input-join-group-addon "> 비밀번호 </span>
						<input
							type="password" id="inputPassword" name="password"
							class="custom-join-input-value" placeholder="영문, 숫자, 특수문자 혼합, 6~15자">
						<span id="passwordFormMsg"
						style="display: none; text-align: left; color:red;"
						class="custom-input-group">
							<span class="custom-input-group-addon custom-input-category"></span>
							※ 영문, 숫자, 특수문자 혼합, 6~15자
					</span>
					</div>					
					
					<div style="height: 20px; clear: both;"></div>

					<div style="width: 100%">
						<span class="custom-input-join-group-addon "> 비밀번호 확인 </span>
						<input type="password" id="inputPasswordChk" name="passwordChk"
							class="custom-join-input-value" placeholder="비밀번호 재입력"> 
						<span id="passwordCheckUncorrectMsg"
						style="display: none; color: red; text-align: left;"
						class="custom-input-group">
						<span class="custom-input-group-addon custom-input-category"></span>
						<span>※ 비밀번호가 다릅니다.</span>
					</span>
					<span id="passwordCheckCorrectMsg"
						style="display: none; color: green; text-align: left;" class="custom-input-group">
						<span class="custom-input-group-addon custom-input-category"></span>
						<span>※ 비밀번호가 일치합니다.</span>
					</span>
					</div>

					<div style="height: 20px; clear: both;"></div>

					<div style="width: 100%">
						<span class="custom-input-join-group-addon">이메일</span> <input
							type="text" id="inputEmail" name="email"
							class="custom-join-input-value"
							placeholder="이메일(example@goodcard.com)" /> <span
							id="emailFormMsg_x"
							style="display: none; text-align: left; color: red;"
							class="custom-input-group"> <span
							class="custom-input-group-addon custom-input-category"></span> ※
							올바르지 않은 형식입니다.
						</span> <span id="emailFormMsg_o"
							style="display: none; text-align: left; color: green;"
							class="custom-input-group"> <span
							class="custom-input-group-addon custom-input-category"></span> ※
							올바른 형식의 이메일입니다.
						</span>
					</div>

					<div style="height: 20px; clear: both;"></div>
					
					<div style="width: 100%">
						<span class="custom-input-join-group-addon">이름</span>
						<input type="text" id="inputName" name="name"
							class="custom-join-input-value" placeholder="이름" />
					</div>
					
					<div style="height: 20px;  clear: both;"></div>
					
					<div style="width: 100%">
						<span class="custom-input-join-group-addon">전화번호</span>
						<select id="txtMobile1" name="phone1" style="width: 9%">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					<span style="margin: 5px;">-</span>
					<input type="text" id="inputPhone2" name="phone2" class="custom-join-input-value-3"/>
					<span style="margin: 5px;">-</span>
					<input type="text" id="inputPhone3" name="phone3" class="custom-join-input-value-3"/>				
				</div>
				
				
				<div style="height: 20px;  clear: both;"></div>
				
				<!-- 생년월일 (숫자만 입력가능) -->
				<div style="width: 100%">
					<span class="custom-input-join-group-addon">생년월일</span>
					<input type="text" id="inputBirthDate" name="inputBirthDate" class="custom-join-input-value"
						placeholder="예시) 19900101" 	onkeydown="onlyNumber(this)"/>
				</div>


				<div style="height: 20px;  clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon">성별</span>
					<span class="wrap">
						<input name="gender" type="radio" id="s_radio0" class="radio" value="M">
						<label for="s_radio0" class="radio-label">
							<i class="fa fa-check"></i>
							<span>
								남자
							</span>
					</label>
					<input name="gender" type="radio" id="s_radio1" class="radio" value="W">
						<label for="s_radio1" class="radio-label">
							<i class="fa fa-check"></i>
						<span>여자</span>
					</label>
					</span>
				</div>
				
				<div style="height: 80px; clear:both;"></div>
				
				<div style="width: 100%">
						<span class="custom-input-join-group-addon"></span>
						<input id="joinButton" type="submit" class="join_button" value="회원가입 완료하기">
				</div>
				
				</form>
								
				<div style="height: 50px; clear:both;"></div>

			</div>
		</section>
	</div>

	<jsp:include page="/WEB-INF/jsp/include/chatBot.jsp" />
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