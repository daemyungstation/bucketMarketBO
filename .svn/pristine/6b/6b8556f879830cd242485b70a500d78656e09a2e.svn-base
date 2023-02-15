<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerGrade">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
            
                <%-- 타이틀 --%>
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span><c:out value="${info.RDP_LVL_NM }" /> 등급회원 조회</span>
                    </h2>
                </div>
                
                <h3 class="title">
                    <span>목록</span>
                </h3>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="searchRdpLvlIdx" value="<c:out value="${commandMap.searchRdpLvlIdx }"/>" />
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
                            <col style="width: 4%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 8%;" />
                            <col style="width: 12%;" />
                            <col style="width: 5%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>플래너번호</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>총 접수건수</th>
                                <th>총 가입대기건수</th>
                                <th>총 가입건수</th>
                                <th>총 해약건수</th>
                                <th>총 예상수익</th>
                                <th>아이디</th>
                                <th>소속</th>
                                <th>사업자유형</th>
                                <th>자격</th>
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
                                                <c:out value="${row.TOTAL_RECEIPT }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.TOTAL_WAITING_TO_JOIN }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.TOTAL_JOIN }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.TOTAL_CANCEL }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.TOTAL_EXPECTED_RETURN }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_ID }" />
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${row.RDP_MST_DM_YN eq 'Y' }">임직원(<c:out value="${row.RDP_MST_DM_NO }"/>)</c:when>
                                                    <c:when test="${row.RDP_MST_DM_YN eq 'N' }">일반</c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_BUSI_CLS_NM }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.RDP_MST_STATE_NM }" />
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
                
                <%-- 저장/닫기 --%>
                <div class="grid section-button-search">
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <%@ include file="/WEB-INF/jsp/common/template/zipCode.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm"),
                $searchForm = $popup.find("#searchForm");
            // 페이지 이동
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.popup("List"));
            };
            // 플래너 번호
            $popup.on("click", ".list-title", function() {
                $.common.popup.planner.detail($(this).data("rdp_mst_idx"));
            });
            // 엑셀 다운로드
            $popup.on("click", "#goExcelDownload", function() {
                $frm.postSubmit($.action.exceldownload("ListPopup"));
            });
        });
    </script>
</body>
</html>
