<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="context" value="${pageContext.request.contextPath }" />
<script src="${context}/resources/custom/js/jquery-3.2.1.js"></script>
<script src="${context}/resources/custom/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function goPage(id) {

		var target_id = id;
		$('body, html').css('scrollTop', $(target_id).offset().top);
		$('body, html').animate({
			scrollTop : $(target_id).offset().top
		}, 500);
		window.scrollTo(0, $(target_id).offset().top);

	}
</script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

.manager-main {
	width: 100%;
	height: 100%;
	font-family: 'HanaFont' !important;
}

#statistic {
	font-family: 'Nanum Gothic', serif;
}

#recommend_keyword_area {
	font-family: 'Nanum Gothic', serif;
}

.service_link {
	border: 1px solid #7b7b7b;
	color: #7b7b7b;
	padding: 1%;
	cursor: pointer;
}

.service_link>a {
	color: #7b7b7b;
}

.area_form {
	width: 100%;
}

.recommend_keyword_rank {
	float: left;
	width: 25%;
	display: inline-block;
	min-height: 716px;
	background: #f6f8fc;
	padding-top: 50px;
}

i.click {
	cursor: pointer;
}
</style>
<c:set var="context" value="${pageContext.request.contextPath }" />

<link
	href="resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css?ver=4"
	rel="stylesheet">
<link href="resources/custom/css/main.css?ver=4" rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="resources/bootstrap/vendor/font-awesome/css/font-awesome.min.css?ver=4"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="resources/bootstrap/css/clean-blog.min.css?ver=4"
	rel="stylesheet">
