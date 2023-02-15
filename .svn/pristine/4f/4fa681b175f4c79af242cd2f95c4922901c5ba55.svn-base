<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    /**
     * 전역 변수 설정
     * $.params 배열을 전역 변수로 사용합니다.
     * upleat.base-0.3.js / ui.js 외 기타 모든 플러그인에서 사용됩니다.
     */
    $.params = ($.params !== undefined) ? $.params : [];
    $.params.domain = "/resources";
    $.params.domain = (typeof $.params.domain !== "undefined") ? $.params.domain : "..";
    $.params.STR = (typeof $.params.STR !== "undefined") ? $.params.STR : []; // 문자열
    $.params.nav = (typeof $.params.nav !== "undefined") ? $.params.nav : [ null, null ];
    <c:if test="${not empty authMenu}">
    // nav 활성화
    var currUrl = location.href;
    if (currUrl.indexOf("dashboardMain") >= 0) {
        $.params.nav = [ 0 ];
    } else {
        $.params.nav = [ <c:out value="${navi1Depth}" />, <c:out value="${navi2Depth}" />, <c:out value="${navi3Depth}" /> ];
    }
    $.params.tree = <c:out value="${authMenu}" escapeXml="fales"/>;
    </c:if>
</script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/upleat.base-0.3.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/jquery.menu-aim.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/nanobar.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/alertify.custom-0.3.11.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/Chart.bundle.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/cleave.min.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/upleat.helper.notify-0.1.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/upleat.modalr-0.1.js"></script>
<!-- run -->
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/ui.nav.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/ui.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/backoffice.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/backoffice.action.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.common.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.validate.js"></script>
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/common/jquery.ajax.js"></script>
<!-- common -->
<script>
$(function () {
    var csrf = $.common.csrf.get();
    sessionStorage.setItem("csrfName", csrf.name);
    sessionStorage.setItem("csrfValue", csrf.value);
});
</script>