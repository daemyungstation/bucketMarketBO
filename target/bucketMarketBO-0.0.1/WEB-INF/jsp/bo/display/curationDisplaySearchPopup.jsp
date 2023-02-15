<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="display" data-menu_subclass="curationDisplay">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <i class="icon"></i>
                <h2 class="title">
                    <span>키워드 검색</span>
                </h2>
                <div class="grid section-button-list">
                    <div class="col-1-1 text-left">
                        <small class="desc">
                            <i class="require"><em>필수입력</em></i>자모 선택 시 상품에 등록된 검색키워드 목록이 출력됩니다.
                        </small>
                    </div>
                </div>
                <form name="searchForm" id="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                    <input type="hidden" name="searchInitialSound" value="<c:out value="${commandMap.searchInitialSound }"/>"/>
                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                        <colgroup>
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <c:forEach var="initialSound" items="${Const.INITIAL_SOUNDS }" varStatus="i">
                                        <c:choose>
                                            <c:when test="${(empty commandMap.searchInitialSound and i.first) or (commandMap.searchInitialSound eq initialSound.key) }">
                                                <a href="javascript:;" class="button xsmall primary" data-initial_sound="<c:out value="${initialSound.key }"/>">
                                                    <span><c:out value="${initialSound.key }"/></span>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:;" class="button xsmall info" data-initial_sound="<c:out value="${initialSound.key }"/>">
                                                    <span><c:out value="${initialSound.key }"/></span>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <form name="frm" id="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="searchChar" value="<c:out value="${commandMap.searchChar }"/>"/>
                    <div class="grid section-button-list">
                        <!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" jsFunction="goPage" />
                            <span class="pages">
                                (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong> 건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                        </div>
                    </div>
                </form>
                <table cellspacing="0" class="table-col table-b">
                    <colgroup>
                        <col style="width: 3%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" class="checkbox check-all"/>
                            </th>
                            <th>키워드</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list }">
                                <c:forEach var="row" items="${list }" varStatus="i">
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox check-row" value="<c:out value="${row.PRD_MST_KWD }" />"/>
                                        </td>
                                        <td>
                                            <c:out value="${row.PRD_MST_KWD }" />
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
                    <div class="wrap text-right">
                        <a href="javascript:;" id="choice" class="button samll primary">
                            <span>선택</span>
                        </a>
                        <a href="javascript:self.close();" class="button samll">
                            <span>닫기</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm"),
                $searchForm = $popup.find("#searchForm");
            
            <%-- 체크박스 변경 이벤트 --%>
            $.checkBoxSelect("check-all", "check-row");
            <%-- 초성 버튼 클릭 이벤트 --%>
            $searchForm.on("click", ".button", function() {
                 var $this = $(this);
                 $searchForm.find("input[name='searchInitialSound']").val($this.data("initial_sound"));
                 $searchForm.postSubmit($.action.popup("Search"));
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.popup("Search"));
            };
            <%-- 선택버튼 클릭 이벤트 --%>
            $popup.on("click", "#choice", function() {
                var $checkbox = $popup.find(".check-row:checked");
                if ($checkbox.length == 0) {
                    alert("키워드를 선택해주세요.");
                    return;
                }
                var array = new Array();
                $checkbox.each(function () {
                    array.push(this.value);
                });
                opener.parent.windowPopupCallback("display.curation.search", array);
                self.close();
            });
        });
    </script>
</body>
</html>
