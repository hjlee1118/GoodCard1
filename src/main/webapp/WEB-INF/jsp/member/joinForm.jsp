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
<link href="${context}/resources/custom/css/joinForm.css?ver=3"
	rel="stylesheet">

<!-- Script File -->
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script>
<script src="${context}/resources/custom/js/joinForm.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />


	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container">
		<a href="${context}" style="margin:0"><i class="fa fa-home" aria-hidden="true"></i></a>
		<a href="${context}">홈</a>><a>회원정보</a>><a href="${context}/member/join.do">회원가입</a>
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
						<span id="idMessage_duple_x"
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
							영문, 숫자, 특수문자 혼합, 5~15자
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
				
				<div style="height: 20px;  clear: both;"></div>

				<!-- 	<div style="width: 100%">
						<span class="custom-input-join-group-addon">내 카드 등록</span> <span
							style="width: 30%; height: 28px; display: inline-block; margin-bottom: -10px;">
							<input id="searchInput" class="form-control input-lg"
							placeholder="카드명 or 카드회사를 입력하세요" autocomplete="off"
							spellcheck="false" tabindex="1"
							style="background: #fff; width: 80%; margin-right: 2%;">

							<label for="searchInput"> <a href="#open"> <i
									id="show_modal" class="fa fa-search fa-lg" aria-hidden="true"
									style="cursor: pointer;"></i>
							</a>
						</label>							
						</span>
					</div> -->
<!-- 
					<div class="white_content" id="open">
						<div style="padding-left: 20px; font-family: 'Nanum Gothic', serif;">
							<div>
							<a href="#close"
								style="color: gray; float: right; font-size: 20pt;">x</a>
							</div>
							<div style="height: 0px; clear: both;"></div>
							
							<div>
								<div style="margin: 0px; text-align: left;font-size: 15pt;">
									<b>내 카드 등록</b>
								</div>
									<div style="color: gray; font-size:12pt;">사용중인 카드를 5개까지 등록할 수 있습니다.<br>
									</div>
							</div>							
							
							<div style="height: 20px; clear: both;"></div>
							
							<div>								
								<select id="inputCardType" name="cardType" style="font-size:12pt; margin-right: 2%;" onchange="setInputCardType();">
									<option selected="true" disabled="disabled">카드 타입</option>
									<option value="creditCard">신용카드</option>
									<option value="checkCard">체크카드</option>
								</select>
								
								<select id="inputSearchType" name="searchType" style="font-size:12pt; margin-right: 2%; display: none;" onchange="setInputSearchType();">
									<option selected="true" disabled="disabled">검색 옵션</option>    
									<option value="cardName">카드명</option>
									<option value="brand">브랜드</option>								
								</select>	
								
								<select id="inputCreditCardBrand" name="creditCardBrand" style="font-size: 12pt; display: none; margin-right: 2%;">
								<option selected="true" disabled="disabled"></option>
									<option value="0">하나</option>
									<option value="1">KB국민</option>
									<option value="2">신한</option>
									<option value="3">BC</option>
									<option value="4">삼성</option>
									<option value="5">롯데</option>
									<option value="6">현대</option>
									<option value="7">우리</option>
									<option value="8">NH농협</option>
									<option value="9">IBK</option>
									<option value="10">씨티</option>
									<option value="11">SC제일</option>
									<option value="12">부산</option>
									<option value="13">광주</option>
									<option value="14">대구</option>
									<option value="15">경남</option>
									<option value="16">전북</option>
									<option value="17">제주</option>
									<option value="18">수협</option>
									<option value="19">기타</option>
								</select>
								
								<select id="inputCheckCardBrand" name="checkCardBrand" style="font-size: 12pt; display: none; margin-right: 2%;">
									<option selected="true" disabled="disabled"></option>
									<option value="0">하나</option>
									<option value="1">KB국민</option>
									<option value="2">신한</option>
									<option value="3">삼성</option>
									<option value="4">롯데</option>
									<option value="5">현대</option>
									<option value="6">우리</option>
									<option value="7">NH농협</option>
									<option value="8">IBK</option>
									<option value="9">씨티</option>
									<option value="10">SC제일</option>
									<option value="11">부산</option>
									<option value="12">광주</option>
									<option value="13">대구</option>
									<option value="14">경남</option>
									<option value="15">전북</option>
									<option value="16">제주</option>
									<option value="17">수협</option>
									<option value="18">신협</option>
									<option value="19">새마을금고</option>
									<option value="20">KDB산업은행</option>
									<option value="21">우체국카드</option>
									<option value="22">케이뱅크</option>
									<option value="23">웰컴저축은행</option>
									<option value="24">KB증권</option>
									<option value="25">유안타증권</option>
									<option value="26">동부증권</option>
									<option value="27">유진투자증권</option>
								</select> 
								
								<input id="searchInput1" name="myCardsearchInput" class="form-control input-lg" placeholder="카드명 or 카드회사를 입력하세요" autocomplete="off"
									spellcheck="false" tabindex="1"	style="background: #fff; width: 30%; height:31px; margin-right: 2%; display: none;">
								
								<span id="modal_submit" style="display: none;" >
									<i class="fa fa-search fa-lg" aria-hidden="true" style="cursor: pointer;"></i>
								</span>
							</div>
							<div style="height: 20px; clear: both;"></div>
							<div id="modal_result_area" style="background:red;">
								냠냠냠
							</div>
							
						</div>
						
					</div> -->

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