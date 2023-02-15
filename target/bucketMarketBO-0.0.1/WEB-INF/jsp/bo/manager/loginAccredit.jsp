<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="isLoginPage" value="true"/>
    <%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
    <%@ include file="/WEB-INF/jsp/bo/include/noBack.jsp"%>
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
                <p class="login-title-blue"><c:out value="${isScm ? 'SCM' : 'ADMIN' }"/> LOGIN</p>
                <p class="login-totle-text">환영합니다.<br />본 시스템은 대명 다이렉트 가입몰 <span class="text-point1"><c:out value="${isScm ? '제휴업체' : '통합' }"/>관리 시스템</span>입니다.</p>
            </div>
            <form id="naviForm" name="naviForm"></form>
            <form id="frm" name="frm" method="post" onsubmit="return false;">
                <div class="box-main-login">
                    <div class="box-form">
                        <input type="text" name="ADM_MST_RND" id="ADM_MST_RND" value="<c:out value="${ADM_MST_RND }"/>" placeholder="인증번호 입력" maxlength="4" />
                        <span class="login_code">
                            <span id="timeBox">03:00</span>
                            <button onclick="goLoginHistoryModify();">인증번호 재전송</button>
                        </span>
                        <span class="btn-type-text1"><button onclick="goLogin();">인증확인</button></span>
                    </div>
                </div>
            </form>
            <div class="box-main-text">본 시스템은 계정승인 된 관계자에 2차 인증을 통해서만 로그인 가능하며, 불법적인 접근 및 사용시 관계법규에 의해 처벌될 수 있습니다.<br />본 시스템을 통해 습득한 개인정보를 무단으로 외부에 유출한 경우, 5년 이하의 징역 또는 4천만원 이하의 벌금에 처해질 수 있습니다.<p class="box-law">처벌근거: 정보통신망법 제 71조, 개인정보보호법 제 71조<br />본 시스템의 보안등급 3 (최고등급. Very High)</p>이용 중 문의사항은 관리자 (<a href="mailto:help@daemyungsono.com">help@daemyungsono.com</a>) 에게 메일을 보내주시기 바랍니다.</div>
        </div>
    </div>
    <footer class="area-footer">
        <div class="area-inner">
            <p class="text-copyright">Copyright © DAEMYUNGSTATION.CO.LTD. All rights reserved.</p>
        </div>
    </footer>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/backoffice.action.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.common.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.validate.js"></script>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.ajax.js"></script>
    <script>
        $(function() {
            var $frm = $("#frm"),
                $naviForm = $("#naviForm"),
                $timeBox = $("#timeBox");
            
            <%-- 폼체크 --%> 
            $frm.validate({
                rules : {
                    ADM_MST_RND : {
                        required : true,
                        number : true
                    }
                },
                messages : {
                    ADM_MST_RND : {
                        required : "인증번호를 입력해주시기 바랍니다.",
                        number : "인증번호는 숫자로 입력해주시기 바랍니다."
                    }
                }
            });
            <%-- 인증번호 엔터 이벤트 --%>
            $("#ADM_MST_RND").on("keydown", function(e) {
                if (e.keyCode == 13) {
                    goLogin();
                    return false;
                }
            });
            <%-- 인증확인  --%>
            goLogin = function() {
                if ($frm.valid()) {
                    $frm.attr("onsubmit", "")
                    $frm.postSubmit($.action.proc());
                }
            };
            var tid,
                stDate = sessionStorage.getItem("loginAccreditStartDate"),
                remainDate = sessionStorage.getItem("loginAccreditRemainDate");
            <%-- 인증번호 재발송  --%>
            goLoginHistoryModify = function() {
                $.postSyncJsonAjax($.action.ajax("HistoryModify"), {}, function(data) {
                    if (data.isLogin) {
                        if (data.isSuccess) {
                            clearDate();
                            setTimer();
                            $frm.find("input[name='ADM_MST_RND']").val(data.ADM_MST_RND);
                        }
                    } else {
                        clearInterval(tid); // 타이머 해제
                        clearDate(); // 인증시간 초기화
                        $naviForm.postSubmit($.action.main());
                    }
                });
            };
            <%-- 인증시간 초기화 --%>
            clearDate = function () {
                stDate = null;
                remainDate = null;
                sessionStorage.removeItem("loginAccreditStartDate");
                sessionStorage.removeItem("loginAccreditRemainDate");
            };
            <%-- 인증시간 초기 설정  --%>
            setTimer = function () {
                if (typeof(tid) != "undefiend") {
                    clearInterval(tid); // 타이머 해제
                }
                tid = setInterval("timeMsg()", 1000);
                stDate = ((stDate == null || typeof(stDate) == "undefined") ? new Date().getTime() : stDate);
                remainDate = (remainDate == null || typeof(remainDate) == "undefined" ? (stDate + (1000 * 60 * <spring:eval expression="@resource['accredit.alive.time']"/>)) - stDate : remainDate);
                sessionStorage.setItem("stDate", stDate);
            }
            <%-- 인증시간 타이머 처리  --%>
            timeMsg = function() {
                var miniutes = Math.floor((remainDate % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((remainDate % (1000 * 60)) / 1000);
                $timeBox.text("0" + miniutes + ":" + (seconds < 10 ? "0" : "") + seconds); // 남은 시간 text형태로 변경
                if (remainDate <= 0) { // 시간이 종료 되었으면
                    clearInterval(tid); // 타이머 해제
                    clearDate(); // 인증시간 초기화
                    $naviForm.postSubmit($.action.main());
                } else {
                    remainDate = remainDate - 1000; // 남은시간 -1초
                    sessionStorage.setItem("loginAccreditRemainDate", remainDate);
                }
            };
            setTimer();
            var initMiniutes = Math.floor((remainDate % (1000 * 60 * 60)) / (1000 * 60));
            var initSeconds = Math.floor((remainDate % (1000 * 60)) / 1000);
            $timeBox.text("0" + initMiniutes + ":" + (initSeconds < 10 ? "0" : "") + initSeconds);
        });
    </script>
</body>
</html>