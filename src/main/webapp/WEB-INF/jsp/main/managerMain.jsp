<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

@font-face{
	font-family:'HanaFont';
	src: url('resources/custom/fonts/HanaL.ttf');
}

html, body{
	width: 100%;
	height: 100%;
}

.manager-main{
	width: 100%;
	height: 100%;
	font-family: 'HanaFont' !important;
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
		<div class="section-wrapper"
			style="height: 70%;">
			<div class="container">
				관리자용 페이지				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/include/bottom.jsp" />
</body>
</html>