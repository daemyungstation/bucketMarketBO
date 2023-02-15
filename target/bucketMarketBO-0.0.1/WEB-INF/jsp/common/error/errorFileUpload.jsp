<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body>
    <script type="text/javascript">
        alert("<c:out value="${exception.message}"/>");
        history.go(-1);
    </script>
</body>
</html>
