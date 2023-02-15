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
                        <span>제휴사 공지사항</span>
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
                                    <td colspan="3">
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
                                        <input type="text" class="text xlarge" name="searchScmNtsTitleAndContents" id="searchScmNtsTitleAndContents" value="<c:out value="${commandMap.searchScmNtsTitleAndContents }"/>" placeholder="제목 또는 내용에서 찾으시는 단어를 입력하세요." />
                                    </td>
                                    <th>
                                        <span>제휴업체</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchVdrMstIdx" id="searchVdrMstIdx" <c:if test="${isScm }">disabled="disabled"</c:if>>
                                            <option value="" <c:if test="${empty commandMap.searchVdrMstIdx }">selected="selected"</c:if>>전체</option>
                                            <c:if test="${not empty vendorList }">
                                                <c:forEach var="row" items="${vendorList }" varStatus="i">
                                                    <option value="<c:out value="${row.VDR_MST_IDX }"/>" <c:if test="${row.VDR_MST_IDX eq commandMap.searchVdrMstIdx }">selected="selected"</c:if>>
                                                        <c:out value="${row.VDR_MST_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <c:if test="${not isScm }">
                                    <tr>
                                        <th>
                                            <span>상태</span>
                                        </th>
                                        <td colspan="3">
                                            <input type="radio" id="stateA" name="searchScmNtsUseYn" class="radio" <c:if test="${empty commandMap.searchScmNtsUseYn }">checked="checked"</c:if> value="" />
                                            <label for="stateA">전체</label>
                                            <input type="radio" id="stateB" name="searchScmNtsUseYn" class="radio" <c:if test="${commandMap.searchScmNtsUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                            <label for="stateB">사용</label>
                                            <input type="radio" id="stateC" name="searchScmNtsUseYn" class="radio" <c:if test="${commandMap.searchScmNtsUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                            <label for="stateC">미사용</label>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
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
                        <input type="hidden" name="SCM_NTS_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchScmNtsTitleAndContents" value="<c:out value="${commandMap.searchScmNtsTitleAndContents }"/>" />
                        <input type="hidden" name="searchScmNtsUseYn" value="<c:out value="${commandMap.searchScmNtsUseYn }"/>" />
                        <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <c:if test="${not isScm }">
                                <div class="col-1-2 text-right">
                                    <a href="javascript:;" id="goForm" class="button small primary">
                                        <span>등록</span>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                        <table cellspacing="0" class="table-col table-b">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 8%;" />
                                <col style="width: auto;" />
                                <col style="width: 15%;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                                <col style="width: 15%;" />
                                <col style="width: 10%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>제휴업체</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>조회수</th>
                                    <th>상단 공지</th>
                                    <th>작성자</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 상단공지 -->
                                <c:if test="${not empty topList }">
                                    <c:forEach var="row" items="${topList }" varStatus="i">
                                        <tr>
                                            <td>상단</td>
                                            <td>
                                                <c:out value="${empty row.VDR_MST_NM ? '전체' : row.VDR_MST_NM }" />
                                            </td>
                                            <td class="left">
                                                <a href="javascript:;" class="list-title" data-scm_nts_idx="<c:out value="${row.SCM_NTS_IDX }"/>">
                                                    <c:out value="${row.SCM_NTS_TITLE }" />
                                                </a>
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.SCM_NTS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                            </td>
                                            <td>
                                                <c:out value="${row.SCM_NTS_READ_CNT }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.SCM_NTS_TOP_YN eq 'Y'?'상단공지':'일반공지' }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.SCM_NTS_REG_ID }" />
                                                (
                                                <c:out value="${row.SCM_NTS_REG_NM }" />
                                                )
                                            </td>
                                            <td>
                                                <c:out value="${row.SCM_NTS_USE_YN eq 'Y' ? '사용' : '미사용' }" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <!-- 일반공지 -->
                                <c:choose>
                                    <c:when test="${not empty list }">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td>
                                                    <c:out value="${paging.listNum - i.index }" />
                                                </td>
                                                <td>
                                                    <c:out value="${empty row.VDR_MST_NM ? '전체' : row.VDR_MST_NM }" />
                                                </td>
                                                <td class="left">
                                                    <a href="javascript:;" class="list-title" data-scm_nts_idx="<c:out value="${row.SCM_NTS_IDX }"/>">
                                                        <c:out value="${row.SCM_NTS_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.SCM_NTS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.SCM_NTS_READ_CNT }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.SCM_NTS_TOP_YN eq 'Y'?'상단공지':'일반공지' }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.SCM_NTS_REG_ID }" />
                                                    (
                                                    <c:out value="${row.SCM_NTS_REG_NM }" />
                                                    )
                                                </td>
                                                <td>
                                                    <c:out value="${row.SCM_NTS_USE_YN eq 'Y' ? '사용' : '미사용' }" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${empty topList and empty list}">
                                            <tr>
                                                <td class="td_no_result"></td>
                                            </tr>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <div class="section-pagination">
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <!-- 개발 시 wrap 이하 모듈 시작 -->
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
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
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm");
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='SCM_NTS_IDX']").val($(this).data("scm_nts_idx"));
                $frm.postSubmit($.resources.isScm ? $.action.view() : $.action.edit());
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "#searchScmNtsTitleAndContents", function(e) {
                if (e.keyCode == 13) {
                    $("#search").trigger("click");
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
    //-->
    </script>
</body>
</html>