<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Good Card - 체크카드</title>

<!-- Bootstrap core CSS -->
<c:set var="context" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css?family=Source+Code+Pro"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="${context}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css?ver=5"
	rel="stylesheet">
<link href="${context}/resources/custom/css/main.css?ver=5"
	rel="stylesheet">
<link href="${context}/resources/custom/css/topMenu.css?ver=5"
	rel="stylesheet">
<link href="${context}/resources/custom/css/cleardiv.css?ver=5"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="${context}/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css?ver=5"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${context}/resources/bootstrap/css/clean-blog.min.css?ver=5"
	rel="stylesheet">
<link href="${context}/resources/bootstrap/css/main.css?ver=5"
	rel="stylesheet">
<link href="${context}/resources/custom/css/pollForm.css?ver=5"
	rel="stylesheet">
<link href="${context}/resources/custom/css/creditList.css?ver=5"
	rel="stylesheet">


<!-- Script File -->
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function goCardHomepage(url) {
		location.replace(url);
	};

	function goPage(obj) {
		location
				.replace('${context}/check.do?pageNo=' + obj.getAttribute('id'));
	};

	function goDetailPage(cardNo, cardId) {

		var id = {
			'id' : cardId
		};

		$.ajax({
			type : "POST",
			url : "${context}/check/updateViewCnt.do",
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
			if (id != 'menu28') {
				$('#' + id).attr('class', 'box-active');
				$('#' + id).attr('title', 'a');
				$('#menu28').attr('class', 'content');
				$('#menu28').attr('title', 'i');
			} else {
				$('#menu28').attr('class', 'box-active');
				$('#menu28').attr('title', 'a');

				for (var i = 0; i < 28; i++) {
					$('#menu' + i).attr('class', 'content');
					$('#menu' + i).attr('title', 'i');
				}
				;
			}

		}
	}

	function searchCardBrand() {

		var checkDataList = new Array();

		for (var i = 0; i <= 28; i++) {
			var id = '#menu' + i;
			checkDataList.push($(id).attr('title'));
		}
		;

		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			type : 'post',
			url : "${context}/selectCheckCardBrand.do",
			data : JSON.stringify(checkDataList),
			dataType : 'json',
			contentType : 'application/json',
			success : function() {
				location.replace('${context}/check.do?pageNo=1');
			},
			error : function(xhr, status, error) {
			}
		});
	}

	function searchCategory() {

		var count = 0;
		var checkCategoryList = new Array();

		for (var i = 0; i <= 45; i++) {
			var id = '#menu' + i;
			checkCategoryList.push($(id).attr('title'));
			if ($(id).attr('title') == 'a') {
				count++
			}
		}
		;

		if (count == 0) {
			alert('조건을 선택해주세요.');
			$('#menu28').attr('class', 'box-active');
			$('#menu28').attr('title', 'a');
			return;
		}

		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			type : 'post',
			url : '${context}/searchQueryBrand.do',
			data : JSON.stringify(checkCategoryList),
			dataType : 'json',
			contentType : 'application/json',
			success : function() {
				location.replace('${context}/check.do?pageNo=1');
			},
			error : function(xhr, status, error) {

			}
		})

	}
</script>
<style type="text/css">
.click-benefit-info-area:hover {
	font-weight: bold;
}

.click-card-info-area:hover {
	font-weight: bold;
}

#show_modal {
	cursor: pointer;
}

#show_modal:hover {
	color: #0085a1;
}

.white_content {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.8);
	opacity: 0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
}

.white_content:target {
	opacity: 1;
	pointer-events: auto;
}

.white_content>div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 60%;
	padding: 16px;
	background-color: white;
	overflow: auto;
}

.card-image-area {
	width: 15%;
	height: 30%;
	float: left;
	display: inline-block;
	margin-top: 2%;
}

.card-summarized-info {
	padding-top: 2%;
	float: left;
	display: inline-block;
}

.info-padding {
	margin-bottom: 0.5%;
	text-align: left;
}

.card-detail-subtitle {
	font-size: 13pt;
}

.card-detail-subcontent {
	font-size: 12pt;
}

.box {
	position: relative;
	width: 10%;
	text-align: center;
	display: inline-block;
}

.box:before {
	content: "";
	padding-top: 100%;
	display: inline-block;
}

.content {
	padding-top: 40%;
	padding-bottom: 40%;
	position: absolute;
	display: inline-block;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid #E0E0E0;
	cursor: pointer;
}

.content:hover {
	background: #E0E0E0;
	color: #fff;
}

