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
	href="${context}/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css?ver=3"
	rel="stylesheet">
<link href="${context}/resources/custom/css/main.css?ver=3"
	rel="stylesheet">
<link href="${context}/resources/custom/css/topMenu.css?ver=3"
	rel="stylesheet">
<link href="${context}/resources/custom/css/cleardiv.css?ver=3"
	rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="${context}/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css?ver=3"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="${context}/resources/bootstrap/css/clean-blog.min.css?ver=3"
	rel="stylesheet">
<link href="${context}/resources/bootstrap/css/main.css?ver=3"
	rel="stylesheet">
<link href="${context}/resources/custom/css/pollForm.css?ver=3"
	rel="stylesheet">

<!-- Script File -->
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script> 
<script src="${context}/resources/custom/js/pollForm.js"></script>
<style type="text/css">

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />


	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container">
		<i class="fa fa-home" aria-hidden="true"></i> &nbsp;홈&nbsp;>&nbsp;내게
		맞는 카드 찾기&nbsp;>&nbsp;설문조사
	</div>
	<hr style="margin-bottom: 0px; margin-top: 5px; clear: both;">



	<div class="poll-main">

		<section class="section-wrapper"
			style="padding-top: 100px; padding-bottom: 100px;">
			<div class="container">
			
				<form id="pollForm" method="post"
					action="${context}/recommend/poll.do">
				<div id="poll_title" class="row"
					style="margin: 0px; text-align: center;">
					<b>설문조사</b>
				</div>
				<div style="color: gray;">
					개인별 맞춤 서비스를 제공하기 위한 사전 설문조사입니다.<br> 한 달 평균 소비 패턴을 입력하시면, 분석 후
					회원님께 최적의 카드를 추천해드립니다. <br>
				</div>
				<div style="height: 30px; clear: both;"></div>
				
				<div style="width: 100%; color: red;">
					* 필수 입력 항목입니다. 빠짐없이 입력해주세요.
				</div>
				
				<div style="height: 30px; clear: both;"></div>




					<div id="div_cardtype_radio" style="width: 100%">
					
						<span class="custom-input-group-addon"> <i
							class="fa fa-credit-card-alt" aria-hidden="true"></i>&nbsp;카드 유형&nbsp;<i style="color:red;">*</i>
						</span>
						
						<span class="wrap">
						<input name="cardtype" type="radio" id="radio0" class="radio" value="credit">
						<label for="radio0" class="radio-label">
							<i class="fa fa-check"></i>
							<span>신용카드</span>
						</label>
						<input name="cardtype" type="radio" id="radio1" class="radio" value="check">
						<label for="radio1" class="radio-label">
							<i class="fa fa-check"></i>
							<span>체크카드</span>
						</label>
						</span>			
					</div>
					
					<div style="height: 10px; clear: both;"></div>

					<!-- age -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-info" aria-hidden="true"></i>&nbsp;나이&nbsp;<i style="color:red;">*</i>
						</span>&nbsp;만
						<c:choose>
							<c:when test="${ not empty loginUser }">
								<input id="birth_date" type="hidden"
									value="${loginUser.birthDate}" />
								<input id="input_login_age" type="text" name="age"
									style="border: 0px; border-bottom: 1px solid black; width: 3%; margin-right: 5px;"
									readonly="readonly"> 세								
							</c:when>
							<c:otherwise>
								<input id="input_age" type="text" name="age"
									style="border: 0px; border-bottom: 1px solid black; width: 3%; margin-right: 5px;"> 세
							</c:otherwise>
						</c:choose>
					</div>


					<div style="height: 10px; clear: both;"></div>

					<div style="width: 100%">
						<span class="custom-input-group-addon "> <i>￦</i>&nbsp;월 예산&nbsp;<i style="color:red;">*</i>
						</span>&nbsp; <input type="text" id="inputAmount" name="amount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>




					<div style="height: 10px; clear: both;"></div>



					<!-- transportation -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-bus"></i>&nbsp;대중교통
						</span>&nbsp; <input type="text" id="inputTransportation"
							name="transportationAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<!-- SmartPhone -->
					<div style="height: 10px; clear: both;"></div>
					<div style="width: 100%">
						<span class="custom-input-group-addon"><i
							class="fa fa-mobile"></i>&nbsp;통신 요금 </span>&nbsp; <input type="text"
							id="inputCommunication" name="communicationAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원 <span
							style="float: right;"> <span
							id="detail_button_communication">상세보기&nbsp;▼</span> <span
							id="hide_button_communication" style="display: none;">접기&nbsp;▲</span>
						</span>
					</div>


					<!-- detail smartPhone -->
					<div id="display_detail_communication"
						class="display-communication-list"
						style="margin-top: 70px; margin-bottom: 70px;">
						<ul class="display-ul">

							<li class="display-communication-li"><b>SKT</b><br> <span>
									<input type="text" id="inputCommunicationSkt"
									name="communicationSkt"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-communication-li', '#inputCommunication')">&nbsp;만원
							</span></li>

							<li class="display-communication-li"><b>KT</b><br> <span>
									<input type="text" id="inputCommunicationKt"
									name="communicationKt"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-communication-li', '#inputCommunication')">&nbsp;만원
							</span></li>

							<li class="display-communication-li"><b>LG U+</b><br> <span>
									<input type="text" id="inputCommunicationUPlus"
									name="communicationUPlus"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-communication-li', '#inputCommunication')">&nbsp;만원
							</span></li>

							<li class="display-communication-li"
								style="border-right: 1px solid #E0E0E0;"><b>기타</b><br>
								<span> <input type="text" id="inputCommunicationEtc"
									name="communicationEtc"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-communication-li', '#inputCommunication')">&nbsp;만원
							</span></li>
						</ul>
					</div>
					<div style="height: 10px; clear: both;"></div>

					<!-- gasStation -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"><i class="fa fa-car"
							aria-hidden="true"></i> &nbsp;주유소 </span>&nbsp; <input type="text"
							id="inputGasStation" name="gasStationAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- movie -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-video-camera" aria-hidden="true"></i> &nbsp;영화관
						</span>&nbsp; <input type="text" id="inputMovie" name="movieAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- cafeBakery -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-coffee" aria-hidden="true"></i>&nbsp;카페
						</span>&nbsp; <input type="text" id="inputCafeBakery"
							name="cafeBakeryAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원 <span
							style="float: right;"> <span id="detail_button_cafeBakery">상세보기&nbsp;▼</span>
							<span id="hide_button_cafeBakery" style="display: none;">접기&nbsp;▲</span>
						</span>
					</div>

					<!-- detail cafeBakery -->
					<div id="display_detail_cafeBakery" class="display-cafeBakery-list"
						style="margin-top: 70px; margin-bottom: 70px;">
						<ul class="display-ul">
							<li class="display-cafeBakery-li"><b>스타벅스</b><br> <span>
									<input type="text" id="inputStarbucks" name="starbucks"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"><b>투썸플레이스</b><br> <span>
									<input type="text" id="inputTwosomePlace" name="twosomePlace"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"><b>카페베네</b><br> <span>
									<input type="text" id="inputCafebene" name="cafebene"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"><b>엔젤리너스</b><br> <span>
									<input type="text" id="inputAngelinus" name="angelinus"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"><b>커피빈</b><br> <span>
									<input type="text" id="inputCoffebean" name="coffebean"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<div style="height: 10px; clear: both;"></div>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>이디야</b><br>
								<span> <input type="text" id="inputEdiya" name="ediya"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>할리스</b><br>
								<span> <input type="text" id="inputHollys" name="hollys"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>배스킨라빈스</b><br>
								<span> <input type="text" id="inputBaskinRobbins"
									name="baskinRobbins"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>던킨도너츠</b><br>
								<span> <input type="text" id="inputDunkinDonuts"
									name="dunkinDonuts"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>파스쿠찌</b><br>
								<span> <input type="text" id="inputPascucci"
									name="pascucci"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<div style="height: 10px; clear: both;"></div>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>탐앤탐스</b><br>
								<span> <input type="text" id="inputTomNToms"
									name="tomNToms"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>스무디킹</b><br>
								<span> <input type="text" id="inputSmoothieKing"
									name="smoothieKing"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>파리바게트</b><br>
								<span> <input type="text" id="inputParisBaguette"
									name="parisBaguette"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>뚜레쥬르</b><br>
								<span> <input type="text" id="inputTousLesJours"
									name="hollys"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
							<li class="display-cafeBakery-li"
								style="border-right: 1px solid #E0E0E0;"><b>기타</b><br>
								<span> <input type="text" id="inputCafeBakeryEtc"
									name="cafeBakeryEtc"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-cafeBakery-li', '#inputCafeBakery')">&nbsp;만원
							</span></li>
						</ul>
					</div>
					<div id="cafeBakery_margin"
						style="height: 60px; clear: both; display: none;"></div>
					<div style="height: 10px; clear: both;"></div>

					<!-- restaurant -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"><i
							class="fa fa-cutlery" aria-hidden="true"></i> &nbsp;패밀리 레스토랑 </span>&nbsp;
						<input type="text" id="inputRestaurant" name="restaurantAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원 <span
							style="float: right;"> <span id="detail_button_restaurant">상세보기&nbsp;▼</span>
							<span id="hide_button_restaurant" style="display: none;">접기&nbsp;▲</span>
						</span>
					</div>


					<!-- detail restaurant -->
					<div id="display_detail_restaurant" class="display-restaurant-list"
						style="margin-top: 70px; margin-bottom: 70px;">
						<ul class="display-ul">

							<li class="display-restaurant-li"><b>아웃백</b><br> <span>
									<input type="text" id="inputOutback" name="outback"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-restaurant-li', '#inputRestaurant')">&nbsp;만원
							</span></li>

							<li class="display-restaurant-li"><b>VIPS</b><br> <span>
									<input type="text" id="inputVips" name="vips"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-restaurant-li', '#inputRestaurant')">&nbsp;만원
							</span></li>

							<li class="display-restaurant-li"><b>애슐리</b><br> <span>
									<input type="text" id="inputAshley" name="ashley"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-restaurant-li', '#inputRestaurant')">&nbsp;만원
							</span></li>

							<li class="display-restaurant-li"><b>T.G.I. Friday's</b><br>
								<span> <input type="text" id="inputTgif" name="tgif"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-restaurant-li', '#inputRestaurant')">&nbsp;만원
							</span></li>

							<li class="display-restaurant-li"><b>매드포갈릭</b><br> <span>
									<input type="text" id="inputMadForGarlic" name="madForGarlic"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-restaurant-li', '#inputRestaurant')">&nbsp;만원
							</span></li>

							<li class="display-restaurant-li"
								style="border-right: 1px solid #E0E0E0;"><b>기타</b><br>
								<span> <input type="text" id="inputRestaurantEtc"
									name="restaurantEtc"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-restaurant-li', '#inputRestaurant')">&nbsp;만원
							</span></li>
						</ul>
					</div>


					<div style="height: 10px; clear: both;"></div>

					<!-- fastFood -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"><i>F</i> &nbsp;패스트푸드</span>&nbsp;
						<input type="text" id="inputFastFood" name="fastFoodAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원 <span
							style="float: right;"> <span id="detail_button_fastFood">상세보기&nbsp;▼</span>
							<span id="hide_button_fastFood" style="display: none;">접기&nbsp;▲</span>
						</span>
					</div>


					<!-- detail fastFood -->
					<div id="display_detail_fastFood" class="display-fastFood-list"
						style="margin-top: 70px; margin-bottom: 70px;">
						<ul class="display-ul">

							<li class="display-fastFood-li"><b>맥도날드</b><br> <span>
									<input type="text" id="inputMcDonalds" name="mcDonalds"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<li class="display-fastFood-li"><b>롯데리아</b><br> <span>
									<input type="text" id="inputLotteRia" name="lotteRia"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<li class="display-fastFood-li"><b>버거킹</b><br> <span>
									<input type="text" id="inputBurgurKing" name="burgurKing"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<li class="display-fastFood-li"><b>KFC</b><br> <span>
									<input type="text" id="inputKfc" name="kfc"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<div style="height: 10px; clear: both;"></div>

							<li class="display-fastFood-li"><b>미스터피자</b><br> <span>
									<input type="text" id="inputMrPizza" name="mrPizza"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<li class="display-fastFood-li"><b>도미노피자</b><br> <span>
									<input type="text" id="inputDominoPizza" name="dominoPizza"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<li class="display-fastFood-li"><b>피자헛</b><br> <span>
									<input type="text" id="inputPizzaHut" name="pizzaHut"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<li class="display-fastFood-li"><b>파파존스</b><br> <span>
									<input type="text" id="inputPapaJohns" name="papaJohns"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>

							<div style="height: 10px; clear: both;"></div>

							<li class="display-fastFood-li"
								style="border-right: 1px solid #E0E0E0;"><b>기타</b><br>
								<span> <input type="text" id="inputfastFoodEtc"
									name="fastFoodEtc"
									style="border: 0px; border-bottom: 1px solid black; width: 25%"
									onkeydown="onlyNumber(this)"
									onfocusout="sumValue('.display-fastFood-li', '#inputFastFood')">&nbsp;만원
							</span></li>
						</ul>
					</div>

					<div id="fastFood_margin"
						style="height: 60px; clear: both; display: none;"></div>
					<div style="height: 10px; clear: both;"></div>

					<!-- cafeTeria -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"><i
							class="fa fa-beer" aria-hidden="true"></i>&nbsp;식당/주점</span>&nbsp; <input
							type="text" id="inputCafeteria" name="cafeteriaAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>


					<div style="height: 10px; clear: both;"></div>

					<!-- convenience -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;편의점
						</span>&nbsp; <input type="text" id="inputConvenience"
							name="convenienceAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- mart -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;대형마트
						</span>&nbsp; <input type="text" id="inputMart" name="martAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>


					<div style="height: 10px; clear: both;"></div>

					<!-- superMarket -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-shopping-basket" aria-hidden="true"></i> &nbsp;슈퍼마켓
						</span>&nbsp; <input type="text" id="inputSuperMarket"
							name="superMarketAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- Online-Shopping -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-globe" aria-hidden="true"></i> &nbsp;온라인쇼핑
						</span>&nbsp; <input type="text" id="inputOnlineShopping"
							name="onlineShoppingAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- Beauty -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-opera" aria-hidden="true"></i> &nbsp;드럭스토어
						</span>&nbsp; <input type="text" id="inputBeauty" name="beautyAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- AmusementPark -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-clock-o" aria-hidden="true"></i> &nbsp;놀이공원
						</span>&nbsp; <input type="text" id="inputAmusementPark"
							name="amusementParkAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- Academy -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-pencil" aria-hidden="true"></i> &nbsp;학원
						</span>&nbsp; <input type="text" id="inputAcademy" name="academyAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- BookStore -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-book" aria-hidden="true"></i> &nbsp;서점
						</span>&nbsp; <input type="text" id="inputBookstore"
							name="bookstoreAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>

					<div style="height: 10px; clear: both;"></div>

					<!-- Medical -->
					<div style="width: 100%">
						<span class="custom-input-group-addon"> <i
							class="fa fa-medkit" aria-hidden="true"></i> &nbsp;의료서비스
						</span>&nbsp; <input type="text" id="inputMedical" name="medicalAmount"
							style="border: 0px; border-bottom: 1px solid black; width: 5%"
							onkeydown="onlyNumber(this)">&nbsp;만원
					</div>
					<div style="height: 70px; clear: both;"></div>
					<div style="width: 100%; text-align: center;">
						<input type="submit" id="submitPoll" class="submit_button"
							value="설문조사 완료">
						<button id="goMain" class="go_main">메인 페이지</button>
					</div>
				</form>

				<!-- 		<div style="width: 100%; text-align: center;">
					<button id="submitPoll" class="submit_button">설문조사 완료</button>
					<button id="goMain" class="go_main">메인 페이지</button>
				</div> -->
			</div>
		</section>
	</div>
	<%-- 
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" /> --%>

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