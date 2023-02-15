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
                        <span>1:1문의</span>
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
                                        <span>키워드 검색</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchMemAdvTitleAndContents" id="searchMemAdvTitleAndContents" class="text serach-text xlarge" value="<c:out value="${commandMap.searchMemAdvTitleAndContents }"/>" placeholder="제목 또는 내용에서 찾으시는 단어를 입력하세요." maxlength="40"/>
                                    </td>
                                    <th>
                                        <span>문의유형</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchMemAdvQstType" id="searchMemAdvQstType">
                                            <option value="">전체</option>
                                            <c:if test="${not empty codeList }">
                                                <c:forEach var="row" items="${codeList }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${row.CMN_COM_IDX eq commandMap.searchMemAdvQstType }">selected="selected"</c:if>>
                                                        <c:out value="${row.CMN_COM_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>이름</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchMemMstMemNm" id="searchMemMstMemNm" class="text serach-text xlarge" value="<c:out value="${commandMap.searchMemMstMemNm }"/>" maxlength="20"/>
                                    </td>
                                    <th>
                                        <span>연락처 뒤 4자리</span>
                                    </th>
                                    <td>
                                        <input type="text" name="searchMemAdvHp3" id="searchMemAdvHp3" class="text serach-text xlarge onlyNumber" value="<c:out value="${commandMap.searchMemAdvHp3 }"/>" maxlength="4" />
                                    </td>
                                    
                                </tr>
                                <tr>
                                    
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td colspan="3">
                                        <input type="radio" name="searchMemAdvRplYn" id="searchMemAdvRplYn0" class="radio" value="" <c:if test="${empty commandMap.searchMemAdvRplYn }">checked="checked"</c:if> />
                                        <label for="searchMemAdvRplYn0">전체</label>
                                        <input type="radio" name="searchMemAdvRplYn" id="searchMemAdvRplYn1" class="radio" value="N" <c:if test="${commandMap.searchMemAdvRplYn eq 'N'}">checked="checked"</c:if> />
                                        <label for="searchMemAdvRplYn1">답변대기</label>
                                        <input type="radio" name="searchMemAdvRplYn" id="searchMemAdvRplYn2" class="radio" value="Y" <c:if test="${commandMap.searchMemAdvRplYn eq 'Y'}">checked="checked"</c:if> />
                                        <label for="searchMemAdvRplYn2">답변완료</label>
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
                        <input type="hidden" name="MEM_ADV_IDX" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchMemAdvTitleAndContents" value="<c:out value="${commandMap.searchMemAdvTitleAndContents }"/>" />
                        <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>" />
                        <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>" />
                        <input type="hidden" name="searchMemAdvHp3" value="<c:out value="${commandMap.searchMemAdvHp3 }"/>" />
                        <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                        </div>
                        <!-- // 목록 상단 버튼 -->
                        <table cellspacing="0" class="table-col table-b">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 10%;" />
                                <col style="width: 12%;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 14%;" />
                                <col style="width: 14%;" />
                                <col style="width: 7%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>문의유형</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>답변일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty list }">
                                        <c:set var="listNum" value="${paging.listNum}" />
                                        <c:forEach var="row" items="${list }" varStatus="i">
                                            <tr>
                                                <td>
                                                    <c:out value="${paging.listNum - i.index }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.MEM_MST_MEM_NM }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.MEM_ADV_HP1 }" />-<c:out value="${row.MEM_ADV_HP2 }" />-<c:out value="${row.MEM_ADV_HP3 }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.MEM_ADV_QST_TYPE_NM }" />
                                                </td>
                                                <td class="left">
                                                    <a href="javascript:;" class="list-title" data-mem_adv_idx="<c:out value="${row.MEM_ADV_IDX }" />">
                                                        <c:out value="${row.MEM_ADV_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.MEM_ADV_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.MEM_ADV_RPL_YN eq 'Y' ? '답변완료' : '미답변' }" />
                                                </td>
                                            </tr>
                                            <c:set var="listNum" value="${listNum-1}" />
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
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm");
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='MEM_ADV_IDX']").val($(this).data("mem_adv_idx"));
                $frm.postPop($.action.popup("Edit"), "inquiryBoardEditPopup", "width=1200,height=600,left=10,top=10");
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "input[type='text']", function(e) {
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
