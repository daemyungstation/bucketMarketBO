<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<un:useConstants var="LoginState" className="common.code.LoginState" />
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/bo/include/noBack.jsp"%>
<body class="page-login" data-menu_group="manager" data-menu_subclass="login">
    <!-- body class, 중요 -->
    <form id="frm" name="frm" method="post"></form>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            <c:choose>
                <c:when test="${manager.LOGIN_STATE_CODE eq LoginState.LOGIN_SUCCESS }">
                    $("#frm").postSubmit($.action.main());
                </c:when>
                <c:when test="${manager.LOGIN_STATE_CODE eq LoginState.LOGIN_ACCREDIT_FAIL }">
                    alert("인증번호 확인 후 다시 시도해 주세요.");
                    $("#frm").postSubmit($.action.accredit());
                </c:when>
                <c:when test="${manager.LOGIN_STATE_CODE eq LoginState.LOGIN_LIMIT_IP }">
                    alert("허용되지 않은 아이피 접근입니다. 관리자에게 문의하세요.");
                    $("#frm").postSubmit($.action.main());
                </c:when>                
                <c:otherwise>
                    alert("사용권한이 없거나, 계정정보가 일치하지 않습니다..");
                    $("#frm").postSubmit($.action.main());
                </c:otherwise>
            </c:choose>
        });
    </script>
</body>
</html>