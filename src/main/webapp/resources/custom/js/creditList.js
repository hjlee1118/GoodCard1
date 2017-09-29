function goCardHomepage(url) {
		location.replace(url);
	};

	function goPage(obj) {
		location.replace('${context}/credit.do?pageNo='
				+ obj.getAttribute('id'));
	};

	function goDetailPage(cardNo, cardId) {

		var id = {
			'id' : cardId
		};

		$.ajax({
			type : "POST",
			url : "${context}/credit/updateViewCnt.do",
			data : id,
			dataType : 'json',
			success : function(id) {
			},
			error : function(xhr, status, error) {
			}
		});

	};

	function modalMyCard(obj, cardNo) {
		if (!('${loginUser}')) {
			if (confirm('로그인하시면 이용 가능합니다. 로그인 하시겠습니까?') != 0) {
				location.replace('${context}/member/login.do');
			}
			return;
		}

		var status = $('#modal_mycard_' + cardNo).attr('title');
		alert(status);

		if (status == 'I') {
			var id = {
				'id' : obj
			};

			$.ajax({
				type : "POST",
				url : "${context}/insertMyCard.do",
				data : id,
				dataType : 'json',
				success : function(id, cardNo) {
					alert('My Card 목록에 추가하였습니다.');
				},
				complete : function(id, cardNo) {
				},
				error : function(xhr, status, error) {
					alert('My Card 목록에 추가하던 도중 오류가 발생했습니다. 관리자에게 문의하세요.');
				}
			});

			$('#modal_mycard_' + cardNo).attr('class', 'fa fa-minus fa-2x');
			$('#modal_mycard_' + cardNo).attr('title', 'D');
			$('#mycard' + cardNo).attr('class', 'fa fa-minus');
			$('#mycard_detail_' + cardNo).attr('title', 'D');

		} else {
			var id = {
				'id' : obj
			};

			$.ajax({
				type : "POST",
				url : "${context}/deleteMyCard.do",
				data : id,
				dataType : 'json',
				success : function(id, cardNo) {
					alert('My Card 목록에서 삭제 되었습니다.');
				},
				complete : function(id, cardNo) {
				},
				error : function(xhr, status, error) {
					alert('My Card 목록에서 삭제하던 중 오류가 발생했습니다. 관리자에게 문의하세요.');
				}
			});

			$('#modal_mycard_' + cardNo).attr('class', 'fa fa-plus fa-2x');
			$('#modal_mycard_' + cardNo).attr('title', 'I');
			$('#mycard' + cardNo).attr('class', 'fa fa-plus');
			$('#mycard_detail_' + cardNo).attr('title', 'I');

		}
	};

	$(function() {

		/* $('#menu20').attr('class', 'box-active');
		$('#menu20').attr('title', 'a');

		for (var i = 0; i < 20; i++) {
			$('#menu' + i).attr('class', 'content');
			$('#menu' + i).attr('title', 'i');
		}
		; */

		$('.card-info-area').show();
		$('.benefit-info-area').hide();

		$('.click-card-info-area').click(function() {
			$('.card-info-area').show();
			$('.benefit-info-area').hide();
			$('.click-benefit-info-area').css("color", "#7b7b7b");
			$('.click-card-info-area').css("color", "#0085a1");
		});

		$('.click-benefit-info-area').click(function() {
			$('.benefit-info-area').show();
			$('.card-info-area').hide();
			$('.click-card-info-area').css("color", "#7b7b7b");
			$('.click-benefit-info-area').css("color", "#0085a1");
		});

		$('.card-detail-button').click(function() {
			$('.card-info-area').show();
			$('.benefit-info-area').hide();
			$('.click-benefit-info-area').css("color", "#7b7b7b");
			$('.click-card-info-area').css("color", "#0085a1");
		});

		$('#search_option_area_open').click(function() {
			$('#search_option_area').toggle();
		})
	});

	function myCard(obj, cardNo) {

		if (!('${loginUser}')) {
			if (confirm('로그인하시면 이용 가능합니다. 로그인 하시겠습니까?') != 0) {
				location.replace('${context}/member/login.do');
			}
			return;
		}

		var status = $('#mycard_detail_' + cardNo).attr('title');
		alert(status);

		if (status == 'I') {
			var id = {
				'id' : obj
			};

			$.ajax({
				type : "POST",
				url : "${context}/insertMyCard.do",
				data : id,
				dataType : 'json',
				success : function(id, cardNo) {
					alert('My Card 목록에 추가하였습니다.');
				},
				complete : function(id, cardNo) {
				},
				error : function(xhr, status, error) {
					alert('My Card 목록에 추가하던 도중 오류가 발생했습니다. 관리자에게 문의하세요.');
				}
			});

			$('#mycard' + cardNo).attr('class', 'fa fa-minus');
			$('#mycard_detail_' + cardNo).attr('title', 'D');

		} else {
			var id = {
				'id' : obj
			};

			$.ajax({
				type : "POST",
				url : "${context}/deleteMyCard.do",
				data : id,
				dataType : 'json',
				success : function(id, cardNo) {
					alert('My Card 목록에서 삭제 되었습니다.');
				},
				complete : function(id, cardNo) {
				},
				error : function(xhr, status, error) {
					alert('My Card 목록에서 삭제하던 중 오류가 발생했습니다. 관리자에게 문의하세요.');
				}
			});

			$('#mycard' + cardNo).attr('class', 'fa fa-plus');
			$('#mycard_detail_' + cardNo).attr('title', 'I');

		}
	};

	function selectCardMenu() {
		var status = $('#select_brand_menu_button').attr('title');
		if (status == 'h') {
			$('#select_brand_menu').show();
			$('#select_brand_menu_icon').attr('class', 'fa fa-angle-up');
			$('#select_brand_menu_button').attr('title', 's');
		} else {
			$('#select_brand_menu').hide();
			$('#select_brand_menu_icon').attr('class', 'fa fa-angle-down');
			$('#select_brand_menu_button').attr('title', 'h');
		}
	};

	function selectCategoryMenu() {
		var status = $('#select_category_menu_button').attr('title');
		if (status == 'h') {
			$('#select_category_menu').show();
			$('#select_category_menu_icon').attr('class', 'fa fa-angle-up');
			$('#select_category_menu_button').attr('title', 's');
		} else {
			$('#select_category_menu').hide();
			$('#select_category_menu_icon').attr('class', 'fa fa-angle-down');
			$('#select_category_menu_button').attr('title', 'h');
		}
	}

	function menuActive(obj) {
		var id = obj.id;

		var array = new Array();

		if ($('#' + id).attr('title') == 'a') {
			$('#' + id).attr('class', 'content');
			$('#' + id).attr('title', 'i');

		} else {
			if (id != 'menu20') {
				$('#' + id).attr('class', 'box-active');
				$('#' + id).attr('title', 'a');
				$('#menu20').attr('class', 'content');
				$('#menu20').attr('title', 'i');
			} else {
				$('#menu20').attr('class', 'box-active');
				$('#menu20').attr('title', 'a');

				for (var i = 0; i < 20; i++) {
					$('#menu' + i).attr('class', 'content');
					$('#menu' + i).attr('title', 'i');
				}
				;
			}

		}
	}

	function searchCardBrand() {

		var creditDataList = new Array();

		for (var i = 0; i <= 20; i++) {
			var id = '#menu' + i;
			creditDataList.push($(id).attr('title'));
		}
		;

		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			type : 'post',
			url : "${context}/selectCheckCardBrand.do",
			data : JSON.stringify(creditDataList),
			dataType : 'json',
			contentType : 'application/json',
			success : function() {
				location.replace('${context}/credit.do?pageNo=1');
			},
			error : function(xhr, status, error) {
			}
		});
	}

	function searchCategory() {

		var count = 0;
		var creditCategoryList = new Array();

		for (var i = 0; i <= 37; i++) {
			var id = '#menu' + i;
			creditCategoryList.push($(id).attr('title'));
			if ($(id).attr('title') == 'a') {
				count++
			}
		}
		;

		if (count == 0) {
			alert('조건을 선택해주세요.');
			$('#menu20').attr('class', 'box-active');
			$('#menu20').attr('title', 'a');
			return;
		}

		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			type : 'post',
			url : '${context}/searchCreditQueryBrand.do',
			data : JSON.stringify(creditCategoryList),
			dataType : 'json',
			contentType : 'application/json',
			success : function() {
				location.replace('${context}/credit.do?pageNo=1');
			},
			error : function(xhr, status, error) {

			}
		})

	}