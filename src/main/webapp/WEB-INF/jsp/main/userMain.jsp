<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Good Card - 최고의 카드를 찾는 방법</title>


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
<script type="text/javascript">
	function goLoginPage() {
		alert('로그인해주세요.');
		location.replace("${context}/member/login.do");
	}
</script>

<style type="text/css">
a.hover-option:hover {
	color: #0085a1;
}
</style>

</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="${ pageContext.request.contextPath }">Good Card</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">


				<li class="nav-item"><a class="nav-link hover-option"
					href="${ pageContext.request.contextPath }/recommend/poll.do">내게
						맞는 카드 찾기</a></li>
				<li class="nav-item"><a class="nav-link hover-option"
					href="${ pageContext.request.contextPath }/credit.do?pageNo=1">신용카드</a>
				</li>
				<li class="nav-item"><a class="nav-link hover-option"
					href="${ pageContext.request.contextPath }/check.do?pageNo=1">체크카드</a></li>
				<c:choose>
					<c:when test="${not empty loginUser}">
						<li class="nav-item"><a class="nav-link hover-option"
							href="${ pageContext.request.contextPath }/member/mypage.do">마이페이지</a>
						</li>
						<li class="nav-item"><a class="nav-link hover-option"
							href="${ pageContext.request.contextPath }/member/logout.do">로그아웃</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link hover-option"
							href="${ pageContext.request.contextPath }/member/join.do">회원가입</a>
						</li>
						<li class="nav-item"><a class="nav-link hover-option"
							href="${ pageContext.request.contextPath }/member/login.do">로그인</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	</nav>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('resources/bootstrap/img/home-bg.jpg')">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>Good Card</h1>
					<span class="subheading">최적의 카드를 추천 해드립니다.</span> <br> <br>
					<a href="${ pageContext.request.contextPath }/recommend/poll.do"
						class="recommend_path_button" style="padding: 10px 10px">내게 맞는
						카드 찾기 >></a>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">Man must explore, and this is
							exploration at its greatest</h2>
						<h3 class="post-subtitle">Problems look mighty small from 150
							miles up</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on September 24, 2017
					</p>
				</div>
				<hr>
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">I believe every human has a finite
							number of heartbeats. I don't intend to waste any of mine.</h2>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on September 18, 2017
					</p>
				</div>
				<hr>
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">Science has not yet mastered prophecy
						</h2>
						<h3 class="post-subtitle">We predict too much for the next
							year and yet far too little for the next ten.</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on August 24, 2017
					</p>
				</div>
				<hr>
				<div class="post-preview">
					<a href="post.html">
						<h2 class="post-title">Failure is not an option</h2>
						<h3 class="post-subtitle">Many say exploration is part of our
							destiny, but it’s actually our duty to future generations.</h3>
					</a>
					<p class="post-meta">
						Posted by <a href="#">Start Bootstrap</a> on July 8, 2017
					</p>
				</div>
				<hr>
				<!-- Pager -->
				<div class="clearfix">
					<a class="btn btn-secondary float-right" href="#">Older Posts
						&rarr;</a>
				</div>
			</div>
		</div>
	</div>

	<hr>

	<!-- Footer -->

	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />


	<!-- Bootstrap core JavaScript -->
	<script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script src="resources/bootstrap/vendor/popper/popper.min.js"></script>
	<script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="resources/bootstrap/js/clean-blog.min.js"></script>

</body>
</html>