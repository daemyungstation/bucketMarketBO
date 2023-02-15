<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>결합상품 연동</span>
                    </h2>
                    <h3 class="title">
                        <span>검색</span>
                    </h3>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 20%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>키워드검색</span>
                                    </th>
                                    <td>
                                        <select class="select" name="searchType" id="searchType">
                                            <option value="P" <c:if test="${commandMap.searchType eq 'P' }">selected="selected"</c:if>>상품코드</option>
                                            <option value="M" <c:if test="${commandMap.searchType eq 'M' }">selected="selected"</c:if>>모델분류명</option>
                                        </select>
                                        <input type="text" class="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>" maxlength="15" />                                    
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
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchComNm" value="<c:out value="${commandMap.searchComNm }"/>"/>
                        <div class="grid section-button-list">
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
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>NO</th>
                                <th>상품코드</th>
                                <th>모델분류</th>
                                <th>모델명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <input type="radio" name="radio" id="radio<c:out value="${i.index }"/>" class="radio"/>
                                                <span class="data">
                                                    <input type="hidden" class="PROD_CD" value="<c:out value="${row.PROD_CD }"/>" />
                                                    <input type="hidden" class="PROD_KIND" value="<c:out value="${row.PROD_KIND }"/>" />
                                                    <input type="hidden" class="MODEL_CD" value="<c:out value="${row.MODEL_CD }"/>" />
                                                    <input type="hidden" class="MODEL_CL_NM" value="<c:out value="${row.MODEL_CL_NM }"/>" />
                                                    <input type="hidden" class="MODEL_NM" value="<c:out value="${row.MODEL_NM }"/>" />
                                                    <input type="hidden" class="PROD_AMT" value="<c:out value="${row.PROD_AMT }"/>" />
                                                    <input type="hidden" class="MON_PAY_AMT" value="<c:out value="${row.MON_PAY_AMT }"/>" />
                                                    <input type="hidden" class="EXPR_NO" value="<c:out value="${row.EXPR_NO }"/>" />
                                                    <input type="hidden" class="REL_AMT" value="<c:out value="${row.REL_AMT }"/>" />
                                                    <input type="hidden" class="REL_CNT" value="<c:out value="${row.REL_CNT }"/>" />
                                                    <input type="hidden" class="ZERO_YN" value="<c:out value="${row.ZERO_YN }"/>" />
                                                </span>
                                            </td>
                                            <td>
                                                    <c:out value="${paging.listNum - i.index }" />
                                            </td>                                            
                                            <td>
                                                <label for="radio<c:out value="${i.index }"/>">
                                                    <c:out value="${row.PROD_CD }"/>
                                                </label>
                                            </td>
                                            <td>
                                                <label for="radio<c:out value="${i.index }"/>">
                                                    <c:out value="${row.MODEL_CL_NM }"/>
                                                </label>
                                            </td>
                                            <td>
                                                <label for="radio<c:out value="${i.index }"/>">
                                                    <c:out value="${row.MODEL_NM }"/>
                                                </label>
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
                    <!-- // table -->
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
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm"),
                $searchForm = $popup.find("#searchForm");
            <%-- 검색 엔터 이벤트 --%>
            $searchForm.find("input[type='text']").keydown(function (e) {
                if (e.keyCode == 13) {
                    $wrapper.find("#search").trigger("click");
                    return false;
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $popup.on("click", "#search", function() {
                $searchForm.postSubmit($.action.common.popup("dlccSearch"));
            });
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.common.popup("dlccSearch"));
            };
            <%-- 선택버튼 클릭 이벤트 --%>
            $popup.on("click", "#choice", function() {
                var $radio = $popup.find(".radio:checked");
                if ($radio.length == 0) {
                    alert("결합상품를 선택해 주세요.");
                    return;
                }
                var data = new Object();
                $radio.siblings(".data").children("input[type='hidden']").each(function () {
                    var $this = $(this); 
                    data[$this.attr("class")] = $this.val();
                });
                opener.parent.windowPopupCallback("common.popup.dlcc.search", data);
                self.close();
            });
        });
    </script>
</body>
</html>
