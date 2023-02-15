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
                        <span>권한 관리</span>
                    </h2>
                    <div class="section-title">
                        <!-- section-title -->
                        <h3 class="title">
                            <span>목록</span>
                        </h3>
                    </div>
                    <!-- // section-title -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <!-- row -->
                                    <th>
                                        <span>권한명</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" name="searchAutMstNm" id="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>" />
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="stateA" name="searchAutMstState" class="radio" <c:if test="${empty commandMap.searchAutMstState }">checked="checked"</c:if> value="" />
                                        <label for="stateA">전체</label>
                                        <input type="radio" id="stateB" name="searchAutMstState" class="radio" <c:if test="${commandMap.searchAutMstState eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="stateB">사용</label>
                                        <input type="radio" id="stateC" name="searchAutMstState" class="radio" <c:if test="${commandMap.searchAutMstState eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="stateC">미사용</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="grid section-button-search">
                        <!-- 검색 하단 버튼 -->
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <!-- // 검색 하단 버튼 -->
                    <form id="frm" name="frm">
                        <input type="hidden" name="AUT_MST_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchAutMstState" value="<c:out value="${commandMap.searchAutMstState }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript:;" id="goForm" class="button small primary">
                                    <span>등록</span>
                                </a>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                    </form>
                    <table cellspacing="0" class="table-col table-b">
                        <!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>권한명</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${paging.listNum - i.index }" />
                                            </td>
                                            <td>
                                                <a href="javascript:;" class="list-title" data-aut_mst_idx="<c:out value="${row.AUT_MST_IDX }"/>">
                                                    <c:out value="${row.AUT_MST_NM }" />
                                                </a>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.AUT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                            </td>
                                            <td>
                                                <c:out value="${row.AUT_MST_STATE eq 'Y'?'사용':'미사용' }" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td class="td_no_result"></td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                    <!-- // table -->
                    <div class="section-pagination">
                        <!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <!-- 개발 시 wrap 이하 모듈 시작 -->
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div>
                    <!-- // section pagination -->
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
            var $wrapper = $("#wrapper"),
                $frm = $wrapper.find("#frm"),
                $searchForm = $wrapper.find("#searchForm");
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='AUT_MST_IDX']").val($(this).data("aut_mst_idx"));
                $frm.postSubmit($.action.edit());
            });
            <%-- 검색 엔터 이벤트 --%>
            $searchForm.find("input[type='text']").keydown(function (e) {
                if (e.keyCode == 13) {
                    $wrapper.find("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
        });
    </script>
</body>
</html>
