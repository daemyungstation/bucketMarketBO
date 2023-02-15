<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<style type="text/css">
<!--
-->
</style>
</head>
<body>
    <!-- body class, 중요 -->
    <div id="header">
        <!-- header -->
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <!-- // header -->
    <div id="container">
        <!-- container -->
        <div id="aside" class="aside left">
            <!-- aside -->
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <!-- // aside -->
        <div id="wrapper">
            <!-- wrapper -->
            <div id="breadcrumb"></div>
            <!-- breadcrumb -->
            <div id="contents">
                <!-- contents -->
                <div class="container">
                    <h2 class="title">
                        <span>전시배너 관리</span>
                    </h2>
                    <div class="clearfix">
                        <jsp:include page="/WEB-INF/jsp/common/template/tree.jsp" flush="false">
                            <jsp:param name="listName" value="list"/>
                            <jsp:param name="colAs" value="CMN_COM"/>
                        </jsp:include>
                        <div id="treeMainContents" style="float: left; padding: 10px; width: 78%"></div>
                    </div>
                </div>
            </div>
            <!-- // contents -->
        </div>
        <!-- // wrapper -->
        <div id="quickmenu" class="aside right">
            <!-- quickmenu-->
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
        <!-- // quickmenu -->
    </div>
    <!-- // container -->
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $clearfix = $(".clearfix"),
                $treeMainContents = $clearfix.find("#treeMainContents");
            <%-- 목록 호출 --%>
            goList = function (data) {
                if (StringUtil.getInt(data.CMN_COM_LEAF, 0) > 0) {
                    $.postSyncHtmlAjax($.action.list(), data, setMainContents);
                }
            };
            <%-- 트리 객체 생성 --%>
            new Tree(goList);
            <%-- 컨텐츠 추가 --%>
            setMainContents = function (html) {
                $treeMainContents.empty();
                $treeMainContents.append(html);
                TagUtil.setEmptyColspan();
            };
            <c:if test="${not empty commandMap.CMN_COM_IDX}">
                goList(eval(<c:out value="${data }" escapeXml="false"/>));
            </c:if>
            <c:if test="${empty commandMap.CMN_COM_IDX}">
            $clearfix.find(".folder[leaf='1']:first").trigger("click");
            </c:if>
        });
    </script>
</body>
</html>
