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
                        <span>커뮤니티</span>
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
                                        <span>이름</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchRdpMstMemNm" id="searchKeyword" class="text xlarge" value="<c:out value="${commandMap.searchRdpMstMemNm }"/>" />
                                    </td>
                                    <th>
                                        <span>아이디</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchRdpMstId" id="searchKeyword" class="text xlarge" value="<c:out value="${commandMap.searchRdpMstId }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>연락처 뒤 4자리</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchRdpMstHp3" id="searchKeyword" class="text xlarge" value="<c:out value="${commandMap.searchRdpMstHp3 }"/>" />
                                    </td>
                                    <th>
                                        <span>키워드 검색</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchKeyword" id="searchKeyword" class="text xlarge" value="<c:out value="${commandMap.searchKeyword }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>소속</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="searchRdpMstDmYn0" class="radio" name="searchRdpMstDmYn" value="" <c:if test="${empty commandMap.searchRdpMstDmYn }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstDmYn0">전체</label>
                                        <input type="radio" id="searchRdpMstDmYn1" class="radio" name="searchRdpMstDmYn" value="N" <c:if test="${commandMap.searchRdpMstDmYn eq 'N' }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstDmYn1">일반</label>
                                        <input type="radio" id="searchRdpMstDmYn2" class="radio" name="searchRdpMstDmYn" value="Y" <c:if test="${commandMap.searchRdpMstDmYn eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstDmYn2">임직원</label>
                                        <%-- 임직원 --%>
                                        <c:if test="${commandMap.searchRdpMstDmYn ne 'Y' }">
                                            <input type="text" name="searchRdpMstDmNo" id="searchRdpMstDmNo" class="text" disabled="disabled" placeholder="사번"/>
                                        </c:if>
                                        <c:if test="${commandMap.searchRdpMstDmYn eq 'Y' }">
                                            <input type="text" name="searchRdpMstDmNo" id="searchRdpMstDmNo" class="text" value="<c:out value="${commandMap.searchRdpMstDmNo }"/>"/>
                                        </c:if>
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="searchRdpBbsUseYn0" class="radio" name="searchRdpBbsUseYn" value="" <c:if test="${empty commandMap.searchRdpBbsUseYn }">checked="checked"</c:if>/>
                                        <label for="searchRdpBbsUseYn0">전체</label>
                                        <input type="radio" id="searchRdpBbsUseYn1" class="radio" name="searchRdpBbsUseYn" value="Y" <c:if test="${commandMap.searchRdpBbsUseYn eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="searchRdpBbsUseYn1">노출</label>
                                        <input type="radio" id="searchRdpBbsUseYn2" class="radio" name="searchRdpBbsUseYn" value="N" <c:if test="${commandMap.searchRdpBbsUseYn eq 'N' }">checked="checked"</c:if>/>
                                        <label for="searchRdpBbsUseYn2">노출안함</label>
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
                        <input type="hidden" name="RDP_BBS_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchRdpMstMemNm" value="<c:out value="${commandMap.searchRdpMstMemNm }"/>" />
                        <input type="hidden" name="searchRdpMstId" value="<c:out value="${commandMap.searchRdpMstId }"/>" />
                        <input type="hidden" name="searchRdpMstHp3" value="<c:out value="${commandMap.searchRdpMstHp3 }"/>" />
                        <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" />
                        <input type="hidden" name="searchRdpMstDmYn" value="<c:out value="${commandMap.searchRdpMstDmYn }"/>" />
                        <input type="hidden" name="searchRdpBbsUseYn" value="<c:out value="${commandMap.searchRdpBbsUseYn }"/>" />
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
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 10%;" />
                                <col style="width: 10%;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 5%;" />
                                <col style="width: 8%;" />
                                <col style="width: 14%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>플래너번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>제목</th>
                                    <th>조회수</th>
                                    <th>상태</th>
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
                                                <a href="javascript:;" class="list-planner" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                    <c:out value="${row.RDP_MST_NO }"/>
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_ID }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_MEM_NM }" />
                                            </td>
                                            <td class="left">
                                                <a href="javascript:;" class="list-title" data-rdp_bbs_idx="<c:out value="${row.RDP_BBS_IDX }"/>">
                                                    <c:out value="${row.RDP_BBS_TITLE }"/>
                                                </a>
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_BBS_READ_CNT }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_BBS_USE_YN eq 'Y' ? '노출' : '노출안함' }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.RDP_BBS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
            // 소속
            $wrapper.on("change", "input[name='searchRdpMstDmYn']", function() {
                $('#searchRdpMstDmNo').val('');
                $('#searchRdpMstDmNo').attr('disabled', $("input[name='searchRdpMstDmYn']:checked").val() != 'Y');
            });
            // 검색
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
            // 플래너번호
            $wrapper.on("click", ".list-planner", function() {
                $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
            });
            // 제목
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='RDP_BBS_IDX']").val($(this).data("rdp_bbs_idx"));
                $frm.postSubmit($.action.edit());
            });
            // 엑셀 다운로드
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
        });
    </script>
</body>
</html>
