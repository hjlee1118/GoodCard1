<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${resultCardList}" var="list" varStatus="status">

		<div style="display: inline-block; height: 100%; padding-top: 2.4%; float: left; width: 50%;">
			${list.brand}
			<div
				style="color: black; padding: 10px 0px; font-size: 15pt; display: inherit;">
				<b>${list.cardName}</b>
			</div>
		</div>
		
	</c:forEach>
</body>
</html>