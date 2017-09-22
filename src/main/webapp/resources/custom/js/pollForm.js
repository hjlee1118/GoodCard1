function onlyNumber(obj) {
	$(obj).keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
}

function sumValue(className, printAreaId) {

	var lists = $(className).find('input');
	var result = 0;

	for (var i = 0; i < lists.length; i++) {
		if (!isNaN(parseInt($(lists[i]).val()))) {
			result += parseInt($(lists[i]).val());
		}
	}

	$(printAreaId).val(result);

}

function isNumber(value) {
	return typeof value === 'number' && isFinite(value);
}

function getAgeFromBirthDay(birth_day) {

	// 전달받은 생년월일로 Date 객체 생성한다. 이하 생년월일 객체라고 칭한다.
	var birthday = new Date(birth_day);

	// 오늘 날짜 기준으로 나이를 구하기 위해 Date 객체 생성한다. -> 이하 오늘날짜 객체라고 칭한다.
	var today = new Date();

	// 오늘날짜 객체의 연도에서 생년월일 객체의 연도를 뺀다.
	var years = today.getFullYear() - birthday.getFullYear();

	// years 의 값이 실질적으로 구해진 나이이다.

	/*
	 * 계속해서 만 나이 계산을 원하면 아래 처리를 계속해준다.
	 * 연도가 같은 두 객체를 비교하여 생년월일 객체가 오늘 날짜 객체보다 크다면 -1 해준다. 
	 * (생일이 아직 지나지 않았다면 -1 을 한다.)
	 */
	// 생년월일 객체의 연도를 오늘 날짜 객체의 연도로 변경
	birthday.setFullYear(today.getFullYear());

	// 같은 연도가 된 객체를 비교하여 월일이 지났는 지 여부를 판단하여 years 를 뺀다.
	if (today < birthday)
		years--;

	return years;

}

function checkForm() {
	var inputAmount = $('#inputAmount').val();
	var inputAge = $('#input_age').val();
	var inputLoginAge = $('#input_login_age').val();

	if (isNaN(parseInt(inputAmount))) {
		$('#inputAmount').focus();
		return false;
	}

	if (!$('input:radio[name=cardtype]').is(':checked')) {
		$('div_cardtype_radio').css("background", "#E5E5E5");
		return false;
	}

	if (isNaN(parseInt(inputAge)) && isNaN(parseInt(inputLoginAge))) {
		$('#input_age').focus();
		return false;
	}

	return true;
}


$(function() {
	$('#display_detail_communication').hide();
	$('#display_detail_cafeBakery').hide();
	$('#display_detail_restaurant').hide();
	$('#display_detail_fastFood').hide();

	var birth_day = $('#birth_date').val();
	$('#input_login_age').val(getAgeFromBirthDay(birth_day));

	$('#submitPoll').click(function() {
		$('div_cardtype_radio').css("background-color", "");

		// 필수 항목 입력되었는지 확인
		if (!checkForm()) {
			alert('필수 항목을 작성하세요.');
			return false;
		}

		// 입력되지 않은 항목 0으로 셋팅			
		var lists = $('#pollForm').find('input');
		var result = 0;

		for (var i = 2; i < lists.length - 1; i++) {
			if (isNaN(parseInt($(lists[i]).val()))) {
				$(lists[i]).val(0);
			}
		}

	});
	

	/* transportation */
	$('#detail_button_transportation').click(
			function() {
				$('#detail_button_transportation').hide();
				$('#hide_button_transportation').show();
				$('#display_detail_transportation').slideDown("slow");
				$("#inputTransportation").attr("readonly", true).attr(
						"disabled", false);
				$("#inputTransportation").css("background-color", "#E5E5E5");
				$("#inputTransportation").val(0)
			});

	$('#hide_button_transportation').click(
			function() {
				$('#detail_button_transportation').show();
				$('#hide_button_transportation').hide();
				$('#display_detail_transportation').slideUp("fast");
				$("#inputTransportation").attr("disabled", false).attr(
						"readonly", false);
				$("#inputTransportation").css("background-color", "");
			});

	/* communication */
	$('#detail_button_communication').click(
			function() {
				$('#detail_button_communication').hide();
				$('#hide_button_communication').show();
				$('#display_detail_communication').slideDown("slow");
				$("#inputCommunication").attr("readonly", true).attr(
						"disabled", false);
				$("#inputCommunication").css("background-color", "#E5E5E5");
				$("#inputCommunication").val(0);
			});

	$('#hide_button_communication').click(
			function() {
				$('#detail_button_communication').show();
				$('#hide_button_communication').hide();
				$('#display_detail_communication').slideUp("fast");
				$("#inputCommunication").attr("disabled", false).attr(
						"readonly", false);
				$("#inputCommunication").css("background-color", "");
			});

	/* cafeBakery */
	$('#detail_button_cafeBakery').click(function() {
		$('#detail_button_cafeBakery').hide();
		$('#hide_button_cafeBakery').show();
		$('#display_detail_cafeBakery').slideDown("slow");
		$("#inputCafeBakery").attr("readonly", true).attr("disabled", false);
		$("#inputCafeBakery").css("background-color", "#E5E5E5");
		$("#cafeBakery_margin").show();
		$("#inputCafeBakery").val(0);
	});

	$('#hide_button_cafeBakery').click(function() {
		$("#cafeBakery_margin").hide();
		$('#detail_button_cafeBakery').show();
		$('#hide_button_cafeBakery').hide();
		$('#display_detail_cafeBakery').slideUp("fast");
		$("#inputCafeBakery").attr("disabled", false).attr("readonly", false);
		$("#inputCafeBakery").css("background-color", "");
	});

	/* restaurant */
	$('#detail_button_restaurant').click(function() {
		$('#detail_button_restaurant').hide();
		$('#hide_button_restaurant').show();
		$('#display_detail_restaurant').slideDown("slow");
		$("#inputRestaurant").attr("readonly", true).attr("disabled", false);
		$("#inputRestaurant").css("background-color", "#E5E5E5");
		$("#inputRestaurant").val(0);
	});

	$('#hide_button_restaurant').click(function() {
		$('#detail_button_restaurant').show();
		$('#hide_button_restaurant').hide();
		$('#display_detail_restaurant').slideUp("fast");
		$("#inputRestaurant").attr("disabled", false).attr("readonly", false);
		$("#inputRestaurant").css("background-color", "");
	});

	/* fastFood */
	$('#detail_button_fastFood').click(function() {
		$('#detail_button_fastFood').hide();
		$('#hide_button_fastFood').show();
		$('#display_detail_fastFood').slideDown("slow");
		$("#inputFastFood").attr("readonly", true).attr("disabled", false);
		$("#inputFastFood").css("background-color", "#E5E5E5");
		$("#fastFood_margin").show();
		$("#inputFastFood").val(0);
	});

	$('#hide_button_fastFood').click(function() {
		$("#fastFood_margin").hide();
		$('#detail_button_fastFood').show();
		$('#hide_button_fastFood').hide();
		$('#display_detail_fastFood').slideUp("fast");
		$("#inputFastFood").attr("disabled", false).attr("readonly", false);
		$("#inputFastFood").css("background-color", "");
	});

});
