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
                    <!-- container -->
                    <h2 class="title">
                        <span>교육이수 목록</span>
                    </h2>
                    <h3 class="title">
                        <span>검색</span>
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
                                        <span>키워드 검색</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchKeyword" id="searchKeyword" class="text xlarge" value="<c:out value="${commandMap.searchKeyword }"/>" />
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="searchRdpEduYn0" class="radio" name="searchRdpEduYn" value="" <c:if test="${empty commandMap.searchRdpEduYn }">checked="checked"</c:if>/>
                                        <label for="searchRdpEduYn0">전체</label>
                                        <input type="radio" id="searchRdpEduYn1" class="radio" name="searchRdpEduYn" value="Y" <c:if test="${commandMap.searchRdpEduYn eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="searchRdpEduYn1">노출</label>
                                        <input type="radio" id="searchRdpEduYn2" class="radio" name="searchRdpEduYn" value="N" <c:if test="${commandMap.searchRdpEduYn eq 'N' }">checked="checked"</c:if>/>
                                        <label for="searchRdpEduYn2">노출안함</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="grid section-button-search">
                        <!-- 검색 하단 버튼 -->
                        <a href="javascript:TagUtil.formClear('searchForm');" class="button small">
                            <span>검색조건 초기화</span>
                        </a>
                        <a href="#none" id="search" class="button small primary">
                            <span>검색</span>
                        </a>
                    </div>
                    <form id="frm" name="frm">
                        <input type="hidden" name="RDP_EDU_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" />
                        <input type="hidden" name="searchRdpEduYn" value="<c:out value="${commandMap.searchRdpEduYn }"/>" />
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
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: auto;" />
                                <col style="width: 8%;" />
                                <col style="width: 14%;" />
                                <col style="width: 14%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>그룹명</th>
                                    <th>상태</th>
                                    <th>등록자</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty list}">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${paging.listNum - i.index }" />
                                            </td>
                                            <td class="left">
                                                <a href="javascript:;" class="list-title" data-rdp_edu_idx="<c:out value="${row.RDP_EDU_IDX }"/>">
                                                    <c:out value="${row.RDP_EDU_NM }" />
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_EDU_YN eq 'Y' ? '노출' : '노출안함' }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_EDU_REG_NM }" />(<c:out value="${row.RDP_EDU_REG_ID }" />)
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.RDP_EDU_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
            $frm = $wrapper.find("#frm")
            $searchForm = $wrapper.find("#searchForm");
            // 검색
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            // 등록
            $wrapper.on("click", "#goForm", function() {
                $frm.postSubmit($.action.form());
            });
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
            // 제목
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='RDP_EDU_IDX']").val($(this).data("rdp_edu_idx"));
                $frm.postSubmit($.action.edit());
            });
        });
    </script>
</body>
</html>
