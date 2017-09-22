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

<style type="text/css">
.nav-link:hover {
	color: #0085a1;
}
</style>

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
					href="${ pageContext.request.contextPath }/recommend/poll.do">내게
						맞는 카드 찾기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/credit.do?pageNo=1">신용카드</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.request.contextPath }/check.do?pageNo=1">체크카드</a></li>
				<c:choose>
					<c:when test="${not empty loginUser}">
						<li class="nav-item"><a class="nav-link"
							href="${ pageContext.request.contextPath }/member/mypage.do">마이페이지</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${ pageContext.request.contextPath }/member/logout.do">로그아웃</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="${ pageContext.request.contextPath }/member/join.do">회원가입</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${ pageContext.request.contextPath }/member/login.do">로그인</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<div style="height: 80px; clear: both;"></div>