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

		if (!$('input:radio[name=gender]').is(':checked')) {
			alert('성별을 선택해 주세요.')
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

function idCheck(currentId) {
	var idRegex = /^[a-zA-z0-9]{5,15}$/gi;
	var checkNumber = currentId.search(/[0-9]/g);
	var checkEnglish = currentId.search(/[a-z]/ig);
	if (!idRegex.test(currentId) || checkNumber < 0 || checkEnglish < 0) {
		$('#idMessage_form').show();
		return false;
	}
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
		if (idCheck(currentId)) {
			$('#idMessage_form').hide();
			/* var v = $.get("${context}/member/checkId.do?currentId="+encodeURIComponent(currentId), showDupId);
			console.log(v); */
		}
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