<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Good Card - 분석 결과 페이지</title>

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
<link href="${context}/resources/bootstrap/css/clean-blog.min.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/pollForm.css?ver=7"
	rel="stylesheet">
<link href="${context}/resources/custom/css/creditList.css?ver=7"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="${context}/resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css?ver=7"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>



<!-- Script File -->
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script>
<script src="${context}/resources/custom/js/pollForm.js"></script>
<script type="text/javascript">
	$(function() {

		$('.input-info-area').show();
		$('.card-info-area').hide();
		$('.benefit-info-area').hide();

		$('.click-input-info-area').click(function() {
			$('.input-info-area').show();
			$('.card-info-area').hide();
			$('.benefit-info-area').hide();
			$('.click-benefit-info-area').css("color", "#7b7b7b");
			$('.click-card-info-area').css("color", "#7b7b7b");
			$('.click-input-info-area').css("color", "#0085a1");
		});

		$('.click-card-info-area').click(function() {
			$('.card-info-area').show();
			$('.input-info-area').hide();
			$('.benefit-info-area').hide();
			$('.click-benefit-info-area').css("color", "#7b7b7b");
			$('.click-input-info-area').css("color", "#7b7b7b");
			$('.click-card-info-area').css("color", "#0085a1");
		});

		$('.click-benefit-info-area').click(function() {
			$('.benefit-info-area').show();
			$('.input-info-area').hide();
			$('.card-info-area').hide();
			$('.click-card-info-area').css("color", "#7b7b7b");
			$('.click-input-info-area').css("color", "#7b7b7b");
			$('.click-benefit-info-area').css("color", "#0085a1");
		});

		$('.card-detail-button').click(function() {
			$('.input-info-area').show();
			$('.card-info-area').hide();
			$('.benefit-info-area').hide();
			$('.click-benefit-info-area').css("color", "#7b7b7b");
			$('.click-card-info-area').css("color", "#7b7b7b");
			$('.click-input-info-area').css("color", "#0085a1");
		});

		$('#search_option_area_open').click(function() {
			$('#search_option_area').toggle();
		})
	});

	/* function detailPage(list){
		alert(list);
		//jQuery.ajaxSettings.traditional = true;
		
		var card = {'card' : list};
		jQuery.ajax({
			type : 'post',
			url : "${context}/recommend/detail.do",
			data : JSON.stringify(card),
			dataType : 'json',
			contentType : 'application/json',
			success : function() {
				alert('성공');
				location.replace('${context}/recommend/detail.do');
			},
			error : function(xhr, status, error) {
			}
		});
	}  */
