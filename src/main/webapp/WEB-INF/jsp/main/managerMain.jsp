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
<script src="${context}/resources/custom/js/creditList.js"></script>

<script type="text/javascript">
	$(function() {

		$('#search_button')
				.click(
						function() {
							var array = [];
							var index = 0;
							var i = 20;
							var age = 0;

							var gender = -1;

							while (i <= 50) {
								var test_id = '#ageGroup_' + i;
								if ($(test_id).attr('class') == 'selected') {
									age = i;
									array[index] = age;
									index++;
									break;
								}
								i = i + 10;
							}

							if (age == 0) {
								alert('나이를 입력해주세요.');
								return;
							}

							if ($('#gender_both').attr('class') == 'selected') {
								gender = 0;
							}
							if ($('#gender_men').attr('class') == 'selected') {
								gender = 1;
							}
							if ($('#gender_women').attr('class') == 'selected') {
								gender = 2;
							}

							if (gender == -1) {
								alert('성별을 선택하세요.');
								return;
							} else {
								array[index] = gender;
								index++;
							}

							var cnt = 0;

							for (var i = 0; i <= 16; i++) {
								var checked_id = '#' + i;
								var checked_class = $(checked_id).attr('class');
								if (checked_class == 'selected') {
									array[index] = i;
									index++;
									cnt++;
								}
							}

							if (cnt == 0) {
								alert('혜택을 입력해주세요.');
							}

							$.ajax({
									type : "POST",
									url : "${context}/getBestCardByCondition.do",
									data : {
										myArray : array
									},
									success : function(creditCardList) {

										var str = '';
										
										$('#searchResultArea').empty();

										if (creditCardList.length == 0) {
											str += '<div style="height: 286px; clear: both;"></div>';
											str += '<div style="text-align: center; color: #7b7b7b;">유사 카드가 존재하지 않습니다.</div>';
										}
										else {
											
											var i = 0;
											
											var modal_str = '';
											
											while(i < 4){
												
												str += '<div style="height: 0px; clear: both;"></div>';
												
												if(i == parseInt(creditCardList.length)-1){
													str += '<div style="width: 100%; height: 178px;">';
												}
												else{
													str += '<div style="width: 100%; height: 178px; border-bottom: 1px solid #E0E0E0;">';
												}
												str += '<div style="height: 100%; float: left; padding: 5%;">';
												str += '<b style="font-size: 20pt; color: #0085a1; font-family: "Nanum Gothic", serif;">' + (parseInt(i) + 1) + '</b></div>';
												
												var fileImagePath = "url('" + "${context}/resources/cardImage/"+creditCardList[i].imagePath + "');";

												str += '<div class="card-image-area" style="margin: 3% 0px; height: 100px; width:200px; background: '+ fileImagePath +' background-size: contain;	background-repeat: no-repeat;">';
												str += '</div>';

												str += '<div style="display: inline-block; height: 100%; padding-top: 3%; padding-left: 2.4%; float: left; width: 50%;">'+creditCardList[i].brand;
													
												str += '<div style="color: black; padding: 10px 0px; font-size: 15pt; display: inherit;">';
												str += '<b>'+creditCardList[i].cardName+'</b>';
												str += '<div style="color: #0085a1; margin-top: 1%; text-align: left; width: 500px; font-size:12pt; padding-top: 2%">'+'" '+creditCardList[i].annotation+' "</div>'
												str += '</div></div>';

												str += '<div style="display: inline-block; float: right; margin-top: 3%; margin-right: 3%;">';
												str += '<span style="text-align: center;" class="card-detail-button">';
												str += '<a href="#open'+(parseInt(i) + 1) +'" class="card-detail-button" style="color: #0085a1;">상세 보기</a>';
												str += '</span> <span class="card-homepage-button" style="text-align: center;">홈페이지</span>';
												str += '</div></div>';
												
												i++;
											}
																																

										}
										$('#searchResultArea').append(str);
										
									},
										error : function(xhr, status, error) {
										}
									});

						});

	});
	function checkedAge(id) {
		var inputId = '#' + id.getAttribute('id');
		var class_name = $(id).attr('class');

		if (class_name == 'selected') {
			$(id).attr('class', 'not-selected');
		} else {
			$(id).attr('class', 'selected');
			var i = 20;
			while (i <= 50) {
				var test_id = '#ageGroup_' + i;
				if (test_id != inputId) {
					$(test_id).attr('class', 'not-selected');
				}
				i = i + 10;
			}

		}
	}

	function checkedGender(id) {
		var inputId = '#' + id.getAttribute('id');
		var class_name = $(id).attr('class');

		if (class_name == 'selected') {
			$(id).attr('class', 'not-selected');
		} else {
			$(id).attr('class', 'selected');

			if (inputId != '#gender_both') {
				$('#gender_both').attr('class', 'not-selected');
			}

			if (inputId != '#gender_men') {
				$('#gender_men').attr('class', 'not-selected');
			}

			if (inputId != '#gender_women') {
				$('#gender_women').attr('class', 'not-selected');
			}
		}
	}

	function checkedToggle(id) {
		var icon_id = '#checked_' + id;
		var class_name = $(icon_id).attr('class');
		id = '#' + id;
		if (class_name == 'fa fa-square') {

			var cnt = 0;

			for (var i = 0; i <= 16; i++) {
				var checked_id = '#' + i;
				var checked_class = $(checked_id).attr('class');
				if (checked_class == 'selected') {
					cnt++;
				}
			}
			if (cnt < 3) {
				$(icon_id).attr('class', 'fa fa-check-square');
				$(id).attr('class', 'selected');
			} else {
				alert('최대 3개까지 선택 가능합니다.');
			}
		} else {
			$(icon_id).attr('class', 'fa fa-square');
			$(id).attr('class', 'not-selected');
		}
	}

	function minusAge() {
		var value = parseInt(document.getElementById('ageGroup0').innerHTML) - 10;

		if (value > 0) {
			document.getElementById('ageGroup0').innerHTML = value;
			document.getElementById('ageGroup1').innerHTML = value;
			document.getElementById('ageGroup2').innerHTML = value;

			var inputAge = {
				'inputAge' : value
			};

			$
					.ajax({
						type : "POST",
						url : "${context}/getBestBenefitByAge.do",
						data : inputAge,
						dataType : 'json',
						success : function(ageBenefitList1) {
							$('#ageBenefitListArea_forEach_sub').empty();

							<c:forEach begin="0" end="9" varStatus="status">

							/* $('#ageBenefitListArea_forEach_sub').append('<div style="width: 100%; text-align: left; padding-left: 15%;"><div id="rank_num"	style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div><div id="rank_name" style="color: #7b7b7b; display: inline-block;">${list}</div></div><div style="height: 30px; clear: both;"></div>');
							 */
							$('#ageBenefitListArea_forEach_sub')
									.append(
											'<div style="width: 100%; text-align: left; padding-left: 15%;"><div id="rank_num"	style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div><div id="rank_name" style="color: #7b7b7b; display: inline-block;">'
													+ ageBenefitList1['${status.index}']
													+ '</div></div><div style="height: 30px; clear: both;"></div>');

							</c:forEach>

						},
						error : function(xhr, status, error) {
						}
					});
		} else {
			alert('시작 페이지 입니다.')
		}
	}

	function plusAge() {
		var value = parseInt(document.getElementById('ageGroup0').innerHTML) + 10;
		if (value < 60) {
			document.getElementById('ageGroup0').innerHTML = value;
			document.getElementById('ageGroup1').innerHTML = value;
			document.getElementById('ageGroup2').innerHTML = value;

			var inputAge = {
				'inputAge' : value
			};

			$
					.ajax({
						type : "POST",
						url : "${context}/getBestBenefitByAge.do",
						data : inputAge,
						dataType : 'json',
						success : function(ageBenefitList1) {
							$('#ageBenefitListArea_forEach_sub').empty();

							<c:forEach begin="0" end="9" varStatus="status">

							/* $('#ageBenefitListArea_forEach_sub').append('<div style="width: 100%; text-align: left; padding-left: 15%;"><div id="rank_num"	style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div><div id="rank_name" style="color: #7b7b7b; display: inline-block;">${list}</div></div><div style="height: 30px; clear: both;"></div>');
							 */

							$('#ageBenefitListArea_forEach_sub')
									.append(
											'<div style="width: 100%; text-align: left; padding-left: 15%;"><div id="rank_num"	style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div><div id="rank_name" style="color: #7b7b7b; display: inline-block;">'
													+ ageBenefitList1['${status.index}']
													+ '</div></div><div style="height: 30px; clear: both;"></div>');
							</c:forEach>

						},
						error : function(xhr, status, error) {
						}
					});
		} else {
			alert('마지막 페이지 입니다.')
		}
	}

	function goPage(id) {

		var target_id = id;
		$('body, html').css('scrollTop', $(target_id).offset().top);
		$('body, html').animate({
			scrollTop : $(target_id).offset().top
		}, 1000);
		window.scrollTo(0, $(target_id).offset().top);

	}

	$(document).ready(function() {
		enableSelectBoxes();
	});

	function enableSelectBoxes() {
		$('div.selectBox').each(
				function() {
					$(this).children('span.selected').html(
							$(this).children('div.selectOptions').children(
									'span.selectOption:first').html());
					$(this).attr(
							'value',
							$(this).children('div.selectOptions').children(
									'span.selectOption:first').attr('value'));

					$(this).children('span.selected,span.selectArrow')
							.click(
									function() {
										if ($(this).parent().children(
												'div.selectOptions').css(
												'display') == 'none') {
											$(this).parent().children(
													'div.selectOptions').css(
													'display', 'block');
										} else {
											$(this).parent().children(
													'div.selectOptions').css(
													'display', 'none');
										}
									});

					$(this).find('span.selectOption').click(
							function() {
								$(this).parent().css('display', 'none');
								$(this).closest('div.selectBox').attr('value',
										$(this).attr('value'));
								$(this).parent().siblings('span.selected')
										.html($(this).html());
							});
				});
	}
