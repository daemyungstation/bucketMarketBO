<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<style type="text/css">
<!--
.page-error {
    margin: 0; 
    padding: 0;
    background-color: #fff;
}
.page-error h1 { margin: 0; padding: 0; text-align: center; }
.page-error h1 strong { display: block; font-family: georgia; font-size: 60px; font-weight: bold; letter-spacing: -1px; }
.page-error .message { display: table; width: 100%; height: 100%; }
.page-error .message .inner { display: table-cell; vertical-align: middle; text-align: center; }
-->
</style>
</head>
<body class="page-error"><!-- body class, 중요 -->
<div class="message">
    <div class="inner">
        <h1>
            <strong>404</strong>
            <span>error</span>
        </h1>
        <p>요청하신 페이지를 찾을 수 없습니다.</p>
        <a href="<spring:eval expression="@resource['server.ssl.domain']"/>"><span>메인으로 돌아가기</span></a>
    </div>
</div>
</body>
</html>