<link href="resources/bootstrap/css/main.css?ver=4" rel="stylesheet">
<link href="resources/custom/css/topMenu.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/managerTopMenu.jsp" />
	<div class="manager-main">
		<div class="section-wrapper" style="height: 100%;">

			<!-- title -->
			<div id="statistic" class="area_form"
				style="background: #f3f3f3; min-height: 500px;">
				<div class="container">
					<div style="height: 100px; clear: both;"></div>
					<div id="statistic_title"
						style="width: 100%; text-align: center; font-size: 30pt;">
						<b>GoodCard 사업자 페이지</b>
					</div>
					<div style="height: 20px; clear: both;"></div>
					<div id="statistic_title_content"
						style="color: #7b7b7b; width: 100%; text-align: center;">
						Good Card 사업자 회원님 안녕하세요!<br /> 사업자 회원님은 마케팅에 활용할 수 있는 통계 자료를 이용하실
						수 있습니다.<br /> 또, 카드 상품 설계에 도움이 되는 유사 카드 정보를 제공해드립니다. <br />
					</div>
					<div style="height: 50px; clear: both;"></div>
					<div style="color: #7b7b7b; width: 100%; text-align: center;">
						<b style="font-size: 15pt">이용 가능 서비스</b>
						<div style="height: 20px; clear: both;"></div>
						<span class="service_link"
							onclick="goPage('#recommend_keyword_area')"># 검색어 순위 통계</span> <span
							style="padding: 0px 5px;"></span> <span class="service_link"
							onclick="goPage('#age_group_area')"># 연령대별 비교 통계</span> <span
							style="padding: 0px 5px;"></span> <span class="service_link"
							onclick="goPage('#brand_card_area')"># 하나카드 추천 통계</span> <span
							style="padding: 0px 5px;"></span> <span class="service_link"
							onclick="goPage('#card_make_area')"># 카드 상품 설계</span>
					</div>
					<div style="height: 100px; clear: both;"></div>
				</div>
			</div>

			<!-- 검색어 순위 통계 -->
			<div id="recommend_keyword_area" class="area_form"
				style="background: #7DC7EE;">
				<div class="container">
					<div style="height: 100px; clear: both;"></div>
					<div id="recommend_keyword_title"
						style="width: 100%; text-align: center; font-size: 30pt; color: white;">
						<b>검색어 순위 통계</b>
					</div>
					<div style="height: 20px; clear: both;"></div>
					<div id="recommend_keyword_title_content"
						style="width: 100%; text-align: center; color: white;">
						GoodCard 브랜드별, 혜택별 검색어 순위를 확인 할 수 있습니다.</div>
					<div style="height: 50px; clear: both;"></div>
					<div style="width: 100%; min-height: 716px; text-align: center;">
						<div style="height: 0px; clear: both;"></div>
						<div class="recommend_keyword_rank"
							style="border-right: 1px solid #dde8f6">
							<b>신용카드 인기 브랜드</b>
							<c:forEach begin="1" end="10" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 15%;">
									<div id="rank_num"
										style="width: 15%; color: #3387DE; font-weight: bold; display: inline-block;">${status.index}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block;">하나카드</div>
								</div>
							</c:forEach>
						</div>
						<div class="recommend_keyword_rank"
							style="border-right: 1px solid #dde8f6">
							<b>체크카드 인기 브랜드</b>
							<c:forEach begin="1" end="10" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 15%;">
									<div id="rank_num"
										style="width: 15%; color: #3387DE; font-weight: bold; display: inline-block;">${status.index}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block;">하나카드</div>
								</div>
							</c:forEach>
						</div>
						<div class="recommend_keyword_rank"
							style="border-right: 1px solid #dde8f6">
							<b>신용카드 인기 혜택</b>
							<c:forEach begin="1" end="10" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 15%;">
									<div id="rank_num"
										style="width: 15%; color: #3387DE; font-weight: bold; display: inline-block;">${status.index}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block;">통신통신</div>
								</div>
							</c:forEach>
						</div>
						<div class="recommend_keyword_rank">
							<b>체크카드 인기 혜택</b>
							<c:forEach begin="1" end="10" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 15%;">
									<div id="rank_num"
										style="width: 15%; color: #3387DE; font-weight: bold; display: inline-block;">${status.index}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block;">통신통신</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div style="height: 100px; clear: both;"></div>
				</div>

				<!-- 연령대별 비교 -->

				<div id="age_group_area" class="area_form"
					style="background: #F47264;">
					<div class="container">
						<div style="height: 100px; clear: both;"></div>
						<div id="recommend_keyword_title"
							style="width: 100%; text-align: center; font-size: 30pt; color: white;">
							<b>연령대별 비교</b>
						</div>
						<div style="height: 20px; clear: both;"></div>
						<div id="recommend_keyword_title_content"
							style="width: 100%; text-align: center; color: white;">
							GoodCard 고객 연령대별 관심 혜택, 카드 정보를 확인 할 수 있습니다.</div>
						<div style="height: 50px; clear: both;"></div>
						<div
							style="background: #F6F8FC; width: 100%; min-height: 716px; text-align: center;">
							<div style="height: 50px; clear: both;"></div>

							<c:set var="age_group" value="20"></c:set>

							<span> <i id="${age_group - 10}"
								class="fa fa-chevron-left click" aria-hidden="true"
								onclick="minusAge(this)" style="color: #F47264;"></i>
							</span> <span style="padding: 0px 10px; font-size: 16pt;"><b>${age_group}
									대</b></span> <span> <i id="${age_group + 10}"
								class="fa fa-chevron-right click" aria-hidden="true"
								onclick="plusAge(this)" style="color: #F47264;"></i>
							</span>

							<div style="height: 30px; clear: both;"></div>

							<div
								style="border-right: 1px solid #FDE4E1; width: 50%; min-height: 716px; display: inline-block; float: left;">
								<div
									style="width: 100%; font-weight: bold; text-align: center; font-size: 18pt;">
									<div id="age_area"
										style="text-align: center; display: inline-block;">${ age_group }</div>
									대 인기 카드 TOP 5
								</div>
								<c:forEach begin="1" end="5" varStatus="status">
									<div style="height: 50px; clear: both;"></div>
									<div
										style="width: 15%; float: left; text-align: left; padding-left: 10%; color: #F47264">
										<b>${status.index}</b>
									</div>
									<div
										style="width: 85%; text-align: left; padding-left: 10%; color: #7b7b7b;">
										신한카드 신한 S-choice</div>
									<div
										style="color: #FDE4E1; text-align: left; padding-left: 15%;">blah
										blah blah</div>
								</c:forEach>
							</div>

							<div
								style="width: 50%; min-height: 716px; display: inline-block;">
								<b><span id="age_area">${ age_group }</span> 대 관심 혜택 TOP 10</b>
								<c:forEach begin="1" end="10" varStatus="status">
									<div style="height: 30px; clear: both;"></div>
									<div style="width: 100%; text-align: left; padding-left: 15%;">
										<div id="rank_num"
											style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index}</div>
										<div id="rank_name"
											style="color: #7b7b7b; display: inline-block;">통신통신</div>
									</div>
								</c:forEach>
							</div>

						</div>
						<div style="height: 100px; clear: both;"></div>
					</div>

					<!-- 사업자 브랜드 카드의 추천받은 통계 -->
					<div id="brand_card_area"
						style="background: #F9E6AC; width: 100%; min-height: 716px;">
						<div class="container">

							<div style="height: 100px; clear: both;"></div>

							<div id="brand_card_title"
								style="width: 100%; text-align: center; font-size: 30pt; color: black;">
								<b>하나카드 추천 통계</b>
							</div>

							<div style="height: 20px; clear: both;"></div>

							<div id="brand_card_title_content"
								style="width: 100%; text-align: center; color: black;">
								하나카드를 추천받은 Good Card 회원의 관심 혜택 정보입니다.</div>

							<div style="height: 50px; clear: both;"></div>

							<div style="width: 100%; min-height: 712px; background: #F6F8FC;">
								<div
									style="width: 70%; border-right: 1px solid #F9E6AC; min-height: 712px; float: left; display: inline-block;">
									graph 영역</div>
								<div
									style="width: 30%; min-height: 712px; display: inline-block;">
									<div
										style="width: 100%; min-height: 178px; border-bottom: 1px solid #F9E6AC;">
									</div>
									<div
										style="width: 100%; height: 178px; border-bottom: 1px solid #F9E6AC;">
									</div>
									<div
										style="width: 100%; height: 178px; border-bottom: 1px solid #F9E6AC;">
									</div>
									<div style="width: 100%; height: 178px;"></div>
								</div>
							</div>

							<div style="height: 100px; clear: both;"></div>
						</div>

					</div>

					<!-- 카드 상품 설계 도와주는 View -->
					<div id="card_make_area"
						style="width: 100%; min-height: 716px; background: #80C5BF">
						<div class="container">
							<div style="height: 100px; clear: both;"></div>

							<div
								style="width: 100%; text-align: center; font-size: 30pt; color: white;">
								<b>카드 상품 설계</b>
							</div>

							<div style="height: 20px; clear: both;"></div>

							<div style="width: 100%; text-align: center; color: white;">
								연령, 혜택 정보를 선택하시면 유사한 카드 정보를 제공해드립니다.</div>

							<div style="height: 50px; clear: both;"></div>

							<div
								style="width: 50%; margin: 0px 25%; border: 1px solid white; text-align: center; border-radius: 1em; padding: 0.3% 0px; color: white;">
								연령을 선택하세요
								<div
									style="float: right; color: white; padding-right: 5%; padding-top: 1%">
									<i id="selectAgeGroup" class="fa fa-chevron-down click"
										aria-hidden="true"></i>
								</div>
							</div>

							<div style="height: 30px; clear: both;"></div>

							<div
								style="width: 50%; margin: 0px 25%; border: 1px solid white; text-align: center; border-radius: 1em; padding: 0.3% 0px; color: white;">
								혜택을 선택하세요
								<div
									style="float: right; color: white; padding-right: 5%; padding-top: 1%">
									<i id="selectBenefitGroup" class="fa fa-chevron-down click"
										aria-hidden="true"></i>
								</div>
							</div>

							<div style="height: 50px; clear: both;"></div>

							<div style="width: 100%; min-height: 712px; background: #F6F8FC;">
								<c:choose>
									<c:when test="${ not empty benefitCardList }">

									</c:when>
									<c:otherwise>
										<div style="height: 286px; clear: both;"></div>
										<div style="text-align: center; color: #7b7b7b;">유사 카드가
											존재하지 않습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>

							<div style="height: 100px; clear: both;"></div>
						</div>

					</div>
				</div>

			</div>
			<div style="width: 100%; height: 168px;">
				<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" /></div>
		</div>
	</div>
	<div style="height: 0px; clear: both;"></div>
</body>
</html>