function goCardHomepage(url) {
		location.replace(url);
	};

	function goPage(obj) {
		location.replace('${context}/credit.do?pageNo='
				+ obj.getAttribute('id'));
	};

	function goDetailPage(cardNo) {
		var status = $('#mycard_detail_' + cardNo).attr('title');
		
		if(status == 'I'){
			$('#modal_mycard_'+cardNo).attr('title','I');
			$('#modal_mycard_'+cardNo).attr('class', 'fa fa-plus fa-2x');
		}
		else{
			$('#modal_mycard_'+cardNo).attr('title','D');
			$('#modal_mycard_'+cardNo).attr('class', 'fa fa-minus fa-2x');
		}
	};
	
	function modalMyCard(obj, cardNo){
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