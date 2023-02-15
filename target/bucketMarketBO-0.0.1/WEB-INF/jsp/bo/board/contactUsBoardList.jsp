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
                        <span>제휴문의</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: auto;"/>
                                <col style="width: auto;"/>
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
                                        <input type="text" name="searchStartDate" id="searchStartDate" class="text date" value="<c:out value="${commandMap.searchStartDate }"/>" data-target-end="#searchEndDate"/>
                                        ~
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="searchEndDate" id="searchEndDate" class="text date" value="<c:out value="${commandMap.searchEndDate }"/>" data-target-start="#searchStartDate"/>
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
                                        <input type="text" class="text xlarge" name="searchCttUsTitleAndContents" id="searchCttUsTitleAndContents" value="<c:out value="${commandMap.searchCttUsTitleAndContents }"/>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchCttUsRepYn" id="searchCttUsRepYn0" class="radio" <c:if test="${empty commandMap.searchCttUsRepYn }">checked="checked"</c:if> value=""/>
                                        <label for="searchCttUsRepYn0">전체</label>
                                        <input type="radio" name="searchCttUsRepYn" id="searchCttUsRepYn1" class="radio" <c:if test="${commandMap.searchCttUsRepYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                        <label for="searchCttUsRepYn1">처리대기</label>
                                        <input type="radio" name="searchCttUsRepYn" id="searchCttUsRepYn2" class="radio" <c:if test="${commandMap.searchCttUsRepYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                        <label for="searchCttUsRepYn2">처리완료</label>
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
                        <input type="hidden" name="CTT_US_IDX" value=""/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchCttUsTitleAndContents" value="<c:out value="${commandMap.searchCttUsTitleAndContents }"/>"/>
                        <input type="hidden" name="searchCttUsRepYn" value="<c:out value="${commandMap.searchCttUsRepYn }"/>"/>
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage"/>
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }"/></strong> 건, <c:out value="${paging.cPage }"/> of <c:out value="${paging.totalPageCount }"/> page)
                                </span>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                        <table cellspacing="0" class="table-col table-b">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 3%;"/>
                                <col style="width: 10%;"/>
                                <col style="width: 10%;"/>
                                <col style="width: 8%;"/>
                                <col style="width: 12%;"/>
                                <col style="width: auto;"/>
                                <col style="width: 14%;"/>
                                <col style="width: 7%;"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>회사명</th>
                                    <th>회사소속</th>
                                    <th>문의자명</th>
                                    <th>연락처</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody id="list-field">
                                <c:choose>
                                    <c:when test="${not empty list }">
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td>
                                                    <c:out value="${paging.listNum - i.index }"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.CTT_US_CPN }"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.CTT_US_CPN_DIV }"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.CTT_US_NM }"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.CTT_US_HP1 }"/>-<c:out value="${row.CTT_US_HP2 }"/>-<c:out value="${row.CTT_US_HP3 }"/>
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="list-title" data-ctt_us_idx="<c:out value="${row.CTT_US_IDX }"/>">
                                                        <c:out value="${row.CTT_US_TITLE }"/>
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.CTT_US_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.CTT_US_REP_YN eq 'N' ? '처리대기' : '처리완료' }"/>
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
                            <!-- section pagination -->
                            <h4 class="sr-only">목록 페이징</h4>
                            <div class="wrap">
                                <!-- 개발 시 wrap 이하 모듈 시작 -->
                                <ui:paging paging="${paging }" jsFunction="goPage"/>
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
            <%-- 내용 a Tag 클릭 이벤트 --%>
            $frm.on("click", ".list-title", function() {
                $frm.find("input[name='CTT_US_IDX']").val($(this).data("ctt_us_idx"));
                $frm.postPop($.action.popup("Edit"), "commentBoardEditPopup", "width=1200,height=600,left=10,top=10");
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $searchForm.on("keydown", "input[type='text']", function(e) {
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