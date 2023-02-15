<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="isLoginPage" value="true"/>
    <%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="page-login" data-menu_group="manager" data-menu_subclass="login">
    <header class="area-header">
        <div class="contain-header">
            <h1><img src="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc-admin/dm-img/img_logo_admin.png" alt="대명아임레디" /></h1>
        </div>
    </header>
    <div class="area-body">
        <div class="contain-admin-login">
            <div class="box-main-title">
                <p class="login-title-blue"><c:out value="${path eq 'scm' ? 'SCM' : 'ADMIN' }"/> LOGIN</p>
                <p class="login-totle-text">환영합니다.<br />본 시스템은 대명 다이렉트 가입몰 <span class="text-point1"><c:out value="${path eq 'scm' ? '제휴업체' : '통합' }"/>관리 시스템</span>입니다.</p>
            </div>
            <div class="box-main-login">
                    <form name="frm" id="frm">
                        <label class="form-checkbox <c:if test="${not empty commandMap.ADM_MST_ID }">checked</c:if>"><input type="checkbox" name="SAVE_ID" id="SAVE_ID" value="Y" <c:if test="${not empty commandMap.ADM_MST_ID }">checked="checked"</c:if>>아이디 저장</label>
                        <div class="box-form">
                            <input type="text" name="ADM_MST_ID" id="ADM_MST_ID" value="<c:out value="${commandMap.ADM_MST_ID }"/>" placeholder="아이디" maxlength="10" />
                            <input type="password" name="ADM_MST_PWD" id="ADM_MST_PWD" placeholder="비밀번호" maxlength="10" />
                        </div>
                    </form>
                    <span class="btn-type-text1"><button onclick="goLogin();">LOGIN</button></span>
            </div>
            <div class="box-main-text">본 시스템은 계정승인 된 관계자에 2차 인증을 통해서만 로그인 가능하며, 불법적인 접근 및 사용시 관계법규에 의해 처벌될 수 있습니다.<br />본 시스템을 통해 습득한 개인정보를 무단으로 외부에 유출한 경우, 5년 이하의 징역 또는 4천만원 이하의 벌금에 처해질 수 있습니다.<p class="box-law">처벌근거: 정보통신망법 제 71조, 개인정보보호법 제 71조<br />본 시스템의 보안등급 3 (최고등급. Very High)</p>이용 중 문의사항은 관리자 (<a href="mailto:help@daemyungsono.com">help@daemyungsono.com</a>) 에게 메일을 보내주시기 바랍니다.</div>
        </div>
    </div>
    <footer class="area-footer">
        <div class="area-inner">
            <p class="text-copyright">Copyright © DAEMYUNGSTATION.CO.LTD. All rights reserved.</p>
        </div>
    </footer>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.common.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/backoffice.action.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.validate.js"></script>
    <script>
        $(function() {
            <%-- 로그인 이차인증 유효시간 초기화 --%>
            sessionStorage.removeItem("loginAccreditStartDate");
            sessionStorage.removeItem("loginAccreditRemainDate");
            
            var $frm = $("#frm");
            <%-- 폼체크 --%> 
            $frm.validate({
                rules : {
                    ADM_MST_ID : {
                        required : true
                    },
                    ADM_MST_PWD : {
                        required : true
                    }
                },
                messages : {
                    ADM_MST_ID : {
                        required : "아이디를 입력해주시기 바랍니다."
                    }, // 아이디
                    ADM_MST_PWD : {
                        required : "비밀번호를 입력해주시기 바랍니다."
                    }
                }
            });
            <%-- 아이디 엔터 이벤트 --%>
            $("#ADM_MST_ID").on("keydown", function(e) {
                if (e.keyCode == 13) {
                    goLogin();
                    return false;
                }
            });
            <%-- 비밀번호 엔터 이벤트  --%>
            $("#ADM_MST_PWD").on("keydown", function(e) {
                if (e.keyCode == 13) {
                    goLogin();
                    return false;
                }
            });
            <%-- 로그인  --%>
            goLogin = function() {
                if ($frm.valid()) {
                    $frm.postSubmit($.action.proc());
                }
            };
            
        });
    //-->
    </script>
</body>
</html>