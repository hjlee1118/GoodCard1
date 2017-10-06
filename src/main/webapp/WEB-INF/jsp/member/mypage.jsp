<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Good Card - 마이페이지</title>

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
	function onlyNumber(obj) {
		$(obj).keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	}
	
	function deleteMyCard(inputId){
		var id = {'id' : inputId};
		$.ajax({
			type : "POST",
			url : "${context}/deleteMyCard.do",
			data : id,
			dataType : 'json',
			success : function(id, cardNo) {
				alert('My Card 목록에서 삭제 되었습니다.');
				location.replace("${context}/member/mypage.do");
			},
			complete : function(id, cardNo) {
			},
			error : function(xhr, status, error) {
				alert('My Card 목록에서 삭제하던 중 오류가 발생했습니다. 관리자에게 문의하세요.');
			}
		});
	}
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />


	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container" style="font-size: 11pt">
		<a href="${context}" style="margin: 0"><i class="fa fa-home"
			aria-hidden="true"></i></a> <a href="${context}">홈</a><i
			class="fa fa-chevron-right" aria-hidden="true"></i><a>회원정보</a><i
			class="fa fa-chevron-right" aria-hidden="true"></i><a
			href="${context}/member/mypage.do">마이페이지</a>
	</div>
	<hr style="margin-bottom: 0px; margin-top: 5px; clear: both;">



	<div class="poll-main">

		<section class="section-wrapper"
			style="padding-top: 100px; padding-bottom: 100px;">
		<div class="container">
			<div id="poll_title" class="row"
				style="margin: 0px; text-align: center;">
				<b>마이페이지</b>
			</div>
			<div style="color: gray;">
				GoodCard 마이페이지 입니다.<br> 회원 유형과 아이디는 수정이 불가능합니다.
			</div>
			<div style="height: 30px; clear: both;"></div>
			<div style="height: 30px; clear: both;"></div>

			<form id="joinForm" method="post"
				action="${context}/member/mypage.do">
				<div style="width: 100%">
					<span class="custom-input-join-group-addon">회원 유형 </span>&nbsp; <span
						class="wrap"> <c:choose>
							<c:when test="${ loginUser.type eq 'U' }">
								<input name="type" type="radio" id="radio0" class="radio"
									value="U" disabled="disabled" checked="checked">
								<label for="radio0" class="radio-label"> <i
									class="fa fa-check"></i> <span>개인</span>
								</label>
								<input name="type" type="radio" id="radio1" class="radio"
									value="O" disabled="disabled">
								<label for="radio1" class="radio-label"> <i
									class="fa fa-check"></i> <span>사업자</span>
								</label>
							</c:when>
							<c:otherwise>
								<input name="type" type="radio" id="radio0" class="radio"
									value="U" disabled="disabled">
								<label for="radio0" class="radio-label"> <i
									class="fa fa-check"></i> <span>개인</span>
								</label>
								<input name="type" type="radio" id="radio1" class="radio"
									value="O" disabled="disabled" checked="checked">
								<label for="radio1" class="radio-label"> <i
									class="fa fa-check"></i> <span>사업자</span>
								</label>
							</c:otherwise>
						</c:choose>

					</span>
				</div>
				<div style="height: 20px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon "> 아이디 </span> <input
						type="text" id="inputId" name="id" class="custom-join-input-value"
						placeholder="영문, 숫자 혼합, 5~15자" value="${ loginUser.id }"
						disabled="disabled">
				</div>

				<div style="height: 20px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon "> 비밀번호 </span> <input
						type="password" id="inputPassword" name="password"
						class="custom-join-input-value"
						placeholder="영문, 숫자, 특수문자 혼합, 6~15자"
						value="${ loginUser.password }"> <span
						id="passwordFormMsg"
						style="display: none; text-align: left; color: red;"
						class="custom-input-group"> <span
						class="custom-input-group-addon custom-input-category"></span> ※
						영문, 숫자, 특수문자 혼합, 6~15자
					</span>
				</div>

				<div style="height: 20px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon "> 비밀번호 확인 </span> <input
						type="password" id="inputPasswordChk" name="passwordChk"
						class="custom-join-input-value" placeholder="비밀번호 재입력"
						value="${ loginUser.password }"> <span
						id="passwordCheckUncorrectMsg"
						style="display: none; color: red; text-align: left;"
						class="custom-input-group"> <span
						class="custom-input-group-addon custom-input-category"></span> <span>※
							비밀번호가 다릅니다.</span>
					</span> <span id="passwordCheckCorrectMsg"
						style="display: none; color: green; text-align: left;"
						class="custom-input-group"> <span
						class="custom-input-group-addon custom-input-category"></span> <span>※
							비밀번호가 일치합니다.</span>
					</span>
				</div>

				<div style="height: 20px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon">이메일</span> <input
						type="text" id="inputEmail" name="email"
						class="custom-join-input-value" value="${ loginUser.email }" /> <span
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
					<span class="custom-input-join-group-addon">이름</span> <input
						type="text" id="inputName" name="name"
						class="custom-join-input-value" value="${ loginUser.name }" />
				</div>

				<div style="height: 20px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon">전화번호</span> <select
						id="txtMobile1" name="phone1" style="width: 9%">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select> <span style="margin: 5px;">-</span> <input type="text"
						id="inputPhone2" name="phone2" class="custom-join-input-value-3"
						value="${ loginUser.phone2 }" onkeydown="onlyNumber(this)" /> <span
						style="margin: 5px;">-</span> <input type="text" id="inputPhone3"
						name="phone3" class="custom-join-input-value-3"
						value="${ loginUser.phone3 }" onkeydown="onlyNumber(this)" />
				</div>


				<div style="height: 20px; clear: both;"></div>

				<!-- 생년월일 (숫자만 입력가능) -->
				<div style="width: 100%">
					<span class="custom-input-join-group-addon">생년월일</span> <input
						type="text" id="inputBirthDate" name="inputBirthDate"
						class="custom-join-input-value"
						value="${loginUser.inputBirthDate }" onkeydown="onlyNumber(this)" />
				</div>


				<div style="height: 20px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon">성별</span> <span
						class="wrap"> <c:choose>
							<c:when test="${ loginUser.gender eq 'M' }">
								<input name="gender" type="radio" id="s_radio0" class="radio"
									value="M" checked="checked">
								<label for="s_radio0" class="radio-label"> <i
									class="fa fa-check"></i> <span> 남자 </span>
								</label>
								<input name="gender" type="radio" id="s_radio1" class="radio"
									value="W">
								<label for="s_radio1" class="radio-label"> <i
									class="fa fa-check"></i> <span>여자</span>
								</label>
							</c:when>
							<c:otherwise>
								<input name="gender" type="radio" id="s_radio0" class="radio"
									value="M">
								<label for="s_radio0" class="radio-label"> <i
									class="fa fa-check"></i> <span> 남자 </span>
								</label>
								<input name="gender" type="radio" id="s_radio1" class="radio"
									value="W" checked="checked">
								<label for="s_radio1" class="radio-label"> <i
									class="fa fa-check"></i> <span>여자</span>
								</label>
							</c:otherwise>
						</c:choose>
					</span>
				</div>

				<div style="height: 20px; clear: both;"></div>
				<c:choose>
					<c:when test="${ not empty myCardList }">
					
					
					</c:when>
					<c:otherwise>
					<div style="width: 100%">
						<span class="custom-input-join-group-addon">My Card</span>
						<span class="wrap" style="color: #7b7b7b;">등록된 My Card가 없습니다.</span>
					</div>
					<div style="width: 100%">
						<span class="custom-input-join-group-addon"></span>
						<span class="wrap" style="margin-right : 1%; color: #0085a1;">
							<a href="${context}/credit.do?pageNo=1">신용카드</a>
						</span>
						<span class="wrap" style="margin-right : 1%; color: #0085a1;">
							<a href="${context}/check.do?pageNo=1">체크카드</a>
						</span>
					</div>
					</c:otherwise>
				</c:choose>
				<c:forEach items="${ myCardList }" var="myCard" varStatus="status">
					<div style="width: 100%">
						<c:choose>
							<c:when test="${status.index eq 0}">
								<span class="custom-input-join-group-addon">My Card</span>
							</c:when>
							<c:otherwise>
								<span class="custom-input-join-group-addon"></span>
							</c:otherwise>
						</c:choose>
						<span style="color: red;" onclick="deleteMyCard('${ myCard.id }')"><i class="fa fa-minus-circle" aria-hidden="true"></i></span>
						<%-- <span style="width: 126.6px; height: 100px; background-repeat: no-repeat; background-size: contain; background: url('http://13.125.9.203${myCard.imagePath}');"></span>
						 --%>
						<span class="wrap" style="margin-left : 1%; color: #0085a1;"> ${ myCard.brand }
						</span> <span class="wrap"> ${ myCard.cardName } </span>
					</div>
				</c:forEach>

				<div style="height: 80px; clear: both;"></div>

				<div style="width: 100%">
					<span class="custom-input-join-group-addon"></span> <input
						id="joinButton" type="submit" class="join_button" value="회원정보 수정">
				</div>

			</form>
			<div style="height: 50px; clear: both;"></div>

		</div>
		</section>
	</div>

	<jsp:include page="/WEB-INF/jsp/include/chatBot.jsp" />
	<%-- <jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />
 --%>
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