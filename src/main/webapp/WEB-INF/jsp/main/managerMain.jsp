<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

#service_link {
	border: 1px solid #7b7b7b;
	color: #7b7b7b;
	padding: 1%;
}

#service_link>a {
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
	color: #F47264;
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
				style="background: #f3f3f3; height: 500px;">
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
						수 있습니다.
					</div>
					<div style="height: 30px; clear: both;"></div>
					<div style="color: #7b7b7b; width: 100%; text-align: center;">
						<b>이용 가능한 서비스</b>
						<div style="height: 20px; clear: both;"></div>
						<span id="service_link"><a href="#"># 추천 키워드 통계</a></span> <span
							style="padding: 0px 5px;"></span> <span id="service_link"><a
							href="#"># 연령대별 비교 통계</a></span> <span style="padding: 0px 5px;"></span>
						<span id="service_link"><a href="#"># 하나카드 추천 통계</a></span>
					</div>
					<div style="height: 100px; clear: both;"></div>
				</div>
			</div>

			<!-- 추천 키워드 통계 -->
			<div id="recommend_keyword_area" class="area_form"
				style="background: #7DC7EE;">
				<div class="container">
					<div style="height: 100px; clear: both;"></div>
					<div id="recommend_keyword_title"
						style="width: 100%; text-align: center; font-size: 30pt; color: white;">
						<b>추천 키워드 통계</b>
					</div>
					<div style="height: 20px; clear: both;"></div>
					<div id="recommend_keyword_title_content"
						style="color: #7b7b7b; width: 100%; text-align: center; color: white;">
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
							style="color: #7b7b7b; width: 100%; text-align: center; color: white;">
							GoodCard 고객 연령대별 관심 혜택, 카드 정보를 확인 할 수 있습니다.</div>
						<div style="height: 50px; clear: both;"></div>
						<div
							style="background: #F6F8FC; width: 100%; min-height: 716px; text-align: center;">
							<div style="height: 50px; clear: both;"></div>

							<c:set var="age_group" value="20"></c:set>

							<span> <i id="${age_group - 10}"
								class="fa fa-chevron-left click" aria-hidden="true"
								onclick="minusAge(this)"></i>
							</span> <span style="padding: 0px 10px; font-size: 16pt;"><b>${age_group}
									대</b></span> <span> <i id="${age_group + 10}"
								class="fa fa-chevron-right click" aria-hidden="true"
								onclick="plusAge(this)"></i>
							</span>

							<div style="height: 30px; clear: both;"></div>

							<div style="width: 50%; min-height: 716px; display: inline-block; float: left;">
								<b><span id="age_area">${ age_group }</span> 대 인기 카드 TOP 5</b>
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 15%;">

								</div>
							</div>

							<div
								style="width: 50%; min-height: 716px; display: inline-block;">
								<b><span id="age_area">${ age_group }</span> 대 관심 혜택 TOP 10</b>
							</div>

						</div>
						<div style="height: 100px; clear: both;"></div>
					</div>

					<!-- 사업자 브랜드 카드의 추천받은 통계 -->

				</div>
			</div>
			<%-- <jsp:include page="/WEB-INF/jsp/include/bottom.jsp" /> --%>
</body>
</html>