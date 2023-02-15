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
                        <span>메뉴 관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm" method="post">
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
                                        <span>메뉴명</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" name="searchAdmMnuNm" id="searchAdmMnuNm" value="<c:out value="${commandMap.searchAdmMnuNm }"/>" />
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <label><input type="radio" cass="radio" id="stateA" name="searchAdmMnuOnYN" class="radio" <c:if test="${empty commandMap.searchAdmMnuOnYN }">checked="checked"</c:if> value="" />전체</label>
                                        <label><input type="radio" cass="radio" id="stateB" name="searchAdmMnuOnYN" class="radio" <c:if test="${commandMap.searchAdmMnuOnYN eq 'Y' }">checked="checked"</c:if> value="Y" />사용</label>
                                        <label><input type="radio" cass="radio" id="stateC" name="searchAdmMnuOnYN" class="radio" <c:if test="${commandMap.searchAdmMnuOnYN eq 'N' }">checked="checked"</c:if> value="N" />미사용</label>
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
                    <form id="frm" name="frm" method="post">
                        <input type="hidden" name="ADM_MNU_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchAdmMnuNm" value="<c:out value="${commandMap.searchAdmMnuNm }"/>" />
                        <input type="hidden" name="searchAdmMnuOnYN" value="<c:out value="${commandMap.searchAdmMnuOnYN }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript:;" id="modifySort" class="button small">
                                    <span>순서 저장</span>
                                </a>
                                <a href="javascript:;" id="goForm" class="button small primary">
                                    <span>등록</span>
                                </a>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                    </form>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th colspan="2">순서</th>
                                <th>메뉴명</th>
                                <th>링크 경로</th>
                                <th>권한 체크 경로</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody class="sort-target">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                                <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                            </td>
                                            <td class="col-sort" data-adm_mnu_idx="<c:out value="${row.ADM_MNU_IDX }"/>">
                                                <c:out value="${row.ADM_MNU_SORT }" />
                                            </td>
                                            <td>
                                                <a href="javascript:;" class="list-title" data-adm_mnu_idx="<c:out value="${row.ADM_MNU_IDX }"/>">
                                                    <c:out value="${row.ADM_MNU_NM }" />
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MNU_URL }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MNU_AUTH_URL }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.ADM_MNU_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MNU_ON_YN eq 'Y' ? '사용' : '미사용' }" />
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
                        <!-- section-pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
                        </div>
                    </div>
                    <!-- // section-pagination -->
                </div>
                <!-- // container -->
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
                $frm.find("input[name=ADM_MNU_IDX]").val($(this).data("adm_mnu_idx"));
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
            <%-- 메뉴관리 순서 변경 이벤트 --%>
            $wrapper.on("click", ".row-sort", function() {
                var $this = $(this);
                var $tr = $this.closest("tr");
                if ($this.data("sort_type") == "up") {
                    var $prevTr = $tr.prev();
                    if ($prevTr.length > 0) {
                        $prevTr.before($tr.clone());
                        $tr.remove();
                    }
                } else {
                    var $nextTr = $tr.next();
                    if ($nextTr.length > 0) {
                        $tr.next().after($tr.clone());
                        $tr.remove();
                    }
                }
                $wrapper.find(".sort-target > tr").each(function (i) {
                    $(this).find(".col-sort").text(i + 1);
                });
            });
            <%-- 메뉴관리 순서 저장 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#modifySort", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var idxArray = new Array();
                    var sortArray = new Array();
                    $wrapper.find(".sort-target > tr").each(function (i) {
                        var $tr = $(this).find(".col-sort");
                        idxArray.push($tr.data("adm_mnu_idx"));
                        sortArray.push($tr.text());
                    });
                    $.postSyncJsonAjax($.action.ajax("SortArray"), {"ADM_MNU_IDX" : idxArray, "ADM_MNU_SORT" : sortArray}, function(data) {
                        alert(data.message);
                    });
                }
            });
        });
    </script>
</body>
</html>
