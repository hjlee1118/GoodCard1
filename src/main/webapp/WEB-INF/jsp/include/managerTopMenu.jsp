<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="context" value="${pageContext.request.contextPath }" />

<script type="text/javascript">
	function goLoginPage(){
		alert('로그인해주세요.');
		location.replace("${context}/member/login.do");
	}
</script>

<nav class="navbar navbar-expand-lg navbar-light fixed-top"
	id="topMenuMainNav" style="background-image: #E8E8E4">
	<div class="container">
		<a class="navbar-brand" href="${ pageContext.request.contextPath }">Good
			Card</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/recommend/poll.do">통계 자료</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/card/creditcard.do">마케팅 전략 추천</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/card/checkcard.do">카드 상품 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/member/mypage.do">이벤트 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/member/logout.do">로그아웃</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div style="height: 80px; clear: both;"></div>