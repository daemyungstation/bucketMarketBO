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
                        <span>활동 플래너</span>
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
                                        <span>활동 시작일</span>
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
                                        <input type="text" name="searchRdpMstMemNm" id="searchRdpMstMemNm" class="text large" value="<c:out value="${commandMap.searchRdpMstMemNm }"/>" />
                                    </td>
                                    <th>
                                        <span>이메일주소</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchRdpMstMail" id="searchRdpMstMail" class="text large" value="<c:out value="${commandMap.searchRdpMstMail }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>연락처 뒤 4 자리</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchRdpMstHp3" id="searchRdpMstHp3" class="text large" value="<c:out value="${commandMap.searchRdpMstHp3 }"/>" />
                                    </td>
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
                                </tr>
                                <tr>
                                    <th>
                                        <span>사업자유형</span>
                                    </th>
                                    <c:set var="searchRdpMstBusiClsCodeList" value="${codes.PLANNER_BUSINESS_CLASS }"/>
                                    <td>
                                        <input type="radio" id="searchRdpMstBusiCls0" class="radio" name="searchRdpMstBusiCls" value="" <c:if test="${empty commandMap.searchRdpMstBusiCls }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstBusiCls0">전체</label>
                                        <c:if test="${not empty searchRdpMstBusiClsCodeList}">
                                            <c:forEach var="row" items="${searchRdpMstBusiClsCodeList}" varStatus="i">
                                                <label for="searchRdpMstBusiCls<c:out value="${i.index + 1 }"/>">
                                                    <input type="radio" name="searchRdpMstBusiCls" id="searchRdpMstBusiCls<c:out value="${i.index + 1 }"/>" class="radio" value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchRdpMstBusiCls }">checked="checked"</c:if>/>
                                                    <span><c:out value="${row.CMN_COM_NM }"/></span>
                                                </label>
                                            </c:forEach>
                                        </c:if>
                                    </td>
                                    <th>
                                        <span>자격구분</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="searchRdpMstState0" class="radio" name="searchRdpMstState" value="" <c:if test="${empty commandMap.searchRdpMstState }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstState0">전체</label>
                                        <input type="radio" id="searchRdpMstState1" class="radio" name="searchRdpMstState" value="<c:out value="${Code.PLANNER_STATE_ACTIVE }" />" <c:if test="${commandMap.searchRdpMstState eq Code.PLANNER_STATE_ACTIVE }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstState1">정상</label>
                                        <input type="radio" id="searchRdpMstState2" class="radio" name="searchRdpMstState" value="<c:out value="${Code.PLANNER_STATE_STOP }" />" <c:if test="${commandMap.searchRdpMstState eq Code.PLANNER_STATE_STOP }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstState2">정지</label>
                                        <input type="radio" id="searchRdpMstState3" class="radio" name="searchRdpMstState" value="<c:out value="${Code.PLANNER_STATE_REQUEST_RELEASE }" />" <c:if test="${commandMap.searchRdpMstState eq Code.PLANNER_STATE_REQUEST_RELEASE }">checked="checked"</c:if>/>
                                        <label for="searchRdpMstState3">해제요청</label>
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
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchRdpMstMemNm" value="<c:out value="${commandMap.searchRdpMstMemNm }"/>" />
                        <input type="hidden" name="searchRdpMstMail" value="<c:out value="${commandMap.searchRdpMstMail }"/>" />
                        <input type="hidden" name="searchRdpMstHp3" value="<c:out value="${commandMap.searchRdpMstHp3 }"/>" />
                        <input type="hidden" name="searchRdpMstDmYn" value="<c:out value="${commandMap.searchRdpMstDmYn }"/>" />
                        <input type="hidden" name="searchRdpMstDmNo" value="<c:out value="${commandMap.searchRdpMstDmNo }"/>" />
                        <input type="hidden" name="searchRdpMstBusiCls" value="<c:out value="${commandMap.searchRdpMstBusiCls }"/>" />
                        <input type="hidden" name="searchRdpMstState" value="<c:out value="${commandMap.searchRdpMstState }"/>" />
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
                        <div class="box-scroll-table">
                            <table cellspacing="0" class="table-col table-b">
                                <colgroup>
                                    <col style="width: 3%;" />
                                    <col style="width: auto;" />
                                    <col style="width: auto;" />
                                    <col style="width: auto;" />
                                    <col style="width: auto;" />
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
                                        <th>고유번호</th>
                                        <th>플래너번호</th>
                                        <th>이름</th>
                                        <th>연락처</th>
                                        <th>아이디</th>
                                        <th>사업자유형</th>
                                        <th>번호</th>
                                        <th>주소</th>
                                        <th>계좌정보</th>
                                        <th>홍보사이트</th>
                                        <th>자격</th>
                                        <th>등급</th>
                                        <th>활동 시작일</th>
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
                                                    <td>
                                                        <c:out value="${row.RDP_MST_IDX }"/>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="list-title" data-rdp_mst_idx="<c:out value="${row.RDP_MST_IDX }"/>">
                                                            <c:out value="${row.RDP_MST_NO }"/>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_MEM_NM }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_HP1 }"/>-<c:out value="${row.RDP_MST_HP2 }"/>-<c:out value="${row.RDP_MST_HP3 }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_ID }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_BUSI_CLS_NM }" />
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${row.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                                                                <c:out value="${row.RDP_MST_SSN1 }" />-<c:out value="${row.RDP_MST_SSN2 }" />
                                                            </c:when>
                                                            <c:when test="${row.RDP_MST_BUSI_CLS ne Code.PLANNER_BUSINESS_CLASS_PRIVATE }">
                                                                <c:out value="${row.RDP_MST_BUSI1 }" />-<c:out value="${row.RDP_MST_BUSI2 }" />-<c:out value="${row.RDP_MST_BUSI3 }" />
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        (<c:out value="${row.RDP_MST_ZIP_CODE }" />)<c:out value="${row.RDP_MST_DR_ADDR1 }" />&nbsp;<c:out value="${row.RDP_MST_DR_ADDR2 }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_BNK_CD_NM }" /> / <c:out value="${row.RDP_MST_BNK_ACT }" /> / <c:out value="${row.RDP_MST_ACT_HDR }" />
                                                    </td>
                                                    <td>
                                                        <c:forEach var="adr" items="${row.RDP_SIT_ADR_LIST }">
                                                            <c:out value="${adr.RDP_SIT_ADR }" /><br/>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_STATE_NM }" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_LVL_NM }" />
                                                    </td>
                                                    <td>
                                                        <ui:formatDate value="${row.RDP_MST_ATV_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
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
                        </div>
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
            $frm = $wrapper.find("#frm"),
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
            // 플래너 번호
            $wrapper.on("click", ".list-title", function() {
                $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
            });
            // 엑셀 다운로드
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
        });
    </script>
</body>
</html>