</script>
<style type="text/css">
html, body {
	font-family: 'Nanum Gothic', serif;
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
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />


	<hr style="margin-top: 0px; margin-bottom: 5px; clear: both;">
	<div id="subMenu" class="container" style="font-size: 11pt">
		<a href="${context}" style="margin: 0"><i class="fa fa-home"
			aria-hidden="true"></i></a> <a href="${context}">홈</a><i
			class="fa fa-chevron-right" aria-hidden="true"></i><a
			href="${context}/recommend/poll.do">내게 맞는 카드 찾기</a>
	</div>
	<hr style="margin-bottom: 0px; margin-top: 5px; clear: both;">

	<div class="poll-main" style="background: #545762; height: auto;">

		<section class="section-wrapper"
			style="padding-top: 100px; padding-bottom: 100px;">
		<div class="container">
			<div
				style="width: 100%; color: white; float: center; text-align: center; font-size: 30pt;">설문조사
				분석 결과</div>
			<div style="height: 20px; clear: both;"></div>
			<div
				style="width: 100%; color: white; float: center; text-align: center; font-size: 13pt;">
				설문조사 내용을 바탕으로 카드를 추천해드립니다.</div>
			<div style="height: 50px; clear: both;"></div>
			<div style="width: 100%; background: white;">
				<div style="height: 50px; clear: both;"></div>
				<div style="width: 100%; font-size: 20pt; text-align: center;">
					내게 맞는 카드는 다음과 같습니다.</div>
				<div style="height: 20px; clear: both;"></div>
				<div
					style="width: 10%; border-bottom: 3px solid black; margin-left: 45%; margin-right: 45%;"></div>
				<div style="height: 30px; clear: both;"></div>
				<hr>
				<c:forEach items="${resultCardList}" var="list" varStatus="status"
					begin="0" end="4">

					<div style="height: 30px; clear: both;"></div>

					<div style="width: 100%;">

						<div style="height: 100%; float: left; padding: 5%;">
							<b
								style="font-size: 20pt; color: #0085a1; font-family: 'Nanum Gothic', serif;">${status.index + 1}</b>
						</div>

						<div class="card-image-area"
							style="height: 126.6px; background: url('http://13.125.9.203${list.imagePath}'); background-size: contain;	background-repeat: no-repeat;">
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




						<div
							style="display: inline-block; float: right; height: 100%; margin-right: 3%;">
							<span style="text-align: center;" class="card-detail-button"
								onclick="goDetailPage('${status.index}', '${list.id }')">
								<a href="#open${ status.index }" class="card-detail-button"
								style="color: #0085a1;">상세 보기</a>
							</span> <span class="card-homepage-button"
								onclick="goCardHomepage('${list.homepageURL}')"
								style="text-align: center;"> 카드 신청 </span>


						</div>

					</div>
					<div style="height: 30px; clear: both;"></div>
					<div
						style="text-align: right; font-size: 15pt; display: inherit; margin-right: 5%;">
						총<b>&nbsp;<fmt:formatNumber value="${list.totalBenefit}"
								groupingUsed="true" /></b> 원 혜택
					</div>
					<div style="height: 30px; clear: both;"></div>
					<hr>

					<div class="white_content" id="open${ status.index }">
						<div
							style="padding-left: 3%; padding-right: 3%; font-family: 'Nanum Gothic', serif;">
							<div>
								<a href="#close"
									style="color: gray; float: right; font-size: 20pt;">x</a>
							</div>
							<div style="clear: both;"></div>
							<div class="card-image-area"
								style="background: url('http://13.125.9.203${list.imagePath}'); background-repeat: no-repeat; background-size: contain;"></div>
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
							</div>
							<div style="height: 15px; clear: both;"></div>
							<div class="card-detail-menu-area">
								<div class="click-input-info-area"
									style="color: #0085a1; font-size: 12pt; font-style: bold; display: inline-block; margin-right: 60px; cursor: pointer;">
									<b>받으실 수 있는 혜택</b>
								</div>
								<div class="click-card-info-area"
									style="color: #7b7b7b; font-size: 12pt; font-style: bold; display: inline-block; margin-right: 60px; cursor: pointer;">
									<b>카드 정보</b>
								</div>
								<div class="click-benefit-info-area"
									style="color: #7b7b7b; font-size: 12pt; font-style: bold; display: inline-block; cursor: pointer;">
									<b>혜택 정보</b>
								</div>
							</div>
							<div style="height: 20px; clear: both;"></div>

							<div class="input-info-area">
							<div style="height: 10px; clear: both;"></div>
								<c:choose>
									<c:when test="${ not empty list.estimate }">

										<div class="card-detail-subtitle" style="font-size: 13pt;">
											"&nbsp;월&nbsp; <b><fmt:formatNumber
													value="${ inputPollAmount * 10000 }" groupingUsed="true" />
												&nbsp;</b>원 사용 시 최대&nbsp; <c:choose>
													<c:when
														test="${ list.estimate.limitBenefit < list.estimate.total}">
														<b><fmt:formatNumber value="${ list.estimate.total }"
															groupingUsed="true" /></b>
													</c:when>
													<c:otherwise>
														<b><fmt:formatNumber value="${ list.estimate.limitBenefit }"
															groupingUsed="true" /></b>
													</c:otherwise>
												</c:choose> &nbsp;혜택&nbsp;"
										</div>
									</c:when>
									<c:otherwise>
										혜택 정보가 없습니다.
									</c:otherwise>
								</c:choose>
							<div style="height: 10px; clear: both;"></div>
							<hr>
							<div style="height: 10px; clear: both;"></div>
							<div class="card-detail-subtitle" style="color: #0085a1; font-size: 13pt;">
								<b>상세 내역</b>
							</div>
							<div style="height: 10px; clear: both;"></div>
							<c:forEach items="${ list.estimate.benefitList }"
								var="benefitList" varStatus="status">
								<div class="card-detail-subtitle">
									<b>${ benefitList.brand }에서&nbsp;${ benefitList.benefit }</b>
								</div>
								<div style="height: 15px; clear: both;"></div>
								<div class="card-detail-subcontent">
									월 <b><fmt:formatNumber value="${ benefitList.spendMoney }"
											groupingUsed="true" /></b>&nbsp;원 사용 시&nbsp;
									<fmt:formatNumber value="${ benefitList.benefitAmount }"
										groupingUsed="true" />
									</b> &nbsp;원 혜택
								</div>
								<div style="height: 10px; clear: both;"></div>
								<hr>
								<div style="height: 10px; clear: both;"></div>
							</c:forEach>
							</div>

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
												<div style="display: inline-block; width: 15%;">${ annualFee.brand  }</div>
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
												<c:choose>
													<c:when test="${ limitBenefit.prevPerformance eq 0 }">
													</c:when>
													<c:otherwise>

														<div
															style="display: inline-block; margin-right: 3%; width: 50%;">
															지난 달 카드&nbsp; <strong><fmt:formatNumber
																	value="${ limitBenefit.prevPerformance }"
																	groupingUsed="true" /></strong>&nbsp;원 사용 시
														</div>
													</c:otherwise>
												</c:choose>


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
													<c:forEach items="${ detail.serviceList }"
														var="serviceList" varStatus="status">
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
												<c:choose>
													<c:when test="${ brandList.prevPerformance eq 0 }">
													전월 실적 없음
												</c:when>
													<c:otherwise>
												지난 달 카드&nbsp;<fmt:formatNumber
															value="${ brandList.prevPerformance  }"
															groupingUsed="true" />원 이상 사용 시
												</c:otherwise>
												</c:choose>

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
			</div>
		</div>
		</section>
	</div>

	<jsp:include page="/WEB-INF/jsp/include/chatBot.jsp" />
</body>
</html>