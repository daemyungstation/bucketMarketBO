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
                        <span>카테고리관리</span>
                    </h2>
                    <div class="grid section-button-list">
                        <div class="col-1-2 text-left">
                            <a href="javascript:;" id="goView" class="button small">
                                <span>대카테고리 관리</span>
                            </a>
                        </div>
                        <div class="col-1-2 text-right">
                            <a href="javascript:;" id="goFormPopup" class="button small">
                                <span>하위 카테고리 추가</span>
                            </a>
                        </div>
                    </div>
                    <div class="clearfix">
                        <jsp:include page="/WEB-INF/jsp/common/template/tree.jsp" flush="false">
                            <jsp:param name="listName" value="list"/>
                            <jsp:param name="colAs" value="PRD_CTG"/>
                        </jsp:include>
                        <div id="treeMainContents" style="float: left; padding: 10px; width: 78%">
                            <div class="contents-inner">
                                <h3 class="title">
                                    <span>대카테고리 목록</span>
                                </h3>
                                <form name="frm" id="frm">
                                    <table cellspacing="0" class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 20%;"/>
                                            <col style="width: auto;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>카테고리 수</span>
                                                </th>
                                                <td>
                                                    <c:out value="${fn:length(topList) }"/>개
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>카테고리 정렬</span>
                                                </th>
                                                <td>
                                                    <table class="table-a">
                                                        <colgroup>
                                                        <col style="width: 10%;" />
                                                        <col style="width: auto;" />
                                                    </colgroup>
                                                        <tbody>
                                                            <c:if test="${not empty topList }">
                                                                <c:forEach var="row" items="${topList }" varStatus="i">
                                                                    <tr class="tr-sort" data-prd_ctg_idx="<c:out value="${row.PRD_CTG_IDX }"/>">
                                                                        <td>
                                                                            <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                                                            <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                                                        </td>
                                                                        <td>
                                                                            <input type="hidden" name="PRD_CTG_CHILD_IDXs" value="<c:out value="${row.PRD_CTG_IDX }"/>"/>
                                                                            <input type="hidden" name="PRD_CTG_CHILD_SORTs" value="<c:out value="${row.PRD_CTG_SORT }"/>" />
                                                                            <c:out value="${row.PRD_CTG_NM }"/>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${empty topList }">
                                                                <tr>
                                                                    <td class="td_no_result"></td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                    <div class="wrap text-right">
                                                        <a href="javascript:;" id="save" class="button small info">
                                                            <span>순서저장</span>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
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
    <form name="naviForm" id="naviForm"></form>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $contents = $("#contents"), 
                $treeMainContents = $contents.find("#treeMainContents"),
                $naviForm = $("#naviForm");
            <%-- 대카테고리 관리 버튼 클릭 이벤트 --%>
            $contents.on("click", "#goView", function() {
                $naviForm.postSubmit($.action.view());
            });
            
            <%-- 하위 카테고리 추가 버튼 클릭 이벤트 --%>
            $contents.on("click", "#goFormPopup", function() {
                var $frm = $treeMainContents.find("#frm");
                $frm.postPop($.action.popup("Form"), "categoryDisplayFormPopup", "width=800,height=310,left=10,top=10");
            });
            <%-- 수정 폼 호출 --%>
            goEdit = function (data) {
                var param = new Object();
                param.PRD_CTG_IDX = data.PRD_CTG_IDX;
                param.PRD_CTG_UP_IDX = data.PRD_CTG_IDX;
                $.postSyncHtmlAjax($.action.edit(), param, function(html) {
                    $treeMainContents.empty();
                    $treeMainContents.append(html);
                    TagUtil.setEmptyColspan();
                });
            };
            <%-- 순서변경 --%>
            $treeMainContents.on("click", ".row-sort", function() {
                var $this = $(this),
                    $tr = $this.closest("tr"),
                    $tbody = $this.closest("tbody");
                if ($this.data("sort_type") == "up" && $tr.prev().length > 0) {
                    $tr.prev().before($tr.clone());
                    $tr.remove();
                } else if ($this.data("sort_type") == "down" && $tr.next().length > 0) {
                    $tr.next().after($tr.clone());
                    $tr.remove();
                }
                $tr = $tbody.find(".tr-sort");
                $tr.each(function (i) {
                    $this = $(this);
                    $this.find("input[name='PRD_CTG_CHILD_SORTs']").val(i + 1);
                });
            });
            <%-- 저장, 순서저장 버튼 클릭 이벤트 --%>
            $treeMainContents.on("click", "#save", function() {
                var $frm = $treeMainContents.find("#frm");
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
            <%-- 트리 객체 생성 --%>
            new Tree(goEdit);
            <c:if test="${not empty commandMap.PRD_CTG_IDX}">
                var param = new Object();
                param.PRD_CTG_IDX = "<c:out value="${commandMap.PRD_CTG_IDX }"/>";
                goEdit(param);
            </c:if>
        });
    </script>
</body>
</html>
