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
                        <span>DB상담조회</span>
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
                                        <span>신청일</span>
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
                                        <span>키워드</span>
                                    </th>
                                    <td>
                                        <select class="select" id="searchKeywordType" name="searchKeywordType" style="width: 220px;">
                                            <option value="searchRdpMstNo" <c:if test="${commandMap.searchKeywordType eq 'searchRdpMstNo'}">selected="selected"</c:if>>레디플래너 번호(ex.PLUYZU4UIV)</option>
                                            <option value="searchRdpMstIdx" <c:if test="${commandMap.searchKeywordType eq 'searchRdpMstIdx'}">selected="selected"</c:if>>레디플래너 고유번호(ex.22)</option>
                                            <option value="searchMemNm" <c:if test="${commandMap.searchKeywordType eq 'searchMemNm'}">selected="selected"</c:if>>고객명</option>
                                            <option value="searchCell" <c:if test="${commandMap.searchKeywordType eq 'searchCell'}">selected="selected"</c:if>>연락처 뒤 4자리</option>
                                            <option value="searchDlccNo" <c:if test="${commandMap.searchKeywordType eq 'searchDlccNo'}">selected="selected"</c:if>>DLCC 회원번호</option>
                                            <option value="searchDlccCode" <c:if test="${commandMap.searchKeywordType eq 'searchDlccCode'}">selected="selected"</c:if>>DLCC 상품코드(ex.LK)</option>
                                        </select>
                                        <input type="text" name="searchKeywordValue" id="searchKeywordValue" class="text large" value="<c:out value="${commandMap.searchKeywordValue }"/>" />
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
                        <input type="hidden" name="searchRdpMstNo" value="<c:out value="${commandMap.searchRdpMstNo }"/>" />
                        <input type="hidden" name="searchRdpMstIdx" value="<c:out value="${commandMap.searchRdpMstIdx }"/>" />
                        <input type="hidden" name="searchMemNm" value="<c:out value="${commandMap.searchMemNm }"/>" />
                        <input type="hidden" name="searchCell" value="<c:out value="${commandMap.searchCell }"/>" />
                        <input type="hidden" name="searchDlccNo" value="<c:out value="${commandMap.searchDlccNo }"/>" />
                        <input type="hidden" name="searchDlccCode" value="<c:out value="${commandMap.searchDlccCode }"/>" />
                        <input type="hidden" name="searchKeywordType"  value="<c:out value="${commandMap.searchKeywordType }"/>" />                        
                        <input type="hidden" name="searchKeywordValue" value="<c:out value="${commandMap.searchKeywordValue }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <span>업데이트 시간 : 
                                    <ui:formatDate value="${updateDate }" pattern="yyyy.MM.dd HH:ss"/>
                                </span>&nbsp;&nbsp;
                                <c:if test="${not isScm && isSuper}">
                                    <a href="javascript:;" id="goUpdate" class="button small primary">
                                        <span>갱신</span>
                                    </a>
                                </c:if>
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
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                    <col style="width: 8%;" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>회원번호</th>
                                        <th>고객명</th>
                                        <th>연락처</th>
                                        <th>상품명</th>
                                        <th>등록일</th>
                                        <th>레디플래너 번호</th>
                                        <th>레디플래너 고유번호</th>
                                        <th>레디플래너 이름</th>
                                        <th>영업사원</th>
                                        <th>추천인</th>
                                        <th>상담결과</th>
                                        <th>상담메모</th>
                                        <th>회원상태</th>
                                        <th>납입회차</th>
                                        <th>UTM_SOURCE</th>
                                        <th>UTM_MEDIUM</th>
                                        <th>UTM_CAMPAIGN</th>
                                        <th>UTM_TERM</th>
                                        <th>UTM_CONTENT</th>
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
                                                       <c:out value="${row.ACCNT_NO }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.MEM_NM }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.CELL }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PRD_MST_NM }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.REG_DM }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_NO }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_IDX }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.RDP_MST_MEM_NM }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.SELLER_NAME }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.ORD_MST_REC_TXT}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.COUNSELL_RESULT }"/>
                                                    </td>
                                                    <td>
                                                        <a href="javascript:;" class="list-title" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                            <c:out value="${row.COUNSELL_MEMO }"/>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.KSTBIT }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.PAY_NO }"/>
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.UTM_SOURCE}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.UTM_MEDIUM}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.UTM_CAMPAIGN}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.UTM_TERM}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${row.UTM_CONTENT}" />
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
            // 메모 상세
            $wrapper.on("click", ".list-title", function() {
                $.common.popup.memo.detail($(this).data("ord_mst_idx"));
            });
            // 엑셀 다운로드
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload());
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            var update_click = false;
            $wrapper.on("click", "#goUpdate", function() {
                if(update_click == false) {
                    update_click = true;
                    $.postJsonAjax($.action.ajax("UpdateData"), {}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                            location.reload();
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                        update_click = false;
                    });
                }else {
                    alert("정보를 업데이트중입니다.");
                }
            });
        });
    </script>
</body>
</html>