</script>
<link href="${context}/resources/custom/css/creditList.css?ver=4"
	rel="stylesheet">
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
	display: inline-block;
	min-height: 716px;
	background: #f6f8fc;
	padding-top: 50px;
}

i.click {
	cursor: pointer;
}

div.selectBox {
	position: relative;
	display: inline-block;
	cursor: default;
	text-align: left;
	line-height: 30px;
	clear: both;
	color: #888;
}

span.selected {
	width: 167px;
	text-indent: 20px;
	border: 1px solid #ccc;
	border-right: none;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	background: #f6f6f6;
	overflow: hidden;
}

span.selectArrow {
	width: 30px;
	border: 1px solid #60abf8;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	text-align: center;
	font-size: 20px;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	user-select: none;
	background: #4096ee;
}

span.selectArrow, span.selected {
	position: relative;
	float: left;
	height: 30px;
	z-index: 1;
}

div.selectOptions {
	position: absolute;
	top: 28px;
	left: 0;
	width: 198px;
	border: 1px solid #ccc;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	overflow: hidden;
	background: #f6f6f6;
	padding-top: 2px;
	display: none;
}

span.selectOption {
	display: block;
	width: 80%;
	line-height: 20px;
	padding: 5px 10%;
}

span.selectOption:hover {
	color: #f6f6f6;
	background: #4096ee;
}

