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
                        <span>팝업관리</span>
                    </h2>
                    <h3 class="title">
                        <span>목록</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <colgroup>
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                                <col style="width: 10%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>노출기간</span>
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
                                        <span>제목</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" id="searchPopMstTitle" name="searchPopMstTitle" value="<c:out value="${commandMap.searchPopMstTitle }"/>" />
                                    </td>
                                    <th>
                                        <span>전시채널</span>
                                    </th>
                                    <td>
                                        <input type="radio" id="searchPopMstChnGbn0" name="searchPopMstChnGbn" class="checkbox" value="" <c:if test="${empty commandMap.searchPopMstChnGbn }">checked="checked"</c:if> />
                                        <label for="searchPopMstChnGbn0">전체</label>
                                        <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
                                            <input type="radio" id="searchPopMstChnGbn1" name="searchPopMstChnGbn" class="checkbox" value="<c:out value="${device.key }"/>" <c:if test="${device.key eq commandMap.searchPopMstChnGbn }">checked="checked"</c:if> />
                                            <label for="searchPopMstChnGbn1"><c:out value="${device.value }"/></label>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>노출여부</span>
                                    </th>
                                    <td colspan="3">
                                        <input type="radio" id="searchPopMstUseYn0" class="radio" name="searchPopMstUseYn" value="" <c:if test="${empty commandMap.searchPopMstChnGbn }">checked="checked"</c:if>/>
                                        <label for="searchPopMstUseYn0">전체</label>
                                        <input type="radio" id="searchPopMstUseYn1" class="radio" name="searchPopMstUseYn" value="Y" <c:if test="${commandMap.searchPopMstChnGbn eq 'Y' }">checked="checked"</c:if>/>
                                        <label for="searchPopMstUseYn1">노출</label>
                                        <input type="radio" id="searchPopMstUseYn2" class="radio" name="searchPopMstUseYn" value="N" <c:if test="${commandMap.searchPopMstChnGbn eq 'N' }">checked="checked"</c:if>/>
                                        <label for="searchPopMstUseYn2">노출안함</label>
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
                        <input type="hidden" name="POP_MST_IDX" value="" />
                        <input type="hidden" name="POP_MST_CHN_GBN" value="" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchPopMstTitle" value="<c:out value="${commandMap.searchPopMstTitle }"/>" />
                        <input type="hidden" name="searchPopMstChnGbn" value="<c:out value="${commandMap.searchPopMstChnGbn }"/>" />
                        <input type="hidden" name="searchPopMstUseYn" value="<c:out value="${commandMap.searchPopMstUseYn }"/>" />
                        <div class="grid section-button-list">
                            <!-- 목록 상단 버튼 -->
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                                <span class="pages">
                                    (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                                </span>
                            </div>
                            <div class="col-1-2 text-right">
                                <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
                                    <a href="javascript:;" class="button small primary goForm" data-pop_mst_chn_gbn="<c:out value="${device.key }"/>">
                                        <span><c:out value="${device.value }"/> 팝업등록</span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 7%;" />
                                <col style="width: auto;" />
                                <col style="width: 20%;" />
                                <col style="width: 10%;" />
                                <col style="width: 14%;" />
                                <col style="width: 8%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>전시채널</th>
                                    <th>팝업제목</th>
                                    <th>노출기간</th>
                                    <th>미리보기</th>
                                    <th>등록일</th>
                                    <th>노출여부</th>
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
                                                    <c:out value="${Const.DEVICE[row.POP_MST_CHN_GBN] }"/>
                                                </td>
                                                <td class="left">
                                                    <a href="javascript:;" class="list-title" data-pop_mst_idx="<c:out value="${row.POP_MST_IDX }"/>">
                                                        <c:out value="${row.POP_MST_TITLE }" />
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.POP_MST_ST_DT }" pattern="yyyy.MM.dd" />
                                                    ~
                                                    <ui:formatDate value="${row.POP_MST_ED_DT }" pattern="yyyy.MM.dd" />
                                                </td>
                                                <td>
                                                    <a href="javascript:;" class="button xsmall info image-preview" data-cmm_fle_idx="<c:out value="${row.CMM_FLE_IDX }"/>">
                                                        <span>미리보기</span>
                                                    </a>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.POP_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                                                </td>
                                                <td>
                                                    <c:out value="${row.POP_MST_USE_YN eq 'Y' ? '노출' : '노출안함' }" />
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
                $frm = $wrapper.find("#frm")
                $searchForm = $wrapper.find("#searchForm");
            <%-- 등록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", ".goForm", function() {
                $frm.find("input[name='POP_MST_CHN_GBN']").val($(this).data("pop_mst_chn_gbn"));
                $frm.postPop($.action.popup("Form"), "popupDisplayFormPopup", "width=1300,height=680,left=10,top=10");
            });
            <%-- 제목 a Tag 클릭 이벤트 --%>
            $wrapper.on("click", ".list-title", function() {
                $frm.find("input[name='POP_MST_IDX']").val($(this).data("pop_mst_idx"));
                $frm.postPop($.action.popup("Edit"), "popupDisplayEditPopup", "width=1300,height=680,left=10,top=10");
            });
            <%-- 미리보기 버튼 클릭 이벤트 --%>
            $wrapper.on("click", ".image-preview", function() {
                $.common.popup.display.preview($(this).data("cmm_fle_idx"), "팝업");
            });
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "#searchPopMstTitle", function(e)
                    {
                if (e.keyCode == 13) {
                    $("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트--%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='pageSize']").val($frm.find("select[name='pageSize']").val());
                $searchForm.postSubmit($.action.list());
            });
            <%-- 페이지 이동--%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.list());
            };
        });
    </script>
</body>
</html>
