<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <%@ include file="/WEB-INF/jsp/bo/include/noBack.jsp"%>
    <c:choose>
        <c:when test="${!empty closeMsg}">
            <script type="text/javascript">
                $(function () {
                    alert("${closeMsg }");
                    <c:if test="${!empty parentReload}">
                        <c:choose>
                            <c:when test="${!empty returnUrl}">
                                $(opener).attr({name : "parentPage"});
                                $("#frmExec").postSubmit("<c:out value="${returnUrl}"/>", "parentPage");
                            </c:when>
                            <c:otherwise>
                                parent.opener.location.reload();
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <c:if test="${!empty parentFunction}">
                        parent.opener.parentFunction();
                    </c:if>
                    window.close();
                });
            </script>
        </c:when>
        <c:otherwise>
            <script type="text/javascript">
                $(function () {
                    <c:if test="${not empty alertMsg}">
                        alert("${alertMsg }");
                    </c:if>
                    <c:if test="${not empty messages}">
                        alert("${messages}");
                    </c:if>
                    <c:if test="${not empty script}">
                        <c:out value="${script}" escapeXml="false"/>
                    </c:if>
                    $("#frmExec").postSubmit("<c:out value="${returnUrl}"/>");
                });
            </script>
        </c:otherwise>
    </c:choose>
    <form id="frmExec" name="frmExec">
        <div style="display: none;">
            <c:forEach items="${commandMap}" var="item">
                <c:set var="arrayCnt" value="${fn:indexOf(item.value, 'Ljava.lang.String')}" />
                <c:choose>
                    <c:when test="${arrayCnt > 0}">
                        <c:forEach items="${item.value}" var="val">
                            <input type="hidden" id="${item.key }" name="${item.key}" value="<c:out value="${fn:trim(val)}" escapeXml="true"/>" />
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" id="${item.key }" name="${item.key}" value="<c:out value="${fn:trim(item.value)}" escapeXml="true"/>" />
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </form>
</body>
</html>