div.not-selected {
	width: 24%;
	padding: 2% 0px;
	border-radius: 2em;
	border: 1px solid #42918a;
	background:;
	display: inline-block;
	margin-bottom: 3%;
	color: white;
	cursor: pointer;
}

div.selected {
	border: 1px solid #42918a;
	width: 24%;
	padding: 2% 0px;
	border-radius: 2em;
	background: #42918a;
	display: inline-block;
	margin-bottom: 3%;
	color: white;
	cursor: pointer;
}

div.not-selected:hover {
	background: #42918a;
	color: white;
	font-weight: bold;
	text-decoration: underline !important;
}

div.selected:hover {
	background: #42918a;
	color: white;
	font-weight: bold;
	text-decoration: underline !important;
}

div.not-selected:active {
	background: #42918a;
	color: white;
	font-weight: bold;
	text-decoration: underline !important;
}

div.selected:active {
	background: #42918a;
	color: white;
	font-weight: bold;
	text-decoration: underline !important;
}

#search_button {
	cursor: pointer;
	width: 50%;
	margin: 0px 25%;
	border: 1px solid white;
	text-align: center;
	border-radius: 1em;
	padding: 0.3% 0px;
	color: #80C5BF;
	background: white;
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
<link href='http://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- 
	<script type="text/javascript">
		minusAge();
		plusAge();
	</script> -->
	<jsp:include page="/WEB-INF/jsp/include/managerTopMenu.jsp" />
	<div class="manager-main">
		<div class="section-wrapper" style="height: 100%;">

			<!-- title -->
			<div id="statistic" class="area_form" style="background: #f3f3f3;">
				<div class="container">
					<div style="height: 150px; clear: both;"></div>
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
					<div style="height: 150px; clear: both;"></div>
				</div>
			</div>

			<!-- 검색어 순위 통계 -->
			<div id="recommend_keyword_area" class="area_form"
				style="background: #7DC7EE;">
				<div class="container">
					<div style="height: 60px; clear: both;"></div>
					<div id="recommend_keyword_title"
						style="width: 100%; text-align: center; font-size: 30pt; color: white;">
						<b>검색어 순위 통계</b>
					</div>
					<div style="height: 20px; clear: both;"></div>
					<div id="recommend_keyword_title_content"
						style="width: 100%; text-align: center; color: white;">
						GoodCard 카드별, 혜택별 검색어 순위를 확인 할 수 있습니다.</div>
					<div style="height: 50px; clear: both;"></div>
					<div style="width: 100%; min-height: 716px; text-align: center;">
						<div style="height: 0px; clear: both;"></div>
						<div class="recommend_keyword_rank"
							style="border-right: 1px solid #dde8f6; width: 30%;">
							<b>신용카드<br/>조회수 TOP 10</b>
							<c:forEach items="${creditCardRank}" var="list" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 5%; font-size: 12pt;">
									<div id="rank_num"
										style="width: 5%; color: #3387DE; font-weight: bold; display: inline-block; padding-right: 1%">${status.index+1}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block; padding-left: 5%;">${list.cardName }</div>
								</div>
							</c:forEach>
						</div>
						<div class="recommend_keyword_rank"
							style="border-right: 1px solid #dde8f6; width: 30%">
							<b>체크카드<br/>조회수 TOP 10</b>
							<c:forEach items="${checkCardRank}" var="list" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 5%; font-size: 12pt;">
									<div id="rank_num"
										style="width: 5%; color: #3387DE; font-weight: bold; display: inline-block; padding-right: 1%;">${status.index+1}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block; padding-left: 5%;">${list.cardName }</div>
								</div>
							</c:forEach>
						</div>
						<div class="recommend_keyword_rank"
							style="border-right: 1px solid #dde8f6; width: 20%;">
							<b>신용카드<br/>인기 혜택</b>
							<c:forEach items="${creditBestBenefitList}" var="list" begin="0"
								end="9" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 5%; font-size: 12pt;">
									<div id="rank_num"
										style="width: 20%; color: #3387DE; font-weight: bold; display: inline-block; font-size: 12pt; padding-right: 1%;">${status.index+1}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block; padding-left: 5%;">${list}</div>
								</div>
							</c:forEach>
						</div>
						<div class="recommend_keyword_rank" style="width: 20%;">
							<b>체크카드<br/>인기 혜택</b>
							<c:forEach items="${checkBestBenefitList}" var="list" begin="0"
								end="9" varStatus="status">
								<div style="height: 30px; clear: both;"></div>
								<div style="width: 100%; text-align: left; padding-left: 5%; font-size: 12pt;">
									<div id="rank_num"
										style="width: 20%; color: #3387DE; font-weight: bold; display: inline-block; padding-right: 1%;">${status.index+1}</div>
									<div id="rank_name"
										style="color: #7b7b7b; display: inline-block; padding-left: 5%;">${list}</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div style="height: 60px; clear: both;"></div>
				</div>

				<!-- 연령대별 비교 -->

				<div id="age_group_area" class="area_form"
					style="background: #F47264;">
					<div class="container">
						<div style="height: 60px; clear: both;"></div>
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

							<span> <i class="fa fa-chevron-left click"
								aria-hidden="true" onclick="minusAge()" style="color: #F47264;"></i>
							</span> <span id="ageGroup0"
								style="padding-left: 10px; font-size: 18pt; font-weight: bold;">20</span>
							<span
								style="padding-right: 10px; font-size: 18pt; font-weight: bold;">대</span>

							<span> <i class="fa fa-chevron-right click"
								aria-hidden="true" onclick="plusAge()" style="color: #F47264;"></i>
							</span>

							<div style="height: 30px; clear: both;"></div>

							<div
								style="border-right: 1px solid #FDE4E1; width: 50%; min-height: 716px; display: inline-block; float: left;">
								<div
									style="width: 100%; font-weight: bold; text-align: center; font-size: 18pt;">
									<span id="ageGroup1"
										style="font-size: 18pt; font-weight: bold;">20</span> 대 인기 카드
									TOP 5
								</div>
								<c:forEach begin="0" end="4" varStatus="status">
									<div style="height: 50px; clear: both;"></div>
									<div
										style="width: 15%; float: left; text-align: left; padding-left: 10%; color: #F47264">
										<b>${status.index+1}</b>
									</div>
									<div
										style="width: 85%; text-align: left; padding-left: 10%; color: #7b7b7b;">
										신한카드 신한 S-choice</div>
									<div
										style="color: #FDE4E1; text-align: left; padding-left: 15%;">blah
										blah blah</div>
								</c:forEach>
							</div>

							<div id="ageBenefitListArea"
								style="width: 50%; min-height: 716px; display: inline-block;">
								<div
									style="width: 100%; font-weight: bold; text-align: center; font-size: 18pt;">
									<span id="ageGroup2"
										style="font-size: 18pt; font-weight: bold;">20</span> 대 관심 혜택
									TOP 10
								</div>
								<div style="height: 50px; clear: both;"></div>

								<div id="ageBenefitListArea_forEach">
									<div id="ageBenefitListArea_forEach_sub">
										<c:forEach items="${ageBenefitList}" var="list" begin="0"
											end="9" varStatus="status">
											<div
												style="width: 100%; text-align: left; padding-left: 15%;">
												<div id="rank_num"
													style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div>
												<div id="rank_name"
													style="color: #7b7b7b; display: inline-block;">${list}</div>
											</div>
											<div style="height: 30px; clear: both;"></div>
										</c:forEach>
									</div>
								</div>
							</div>

						</div>
						<div style="height: 60px; clear: both;"></div>
					</div>

					<!-- 사업자 브랜드 카드의 추천받은 통계 -->
					<div id="brand_card_area"
						style="background: #F9E6AC; width: 100%; min-height: 716px;">
						<div class="container">

							<div style="height: 60px; clear: both;"></div>

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

							<div style="height: 60px; clear: both;"></div>
						</div>

					</div>

					<!-- 카드 상품 설계 도와주는 View -->
					<div id="card_make_area"
						style="width: 100%; min-height: 716px; background: #80C5BF">
						<div class="container">
							<div style="height: 60px; clear: both;"></div>

							<div
								style="width: 100%; text-align: center; font-size: 30pt; color: white;">
								<b>카드 상품 설계</b>
							</div>

							<div style="height: 20px; clear: both;"></div>

							<div style="width: 100%; text-align: center; color: white;">
								연령, 혜택 정보를 선택하시면 유사한 카드 정보를 제공해드립니다.</div>

							<div style="height: 50px; clear: both;"></div>

							<div
								style="width: 50%; padding-left: 1%; margin: 0px 25%; border-bottom: 1px solid white; text-align: left; padding: 0.3% 0px; color: white;">
								<span style="padding-left: 5%;">연령을 선택하세요</span>
							</div>

							<div style="height: 10px; clear: both;"></div>
							<div
								style="width: 50%; padding-left: 1%; margin: 0px 25%; text-align: left; padding: 0px 0.8%; color: white; font-size: 11pt;">*
								연령대는 1개만 선택 가능합니다.</div>
							<div style="height: 10px; clear: both;"></div>
							<div
								style="width: 50%; height: auto; margin: 0px 25%; padding: 0.3% 0px; /*  background: #42918A;  */ color: white; font-size: 12pt;">
								<c:forEach var="age" begin="20" end="50" step="10"
									varStatus="status">
									<div id="ageGroup_${status.index}" class="not-selected"
										onclick="checkedAge(this)">
										<div
											style="width: 100%; left; display: inline-block; text-align: center;">${age}
											대</div>
									</div>
								</c:forEach>
							</div>


							<div style="height: 20px; clear: both;"></div>

							<div
								style="width: 50%; padding-left: 1%; margin: 0px 25%; border-bottom: 1px solid white; text-align: left; padding: 0.3% 0px; color: white;">
								<span style="padding-left: 5%;">성별을 선택하세요</span>
							</div>

							<div style="height: 10px; clear: both;"></div>
							<div
								style="width: 50%; height: auto; margin: 0px 25%; padding: 0.3% 0px; /*  background: #42918A;  */ color: white; font-size: 12pt;">
								<div id="gender_both" class="not-selected"
									onclick="checkedGender(this)">
									<div
										style="width: 100%; left; display: inline-block; text-align: center;">전체</div>
								</div>
								<div id="gender_men" class="not-selected"
									onclick="checkedGender(this)">
									<div
										style="width: 100%; left; display: inline-block; text-align: center;">남자</div>
								</div>
								<div id="gender_women" class="not-selected"
									onclick="checkedGender(this)">
									<div
										style="width: 100%; left; display: inline-block; text-align: center;">여자</div>
								</div>
							</div>


							<div style="height: 20px; clear: both;"></div>

							<div
								style="width: 50%; padding-left: 1%; margin: 0px 25%; border-bottom: 1px solid white; text-align: left; padding: 0.3% 0px; color: white;">
								<span style="padding-left: 5%;">혜택을 선택하세요</span>
							</div>


							<div style="height: 10px; clear: both;"></div>
							<div
								style="width: 50%; padding-left: 1%; margin: 0px 25%; text-align: left; padding: 0px 0.8%; color: white; font-size: 11pt;">*
								혜택은 최대 3개 선택 가능합니다.</div>
							<div style="height: 10px; clear: both;"></div>

							<div
								style="width: 50%; height: auto; margin: 0px 25%; padding: 0.3% 0px; /*  background: #42918A;  */ color: white; font-size: 12pt;">
								<c:forEach items="${ selectBenefitList }" var="list"
									varStatus="status">
									<div id="${status.index}" class="not-selected"
										onclick="checkedToggle('${status.index}')">
										<div
											style="width: 30%; float: left; display: inline-block; padding-top: 1%; padding-left: 10%;">
											<i id="checked_${status.index}" class="fa fa-square"
												aria-hidden="true" checked="" style="cursor: pointer;"></i>
										</div>
										<div style="width: 70%; left; display: inline-block;">${list}</div>
									</div>
								</c:forEach>
							</div>

							<div style="height: 20px; clear: both;"></div>

							<div id="search_button">
								검색
								<div
									style="float: right; color: #80C5BF; padding-right: 5%; padding-top: 1%">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>
							</div>

							<div style="height: 50px; clear: both;"></div>

							<div id="searchResultArea"
								style="width: 100%; min-height: 712px; background: #F6F8FC; font-size: 12pt;">
								
							<div style="height: 0px; clear: both;"></div>
								
								
							<%-- <div style="width: 100%; height: 170px; border-bottom: 1px solid #E0E0E0;">
									<div style="height: 100%; float: left; padding: 5%;">
										<b
											style="font-size: 20pt; color: #0085a1; font-family: 'Nanum Gothic', serif;">1</b>
									</div>

									<div class="card-image-area"
										style="margin: 3% 0px; height: 100px; width:200px; background: url('${context}/resources/cardImage/1.png'); background-size: contain;	background-repeat: no-repeat;">
									</div>

									<div
										style="display: inline-block; height: 100%; padding-top: 3%; padding-left:2.4%; float: left; width: 50%;">
										신한카드
										<div
											style="color: black; padding: 10px 0px; font-size: 15pt; display: inherit;">
											<b>신한 S-choice 카드</b>
										</div>
									</div>

									<div style="display: inline-block; float: right; height: 100%; margin: 3%">
										<span style="text-align: center;" class="card-detail-button">
										<a href="#open" class="card-detail-button" style="color: #0085a1;">상세 보기</a>
										</span>
										<span class="card-homepage-button" style="text-align: center;"> 카드 신청 </span>

									</div>
								</div> --%>
								
								

							</div>
						</div>

						<div style="height: 60px; clear: both;"></div>
					</div>

				</div>
			</div>

		</div>

		<%-- <div style="height: 0px; clear: both;"></div>
		<div style="width: 100%; height: 168px;">
			<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" /></div>
		</div>
	<div style="height: 0px; clear: both;"></div> --%>
</body>
</html>