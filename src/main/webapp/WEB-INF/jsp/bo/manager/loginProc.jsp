<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<un:useConstants var="LoginState" className="common.code.LoginState" />
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<%@ include file="/WEB-INF/jsp/bo/include/noBack.jsp"%>
<body class="page-login" data-menu_group="manager" data-menu_subclass="login">
    <!-- body class, 중요 -->
    <form id="frm" name="frm" method="post">
        <input type="hidden" id="clearDormancy" name="clearDormancy" value="<c:out value="${commandMap.clearDormancy}"/>">
    </form>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            <c:choose>
                <c:when test="${manager.LOGIN_STATE_CODE eq LoginState.LOGIN_SUCCESS }">
                    $("#frm").postSubmit($.action.main());
                </c:when>
                <c:when test="${manager.LOGIN_STATE_CODE eq LoginState.LOGIN_ACCREDIT_FAIL }">
                    alertify.set({ labels: {ok     : "휴면해제",cancel : "취소"} });
                    alertify.confirm("90일 이상 장기 미접속으로 계정이 잠금되었습니다.<br>안전한 사용을 위해 휴면해제 후 재로그인 해주세요",
                    function(e){
                        if(e) {
                            alertify.success('휴면해제');
                            $("#clearDormancy").val("True");
                            $("#frm").postSubmit($.action.main());
                        } else {
                            alertify.error('취소');
                            $("#frm").postSubmit($.action.main());
                        }

                    });
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