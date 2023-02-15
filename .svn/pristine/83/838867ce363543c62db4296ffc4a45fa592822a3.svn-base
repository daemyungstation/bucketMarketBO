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
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <div id="wrapper">
            <div id="breadcrumb"></div>
            <div id="contents">
                <div class="container">
                    <h2 class="title">
                        <span>이벤트</span>
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
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>이벤트 기간</span>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }" />" data-target-end="#searchEndDate" />
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }" />" data-target-start="#searchStartDate" />
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
                                        <a href="javascript:DateUtil.fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall">
                                            <span>두달</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>이벤트명</span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="text xlarge" name="searchEvtMstTitle" id="searchEvtMstTitle" value="<c:out value="${commandMap.searchEvtMstTitle }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>개인정보 수집여부</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchEvtMstPsnYn" id="searchEvtMstPsnYn0" class="radio" <c:if test="${empty commandMap.searchEvtMstPsnYn }">checked="checked"</c:if> value="" />
                                        <label for="searchEvtMstPsnYn0">전체</label>
                                        <input type="radio" name="searchEvtMstPsnYn" id="searchEvtMstPsnYn1" class="radio" <c:if test="${commandMap.searchEvtMstPsnYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchEvtMstPsnYn1">수집</label>
                                        <input type="radio" name="searchEvtMstPsnYn" id="searchEvtMstPsnYn2" class="radio" <c:if test="${commandMap.searchEvtMstPsnYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchEvtMstPsnYn2">수집안함</label>
                                    </td>
                                    <th>
                                        <span>전시상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchEvtMstUseYn" id="searchEvtMstUseYn0" class="radio" <c:if test="${empty commandMap.searchEvtMstUseYn }">checked="checked"</c:if> value="" />
                                        <label for="searchEvtMstUseYn0">전체</label>
                                        <input type="radio" name="searchEvtMstUseYn" id="searchEvtMstUseYn1" class="radio" <c:if test="${commandMap.searchEvtMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchEvtMstUseYn1">전시</label>
                                        <input type="radio" name="searchEvtMstUseYn" id="searchEvtMstUseYn2" class="radio" <c:if test="${commandMap.searchEvtMstUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchEvtMstUseYn2">전시안함</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <div class="grid section-button-search">
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색 조건 초기화</span>
                        </a>
                        <a href="javascript:;" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="EVT_MST_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchEvtMstTitle" value="<c:out value="${commandMap.searchEvtMstTitle }"/>" />
                        <input type="hidden" name="searchEvtMstPsnYn" value="<c:out value="${commandMap.searchEvtMstPsnYn }"/>" />
                        <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>" />
                        <div class="grid section-button-list">
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <a href="javascript:;" id="goForm" class="button small primary">
                                    <span>이벤트 등록</span>
                                </a>
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 8%;" />
                                <col style="width: auto;" />
                                <col style="width: 18%;" />
                                <col style="width: 10%;" />
                                <col style="width: 8%;" />
                                <col style="width: 15%;" />
                                <col style="width: 8%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>이벤트코드</th>
                                    <th>이벤트명</th>
                                    <th>이벤트기간</th>
                                    <th>개인정보 수집</th>
                                    <th>댓글 수</th>
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
                                                    <c:out value="${row.EVT_MST_IDX }" />
                                                </td>
                                                <td class="left">
                                                    <a href="javascript:;" class="list-title" data-evt_mst_idx="<c:out value="${row.EVT_MST_IDX }"/>">
                                                        <c:out value="${row.EVT_MST_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd" />
                                                    ~
                                                    <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.EVT_MST_PSN_YN eq 'Y' ? '수집' : '수집안함' }" />
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${row.EVT_RPL_CNT }" type="number"/>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.EVT_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.EVT_MST_USE_YN eq 'Y' ? '전시' : '전시안함' }" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${empty list}">
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
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm");
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='EVT_MST_IDX']").val($(this).data("evt_mst_idx"));
                $frm.postSubmit($.action.edit());
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "#searchEvtMstTitle", function(e) {
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