<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body>
    <div id="header">
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <div id="container">
        <div id="aside" class="aside left">
            <!-- aside -->
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <div id="wrapper">
            <div id="breadcrumb"></div>
            <div id="contents">
                <div class="container">
                    <h2 class="title">
                        <span>기획전관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>기간</span>
                                    </th>
                                    <td colspan="5">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchPlnMstStDt" id="searchPlnMstStDt" class="text date" value="<c:out value="${commandMap.searchPlnMstStDt }" />" data-target-end="#searchPlnMstEdDt" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchPlnMstEdDt" id="searchPlnMstEdDt" class="text date" value="<c:out value="${commandMap.searchPlnMstEdDt }" />" data-target-start="#searchPlnMstStDt" />
                                        <a href="javascript:DateUtil.fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall">
                                            <span>오늘</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall">
                                            <span>일주일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall">
                                            <span>15일</span>
                                        </a>
                                        <a href="javascript:DateUtil.fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall">
                                            <span>한달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>기획전명</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchPlnMstTitle" id="searchPlnMstTitle" class="text xlarge" value="<c:out value="${commandMap.searchPlnMstTitle }"/>" />
                                    </td>
                                    <th>
                                        <span>전시여부</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchPlnMstUseYn" id="searchPlnMstUseYn0" class="radio" <c:if test="${empty commandMap.searchPlnMstUseYn }">checked="checked"</c:if> value="" />
                                        <label for="searchPlnMstUseYn0">전체</label>
                                        <input type="radio" name="searchPlnMstUseYn" id="searchPlnMstUseYn1" class="radio" <c:if test="${commandMap.searchPlnMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchPlnMstUseYn1">전시</label>
                                        <input type="radio" name="searchPlnMstUseYn" id="searchPlnMstUseYn2" class="radio" <c:if test="${commandMap.searchPlnMstUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchPlnMstUseYn2">미전시</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="PLN_MST_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchPlnMstShopType" value="<c:out value="${commandMap.searchPlnMstShopType }"/>" />
                        <input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>" />
                        <input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>" />
                        <input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>" />
                        <input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>" />
                        <input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>" />
                        <div class="grid section-button-list">
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage" />
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
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 6%;" />
                                <col style="width: auto;" />
                                <col style="width: 20%;" />
                                <col style="width: 8%;" />
                                <col style="width: 10%;" />
                                <col style="width: 15%;" />
                                <col style="width: 8%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>기획전코드</th>
                                    <th>기획전명</th>
                                    <th>기획전기간</th>
                                    <th>댓글 사용여부</th>
                                    <th>댓글 수</th>
                                    <th>등록일</th>
                                    <th>전시여부</th>
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
                                                    <c:out value="${row.PLN_MST_IDX }" />
                                                </td>
                                                <td class="left">
                                                    <a href="javascript:;" class="list-title" data-pln_mst_idx="${row.PLN_MST_IDX }">
                                                        <c:out value="${row.PLN_MST_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.PLN_MST_ST_DT }" pattern="yyyy.MM.dd" />
                                                    ~
                                                    <ui:formatDate value="${row.PLN_MST_ED_DT }" pattern="yyyy.MM.dd" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PLN_MST_RPL_YN eq 'Y' ? '사용함' : '사용안함' }" />
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${row.PLN_RPL_CNT}" groupingUsed="true" />
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.PLN_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PLN_MST_USE_YN eq 'Y' ? '전시' : '미전시' }" />
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
                        <div class="section-pagination">
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="quickmenu" class="aside right">
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
    </div>
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
                $frm.find("input[name='PLN_MST_IDX']").val($(this).data("pln_mst_idx"));
                $frm.postSubmit($.action.edit());
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "#searchPlnMstTitle", function(e) {
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
    </script>
</body>
</html>