.box-active {
	background: #0085a1;
	color: #fff;
	padding-top: 40%;
	padding-bottom: 40%;
	position: absolute;
	display: inline-block;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	border: 1px solid #E0E0E0;
	cursor: pointer;
}

#searchCardBrand {
	float: center;
	background: black;
	color: white;
	padding-top: 1%;
	padding-bottom: 1%;
	cursor: pointer;
}

#searchCategory {
	float: center;
	background: black;
	color: white;
	padding-top: 1%;
	padding-bottom: 1%;
	cursor: pointer;
}

#search_option_area_open {
	width: 100%;
	padding: 1% 0px;
	background: white;
	border: 1px solid #0085a1;
	color: #0085a1;
	cursor: pointer;
	text-align: center;
}

#search_option_area_open:hover {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />

	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container" style="font-size: 11pt">
		<a href="${context}" style="margin: 0"><i class="fa fa-home"
			aria-hidden="true"></i></a> <a href="${context}">홈</a><i
			class="fa fa-chevron-right" aria-hidden="true"></i><a>카드</a><i
			class="fa fa-chevron-right" aria-hidden="true"></i><a
			href="${context}/check.do?pageNo=1">체크카드</a>
	</div>
	<hr style="margin-bottom: 0px; margin-top: 5px; clear: both;">

	<div class="poll-main">

		<section class="section-wrapper" style="width:100%; padding:70px 0px;">

		<div class="container" style="width: 100%;">

			<div id="poll_title" class="row"
				style="margin: 0px; text-align: center;">
				<b>체크카드</b>
			</div>

			<div style="color: gray;">
				회원님께 딱 맞는 체크카드 정보를 제공해드립니다.<br>
			</div>

			<div style="height: 50px; clear: both;"></div>

			<div id="search_option_area_open">
				<i class="fa fa-cog" aria-hidden="true" style="padding-right: 0.5%;"></i>
				검색 조건 선택
			</div>

			<div id="search_option_area" style="padding: 0px 5px; display: none;">

				<div style="height: 15px; clear: both;"></div>

				<div id="select_brand_menu_button"
					style="width: 100%; text-align: left; font-weight: bold; padding-top: 1%; padding-bottom: 1%; cursor: pointer"
					onclick="selectCardMenu()" title="h">
					<i class="fa fa-credit-card" aria-hidden="true"
						style="padding-right: 2px;"></i> 카드사 선택 <i
						id="select_brand_menu_icon" class="fa fa-angle-down"
						aria-hidden="true"></i>
				</div>

				<div style="height: 15px; clear: both;"></div>

				<div id="select_brand_menu"
					style="width: 100%; text-align: center; display: none;">

					<div style="height: 30px; clear: both;"></div>

					<div class="box">
						<c:choose>
							<c:when test="${ checkDataList[28] eq 'i' }">
								<div class="content" title="i" id="menu28"
									onclick="menuActive(this)">전체</div>
							</c:when>
							<c:otherwise>
								<div class="box-active" id="menu28" title="a"
									onclick="menuActive(this)">전체</div>
							</c:otherwise>
						</c:choose>
					</div>

					<c:set var="checkCardNameNo" value="0"></c:set>

					<c:forEach items="${checkCardNameList}" var="checkCardNameList"
						varStatus="status" begin="0" end="27" step="1">
						<div class="box">
							<c:choose>
								<c:when test="${ checkDataList[checkCardNameNo] eq 'a' }">
									<div class="box-active" title="a" id="menu${checkCardNameNo}"
										onclick="menuActive(this)">${checkCardNameList}</div>
								</c:when>
								<c:otherwise>
									<div class="content" title="i" id="menu${checkCardNameNo}"
										onclick="menuActive(this)">${checkCardNameList}</div>

								</c:otherwise>
							</c:choose>
						</div>
						<c:set var="checkCardNameNo" value="${checkCardNameNo+1 }"></c:set>
					</c:forEach>

					<div style="height: 30px; clear: both;"></div>

				</div>

				<div id="select_category_menu_button"
					style="width: 100%; text-align: left; padding-top: 1%; padding-bottom: 1%; cursor: pointer; font-weight: bold;"
					onclick="selectCategoryMenu()" title="h">

					<i class="fa fa-check" aria-hidden="true"
						style="padding-right: 2px;"></i> 혜택 선택 <i
						id="select_category_menu_icon" class="fa fa-angle-down"
						aria-hidden="true"></i>
				</div>

				<div style="height: 25px; clear: both;"></div>

				<div id="select_category_menu"
					style="width: 100%; text-align: center; display: none;">
					<c:set var="categoryNo" value="0" />
					<c:set var="menuNo" value="29" />
					<c:forEach items="${selectCheckCategoryList}" var="selectList"
						varStatus="status">
						<div class="box">
							<c:choose>
								<c:when test="${ checkCategoryList[categoryNo] eq 'a'}">
									<div class="box-active" id="menu${menuNo}"
										onclick="menuActive(this)" title="a">${selectList}</div>
								</c:when>
								<c:otherwise>
									<div class="content" id="menu${menuNo}"
										onclick="menuActive(this)" title="i">${selectList}</div>
								</c:otherwise>
							</c:choose>
						</div>
						<c:set var="categoryNo" value="${ categoryNo + 1 }" />
						<c:set var="menuNo" value="${menuNo + 1}"></c:set>
					</c:forEach>

					<div style="height: 30px; clear: both;"></div>
				</div>

				<div style="width: 100%; text-align: center;">
					<div id="searchCategory" onclick="searchCategory()">검색하기</div>
				</div>
				<div
					style="width: 100%; margin-right: 5%; margin-left: 5%; color: red; float: right; text-align: right; padding-top: 1%;">
					* 검색하기 버튼을 누르시면 조건에 맞는 카드가 조회됩니다.</div>
			</div>

			<div style="height: 30px; clear: both;"></div>
			<div style="width: 100%">
				총 <b style="color: #0085a1;">${checkTotalCnt }</b> 건 검색
			</div>
			<div style="height: 5px; clear: both;"></div>
			<hr>

			<div style="width: 100%;">
				<ul style="padding: 0">
					<li class="custom-sort-design first"><i class="fa fa-check"
						aria-hidden="true"></i>굿카드 랭킹순</li>
					<li class="custom-sort-design first"><i class="fa fa-check"
						aria-hidden="true"></i>등록일 순</li>
					<li class="custom-sort-design last"><i class="fa fa-check"
						aria-hidden="true"></i>리뷰 많은순</li>
				</ul>
			</div>

			<div style="clear: both;"></div>
			<hr>

			<c:set var="pageNo" value="${param.pageNo}" />
			<c:choose>
				<c:when test="${ pageNo eq 1 }">
					<c:set var="cardNo" value="0" scope="page" />
				</c:when>
				<c:otherwise>

					<c:set var="cardNo" value="${param.pageNo * 10 - 10 }" scope="page" />
				</c:otherwise>
			</c:choose>

			<c:forEach items="${checkCardList}" var="list" varStatus="status">

				<div style="height: 30px; clear: both;"></div>

				<div style="width: 100%;">

					<c:set var="cardNo" value="${ cardNo + 1 }" scope="page"></c:set>

					<div style="height: 100%; float: left; padding: 5%;">
						<b
							style="font-size: 20pt; color: #0085a1; font-family: 'Nanum Gothic', serif;">${cardNo}</b>
					</div>

					<div class="card-image-area"
						style="height: 126.6px; background: url('${context}/resources/cardImage/${list.imagePath}'); background-size: contain;	background-repeat: no-repeat;">
						<%-- img src="${context}/resources/cardImage/${list.imagePath}" style="width: 300px; height: 126.6px;"> --%>
					</div>

					<div
						style="display: inline-block; height: 100%; padding-top: 2.4%; float: left; width: 50%;">
						${list.brand}
						<div
							style="color: black; padding: 10px 0px; font-size: 15pt; display: inherit;">
							<b>${list.cardName}</b>
						</div>

						<c:choose>
							<c:when test="${ list.annotation eq '' }">
								<div style="color: #7b7b7b; display: inherit;">상세 보기를
									클릭하세요</div>
							</c:when>
							<c:otherwise>
								<div style="color: #0085a1; display: inherit;">"
									${list.annotation} "</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div style="display: inline-block; float: right; height: 100%;">
						<span style="text-align: center;" class="card-detail-button"
							onclick="goDetailPage('${cardNo}', '${list.id}')"> <a
							href="#open${ cardNo }" class="card-detail-button"
							style="color: #0085a1;">상세 보기</a>
						</span> <span class="card-homepage-button"
							onclick="goCardHomepage('${list.homepageURL}')"
							style="text-align: center;"> 카드 신청 </span>

						<c:choose>
							<c:when
								test="${ loginUser.card1 eq list.id || loginUser.card2 eq list.id || loginUser.card3 eq list.id}">
								<span id="mycard_detail_${cardNo}" class="card-detail-button"
									title="D" style="color: #0085a1; text-align: center;"
									onclick="myCard('${ list.id }', '${ cardNo }')"> <%--  onclick="deleteMyCard('${ list.id }', '${ cardNo }');" --%>
									<i id="mycard${ cardNo }" class="fa fa-minus"
									aria-hidden="true"></i> &nbsp;mycard
								</span>
							</c:when>
							<c:otherwise>
								<span id="mycard_detail_${cardNo}" class="card-detail-button"
									title="I" style="color: #0085a1; text-align: center;"
									onclick="myCard('${ list.id }', '${ cardNo }')"> <%--  onclick="insertMyCard('${ list.id }', '${ cardNo }');" --%>
									<i id="mycard${ cardNo }" class="fa fa-plus" aria-hidden="true"></i>
									&nbsp;My Card
								</span>
							</c:otherwise>
						</c:choose>

					</div>

				</div>
				<div style="height: 30px; clear: both;"></div>
				<hr>

				<div class="white_content" id="open${ cardNo }">
					<div
						style="padding-left: 3%; padding-right: 3%; font-family: 'Nanum Gothic', serif;">
						<div>
							<a href="#close"
								style="color: gray; float: right; font-size: 20pt;">x</a>
						</div>
						<div style="clear: both;"></div>
						<div class="card-image-area"
							style="background: url('${context}/resources/cardImage/${list.imagePath}'); background-repeat: no-repeat; background-size: contain;"></div>
						<div class="card-summarized-info">
							<div class="info-padding">${list.brand}</div>
							<div class="info-padding"
								style="font-size: 15pt; font-weight: bold;">
								${list.cardName}</div>
							<div
								style="color: #0085a1; margin-top: 1%; text-align: left; width: 500px;">
								" ${list.annotation} "</div>
						</div>
						<div class="card-summarized-button"
							style="float: right; text-align: center; padding-top: 3.5%">
							<div style="float: left;">
								<i class="fa fa-home fa-2x" aria-hidden="true"
									style="background: #0085a1; padding: 1px; color: white; cursor: pointer;"
									onclick="goCardHomepage('${list.homepageURL}')"></i>
							</div>
							<div style="height: 20px; clear: both;"></div>
							<div style="float: left;">
								<i id="modal_mycard_${cardNo}" class="fa fa-minus fa-2x"
									aria-hidden="true"
									style="background: white; padding: 1px; color: #0085a1; cursor: pointer;"
									title="I"
									; onclick="modalMyCard('${ list.id }', '${ cardNo }')"></i>
							</div>
						</div>
						<div style="height: 15px; clear: both;"></div>
						<div class="card-detail-menu-area">
							<div class="click-card-info-area"
								style="color: #0085a1; font-size: 12pt; font-style: bold; display: inline-block; margin-right: 60px; cursor: pointer;">
								<b>카드 정보</b>
							</div>
							<div class="click-benefit-info-area"
								style="color: #7b7b7b; font-size: 12pt; font-style: bold; display: inline-block; cursor: pointer;">
								<b>혜택 정보</b>
							</div>
						</div>
						<div style="height: 10px; clear: both;"></div>
						<div style="height: 10px; clear: both;"></div>

						<div class="card-info-area">
							<div class="card-detail-subtitle">
								<b>연회비</b>
							</div>
							<div style="height: 15px; clear: both;"></div>
							<div class="card-detail-subcontent">
								<c:choose>
									<c:when test="${ not empty list.annualFee }">
										<c:forEach items="${ list.annualFee }" var="annualFee"
											varStatus="status">
											<div style="display: inline-block; width: 15%">${ annualFee.brand  }</div>
											<div style="display: inline-block;">
												<b><fmt:formatNumber value="${ annualFee.fee }"
														groupingUsed="true" /></b> &nbsp;원
											</div>
											<br />
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>이 상품은 연회비가 없습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div style="height: 10px; clear: both;"></div>
							<hr>
							<div style="height: 10px; clear: both;"></div>
							<div class="card-detail-subtitle">
								<b>통합할인한도</b>
							</div>
							<div style="height: 15px; clear: both;"></div>
							<div class="card-detail-subcontent" style="width: 80%;">
								<c:choose>
									<c:when test="${ not empty list.limitBenefit }">
										<c:forEach items="${ list.limitBenefit }" var="limitBenefit"
											varStatus="status">
											<div
												style="display: inline-block; margin-right: 3%; width: 50%;">
												지난 달 카드&nbsp; <strong><fmt:formatNumber
														value="${ limitBenefit.prevPerformance }"
														groupingUsed="true" /></strong>&nbsp;원 사용 시
											</div>
											<div style="display: inline-block;">
												<strong><fmt:formatNumber
														value="${ limitBenefit.maxBenefit }" groupingUsed="true" /></strong>&nbsp;원
											</div>
											<div style="height: 0px; clear: both;"></div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>이 상품은 통합할인한도가 없습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div style="height: 10px; clear: both;"></div>
							<hr>
							<div style="height: 10px; clear: both;"></div>
							<div class="card-detail-subtitle">
								<b>특별서비스</b>
							</div>
							<div style="height: 15px; clear: both;"></div>
							<div class="card-detail-subcontent">
								<c:choose>
									<c:when test="${ not empty list.specialServices }">
										<c:forEach items="${ list.specialServices }"
											var="specialServices" varStatus="status">
											<div style="margin-right: 3%;">${ specialServices.category }</div>
											<c:forEach items="${specialServices.detail}" var="detail"
												varStatus="status">
												<div
													style="display: inline-block; margin-right: 3%; width: 50%">${ detail.detailCategory }</div>
												<c:forEach items="${ detail.serviceList }" var="serviceList"
													varStatus="status">
													<div style="display: inline-block; margin-right: 3%;">${serviceList.service }</div>
													<div style="display: inline-block; margin-right: 3%;">${serviceList.content }</div>
												</c:forEach>
											</c:forEach>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>이 상품은 특별서비스가 제공되지 않습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<div class="benefit-info-area">
							<c:forEach items="${ list.benefits }" var="benefits"
								varStatus="status">
								<div class="card-detail-subtitle">
									<b>${benefits.category }</b>
								</div>
								<div style="height: 10px; clear: both;"></div>
								<c:forEach items="${ benefits.brandList }" var="brandList"
									varStatus="status">
									<div class="card-detail-subcontent">
										<div style="color: black; font-weight: bold;">${brandList.brand}&nbsp;에서&nbsp;${ brandList.benefit }</div>
										<div
											style="color: #7b7b7b; font-size: 10pt; font-weight: bold;">
											지난 달 카드&nbsp;
											<fmt:formatNumber value="${ brandList.prevPerformance  }"
												groupingUsed="true" />
											원 이상 사용 시
										</div>
										<div style="color: #7b7b7b; font-size: 10pt;">${brandList.constraint }</div>
									</div>
									<div style="height: 10px; clear: both;"></div>
								</c:forEach>
								<div style="height: 10px; clear: both;"></div>
								<hr>
								<div style="height: 10px; clear: both;"></div>
							</c:forEach>
						</div>

						<div style="height: 30px; clear: both;"></div>
					</div>
				</div>

			</c:forEach>
			<div style="height: 30px; clear: both;"></div>
			<div id="paging-area-5" style="float: center; text-align: center;">



				<c:choose>
					<c:when test="${ pageNo mod 5 ne 0 }">
						<c:set var="pageStartNo" value="${ pageNo - pageNo mod 5}" />
						<c:set var="pageStartNo" value="${ pageStartNo + 1 }"></c:set>

						<c:choose>
							<c:when test="${ checkTotalPageCnt < pageStartNo + 4 }">
								<c:set var="pageEndNo" value="${ checkTotalPageCnt }" />
							</c:when>
							<c:otherwise>
								<c:set var="pageEndNo" value="${ pageStartNo + 4 }" />
							</c:otherwise>
						</c:choose>

					</c:when>
					<c:otherwise>
						<c:set var="pageStartNo" value="${ pageNo - 4 }"></c:set>
						<c:set var="pageEndNo" value="${ pageNo }"></c:set>
					</c:otherwise>
				</c:choose>

				<c:if test="${ pageStartNo ne 1 }">
					<i id="${ pageStartNo - 5 }" class="fa fa-chevron-left"
						aria-hidden="true" onclick="goPage(this)"></i>
				</c:if>

				<c:forEach begin="${pageStartNo}" end="${ pageEndNo }" var="no"
					varStatus="status">
					<c:choose>
						<c:when test="${ pageNo eq no }">
							<span id="${no}" class="paging-active" onclick="goPage(this)">${no}</span>
						</c:when>
						<c:otherwise>
							<span id="${no}" class="paging-disabled" onclick="goPage(this)">${no}</span>
						</c:otherwise>
					</c:choose>




				</c:forEach>

				<c:if test="${ pageEndNo + 1 < checkTotalPageCnt }">
					<i id="${ pageEndNo + 1 }" class="fa fa-chevron-right"
						aria-hidden="true" onclick="goPage(this)"></i>
				</c:if>

			</div>
		</div>
		</section>
	</div>

	<div style="height: 30px; clear: both;"></div>
	<jsp:include page="/WEB-INF/jsp/include/chatBot.jsp" />


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