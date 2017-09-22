<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

if("${loginUser.type}" === "O"){
	location.href = "manage.do";
} else {
	location.href ="home.do";
}

</script>