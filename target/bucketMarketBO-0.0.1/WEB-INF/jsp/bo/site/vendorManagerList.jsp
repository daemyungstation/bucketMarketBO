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
                        <span>제휴사 관리</span>
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
                                        <span>B2B 회사명</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text" name="searchVdrMstNm" id="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>" maxlength="15" />
                                    </td>
                                    <th>
                                        <span>업체 당당자</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text" name="searchVdrMstMngNm" id="searchVdrMstMngNm" value="<c:out value="${commandMap.searchVdrMstMngNm }"/>" maxlength="15" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>담당자</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchVdrMstDmId" id="searchVdrMstDmId">
                                            <option value="" <c:if test="${empty commandMap.searchVdrMstDmId }">selected="selected"</c:if>>선택</option>
                                            <c:if test="${not empty authManagerList }">
                                                <c:forEach var="row" items="${authManagerList }" varStatus="i">
                                                    <option value="<c:out value="${row.ADM_MST_ID }"/>" <c:if test="${commandMap.searchVdrMstDmId eq row.ADM_MST_ID }">selected="selected"</c:if>><c:out value="${row.ADM_MST_NM }"/></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="stateA" name="searchVdrMstUseYn" class="radio" <c:if test="${empty commandMap.searchVdrMstUseYn }">checked="checked"</c:if> value="" />
                                        <label for="stateA">전체</label>
                                        <input type="radio" id="stateB" name="searchVdrMstUseYn" class="radio" <c:if test="${commandMap.searchVdrMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="stateB">사용</label>
                                        <input type="radio" id="stateC" name="searchVdrMstUseYn" class="radio" <c:if test="${commandMap.searchVdrMstUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="stateC">미사용</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>키워드 검색</span>
                                    </th>
                                    <td colspan="3">
                                        <select class="select" name="searchType" id="searchType">
                                            <option value="S_NM" <c:if test="${commandMap.searchType eq 'S_NM' }">selected="selected"</c:if>>상호/법인명</option>
                                            <option value="S_NUMBER" <c:if test="${commandMap.searchType eq 'S_NUMBER' }">selected="selected"</c:if>>사업자번호</option>
                                            <option value="S_MNG_NM" <c:if test="${commandMap.searchType eq 'S_MNG_NM' }">selected="selected"</c:if>>담당자명</option>
                                        </select>
                                        <input type="text" class="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" maxlength="15" />
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
                        <input type="hidden" name="VDR_MST_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchVdrMstNm" value="<c:out value="${commandMap.searchVdrMstNm }"/>" />
                        <input type="hidden" name="searchVdrMstMngNm" value="<c:out value="${commandMap.searchVdrMstMngNm }"/>" />
                        <input type="hidden" name="searchVdrMstDmId" value="<c:out value="${commandMap.searchVdrMstDmId }"/>" />
                        <input type="hidden" name="searchVdrMstUseYn" value="<c:out value="${commandMap.searchVdrMstUseYn }"/>" />
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript::;" id="goForm" class="button small primary">
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
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>B2B 회사명</th>
                                <th>업체 당당자</th>
                                <th>대명 당당자</th>
                                <th>사업자번호</th>
                                <th>대표자</th>
                                <th>등록일</th>
                                <th>상태</th>
                                <th>계약동의</th>
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
                                                <a href="javascript:;" class="list-title" data-vdr_mst_idx="<c:out value="${row.VDR_MST_IDX }"/>">
                                                    <c:out value="${row.VDR_MST_NM }" />
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.VDR_MST_MNG_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ADM_MST_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.VDR_MST_BUSI1 }" />
                                                -
                                                <c:out value="${row.VDR_MST_BUSI2 }" />
                                                -
                                                <c:out value="${row.VDR_MST_BUSI3 }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.VDR_MST_CEO_NM }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.VDR_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                            </td>
                                            <td>
                                                <c:out value="${row.VDR_MST_USE_YN eq 'Y' ? '사용' : '미사용' }" />
                                            </td>
                                            <td>
                                                <c:out value="${not empty row.VDR_MST_AGR_DT ? '동의' : '미동의' }" />
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
                $frm.find("input[name='VDR_MST_IDX']").val($(this).data("vdr_mst_idx"));
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
