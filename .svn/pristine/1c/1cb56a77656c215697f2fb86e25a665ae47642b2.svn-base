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
                        <span>FAQ관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <!-- row -->
                                    <th>
                                        <span>등록일</span>
                                    </th>
                                    <td colspan="5">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" class="text date" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
                                        <a href="javascript:DateUtil.fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall">
                                            <span>전체</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>키워드검색</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" name="searchBrdFaqTitleAndContents" id="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>" />
                                    </td>
                                    <th>
                                        <span>유형</span>
                                    </th>
                                    <td>
                                        <select class="select" name="saerchBrdCmnComIdx" id="saerchBrdCmnComIdx">
                                            <option value="">선택</option>
                                            <c:if test="${not empty codeList }">
                                                <c:forEach var="row" items="${codeList }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${commandMap.saerchBrdCmnComIdx eq row.CMN_COM_IDX}">selected="selected"</c:if>>
                                                        <c:out value="${row.CMN_COM_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td colspan="3">
                                        <input type="radio" id="stateA" name="serachBrdFaqUseYn" class="radio" <c:if test="${empty commandMap.serachBrdFaqUseYn }">checked="checked"</c:if> value="" />
                                        <label for="stateA">전체</label>
                                        <input type="radio" id="stateB" name="serachBrdFaqUseYn" class="radio" <c:if test="${commandMap.serachBrdFaqUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="stateB">사용</label>
                                        <input type="radio" id="stateC" name="serachBrdFaqUseYn" class="radio" <c:if test="${commandMap.serachBrdFaqUseYn eq 'N' }">checked="checked"</c:if> value="N" />
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
                    <form id="frm" name="frm">
                        <input type="hidden" name="BRD_FAQ_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchBrdFaqTitleAndContents" value="<c:out value="${commandMap.searchBrdFaqTitleAndContents }"/>" />
                        <input type="hidden" name="saerchBrdCmnComIdx" value="<c:out value="${commandMap.saerchBrdCmnComIdx }"/>" />
                        <input type="hidden" name="serachBrdFaqUseYn" value="<c:out value="${commandMap.serachBrdFaqUseYn }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript:;" id="goExcelDownload" class="button small info">
                                    <span>엑셀다운로드</span>
                                </a>
                                <a href="javascript:;" id="goExcelUploadPopup" class="button small">
                                    <span>일괄 순서변경</span>
                                </a>
                                <a href="javascript:;" id="goSortEditPopup" class="button small">
                                    <span>건별 순서변경</span>
                                </a>
                                <a href="javascript:;" id="goForm" class="button small primary">
                                    <span>등록</span>
                                </a>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                        <table cellspacing="0" class="table-col table-b">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                                <col style="width: 8%;" />
                                <col style="width: 15%;" />
                                <col style="width: 10%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>문의유형</th>
                                    <th>제목</th>
                                    <th>조회수</th>
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
                                                    <c:out value="${row.BRD_CMN_COM_NM }" />
                                                </td>
                                                <td class="left">
                                                    <a href="javascript:;" class="list-title" data-brd_faq_idx="<c:out value="${row.BRD_FAQ_IDX }"/>">
                                                        <c:out value="${row.BRD_FAQ_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:out value="${row.BRD_FAQ_READ_CNT }" />
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.BRD_FAQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.BRD_FAQ_USE_YN eq 'Y' ? '사용' : '미사용' }" />
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
                        <!-- section pagination -->
                        <div class="section-pagination">
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <!-- 개발 시 wrap 이하 모듈 시작 -->
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                        <!-- // section pagination -->
                    </form>
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
            
            <%-- 일괄 순서변경 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelUploadPopup", function() {
                $frm.postPop($.action.popup("ExcelUpload"), "faqBoardExcelUploadPopup", "width=550,height=425,left=500,top=100");
            });
            <%-- 건별 순서변경 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goSortEditPopup", function() {
                $frm.postPop($.action.popup("SortEdit"), "faqBoardSortEditPopup", "width=800,height=600,left=500,top=100");
            });
            <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".list-title", function() {
                $frm.find("input[name='BRD_FAQ_IDX']").val($(this).data("brd_faq_idx"));
                $frm.postSubmit($.action.edit());
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $searchForm.on("keydown", "#searchBrdFaqTitleAndContents", function(e) {
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
