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
		<div style="float: right; font-size: 12pt;">
			<span><b>${ loginUser.id }</b> 님 환영합니다</span>
			<span style="margin:0px 10px;"></span>
			<span><a href="${ pageContext.request.contextPath }/member/logout.do" style="color: #0085a1;">로그아웃</a></span>
	</div>
	</div>
	
</nav>

<div style="height: 80px; clear: both;"></div>