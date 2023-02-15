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
                        <span>이벤트 상세</span>
                    </h2>
                    <div class="tab-list">
                        <ul>
                            <li>
                                <a href="javascript:;" class="event-type-tab" data-type="edit">
                                    <span>이벤트 정보</span>
                                </a>
                            </li>
                            <li class="in">
                                <a href="javascript:;" class="event-type-tab" data-type="reply-list">
                                    <span>댓글</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                        <input type="hidden" name="replyPageSize" value="<c:out value="${commandMap.replyPageSize }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchEvtMstTitle" value="<c:out value="${commandMap.searchEvtMstTitle }"/>" />
                        <input type="hidden" name="searchEvtMstPsnYn" value="<c:out value="${commandMap.searchEvtMstPsnYn }"/>" />
                        <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>" />
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
                                        <span>키워드 검색</span>
                                    </th>
                                    <td>
                                        <input type="text" class="text xlarge" name="searchEvtRplCts" id="searchEvtRplCts" value="<c:out value="${commandMap.searchEvtRplCts }"/>" />
                                    </td>
                                    <th>
                                        <span>상태</span>
                                    </th>
                                    <td>
                                        <input type="radio" name="searchEvtRplUseYn" id="searchEvtRplUseYn0" class="radio" <c:if test="${empty commandMap.searchEvtRplUseYn }">checked="checked"</c:if> value="" />
                                        <label for="searchEvtRplUseYn0">전체</label>
                                        <input type="radio" name="searchEvtRplUseYn" id="searchEvtRplUseYn1" class="radio" <c:if test="${commandMap.searchEvtRplUseYn eq 'Y' }">checked="checked"</c:if> value="Y" />
                                        <label for="searchEvtRplUseYn1">노출</label>
                                        <input type="radio" name="searchEvtRplUseYn" id="searchEvtRplUseYn2" class="radio" <c:if test="${commandMap.searchEvtRplUseYn eq 'N' }">checked="checked"</c:if> value="N" />
                                        <label for="searchEvtRplUseYn2">노출안함</label>
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
                        <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                        <input type="hidden" name="replyCPage" value="<c:out value="${commandMap.replyCPage }"/>" />
                        <input type="hidden" name="searchEvtRplCts" value="<c:out value="${commandMap.searchEvtRplCts }"/>" />
                        <input type="hidden" name="searchEvtRplUseYn" value="<c:out value="${commandMap.searchEvtRplUseYn }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                        <input type="hidden" name="searchEvtMstTitle" value="<c:out value="${commandMap.searchEvtMstTitle }"/>" />
                        <input type="hidden" name="searchEvtMstPsnYn" value="<c:out value="${commandMap.searchEvtMstPsnYn }"/>" />
                        <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>" />
                        <div class="grid section-button-list">
                            <div class="col-1-2 text-left">
                                <ui:pageSizeBox value="${paging.pageSize }" name="replyPageSize" jsFunction="goPage" />
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
                                <col style="width: 8%;" />
                                <col style="width: 13%;" />
                                <col style="width: auto;" />
                                <col style="width: 10%;" />
                                <col style="width: 14%;" />
                                <col style="width: 11%;" />
                                <col style="width: 15%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>댓글 내용</th>
                                    <th>이미지</th>
                                    <th>작성일</th>
                                    <th>개인정보동의</th>
                                    <th>마케팅수신동의</th>
                                    <th>노출</th>
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
                                                    <c:out value="${row.EVT_RPL_NM }" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.EVT_RPL_HP }" />
                                                </td>
                                                <td class="left">
                                                    <c:out value="${row.EVT_RPL_CTS }" />
                                                </td>
                                                <td>
                                                    <c:if test="${not empty row.CMM_FLE_IDX }">
                                                        <a href="javascript:;" class="button xsmall info image-preview" data-cmm_fle_idx="<c:out value="${row.CMM_FLE_IDX }"/>">
                                                            <span>미리보기</span>
                                                        </a>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <ui:formatDate value="${row.EVT_RPL_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.EVT_RPL_PSN_YN eq 'Y' ? '수집' : '수집안함' }" />
                                                </td>                                                
                                                <td>
                                                    <c:out value="${row.EVT_RPL_MKT_YN eq 'Y' ? '수집' : '수집안함' }" />
                                                </td>
                                                <td>
                                                    <input type="radio" name="EVT_RPL_USE_YN_<c:out value="${i.index }"/>" id="EVT_RPL_USE_YN_<c:out value="${i.index }"/>_0" class="radio" value="Y" <c:if test="${empty row.EVT_RPL_USE_YN or row.EVT_RPL_USE_YN eq 'Y'}">checked="checked"</c:if> data-evt_rpl_idx="<c:out value="${row.EVT_RPL_IDX }"/>"/>
                                                    <label for="EVT_RPL_USE_YN_<c:out value="${i.index }"/>_0">노출</label>
                                                    <input type="radio" name="EVT_RPL_USE_YN_<c:out value="${i.index }"/>" id="EVT_RPL_USE_YN_<c:out value="${i.index }"/>_1" class="radio" value="N" <c:if test="${row.EVT_RPL_USE_YN eq 'N'}">checked="checked"</c:if> data-evt_rpl_idx="<c:out value="${row.EVT_RPL_IDX }"/>"/>
                                                    <label for="EVT_RPL_USE_YN_<c:out value="${i.index }"/>_1">노출안함</label>
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
                            <div class="wrap text-right">
                                <a href="javascript:;" id="save" class="button samll primary">
                                    <span>저장</span>
                                </a>
                                <a href="javascript:;" id="goList" class="button samll">
                                    <span>목록</span>
                                </a>
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
            <%-- 키워드 검색 필드 엔터 이벤트 --%>
            $wrapper.on("keydown", "#searchEvtRplCts", function(e) {
                if (e.keyCode == 13) {
                    $("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#search", function() {
                $searchForm.find("input[name='replyPageSize']").val($frm.find("select[name='replyPageSize']").val());
                $searchForm.postSubmit($.action.list("Reply"));
            });
            <%-- 엑셀다운로드 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload("Reply"));
            });
            <%-- 미리보기 버튼 클릭 이벤트 --%>
            $wrapper.off("click", ".image-preview").on("click", ".image-preview", function() {
                $.common.popup.display.preview($(this).data("cmm_fle_idx"), "")
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='replyCPage']").val(cPage);
                $frm.postSubmit($.action.list("Reply"));
            };
            <%-- 탭 클릭 이벤트  --%>
            $wrapper.on("click", ".event-type-tab", function() {
                if ($(this).data("type") == "edit") {
                    if (confirm("변경사항이 저장되지 않을 수 있습니다.\n이동하시겠습니까?")) {
                        $searchForm.postSubmit($.action.edit());
                    }
                }
            });
            <%-- 목록 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#goList", function() {
                if (confirm("변경사항이 저장되지 않을 수 있습니다.\n이동하시겠습니까?")) {
                    $searchForm.postSubmit($.action.list());
                }
            });
            <%-- 저장 버튼 클릭 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                var $target = $frm.find("input[name^='EVT_RPL_USE_YN']:checked");
                if (confirm("저장 하시겠습니까?")) {
                    var array = new Array();
                    $target.each(function () {
                        var $this = $(this),
                        param = new Object();
                        param.EVT_RPL_IDX = $this.data("evt_rpl_idx");
                        param.EVT_RPL_USE_YN = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("ReplyModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>