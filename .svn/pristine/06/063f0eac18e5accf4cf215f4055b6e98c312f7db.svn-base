<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="board" data-menu_subclass="faqBoard">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h3 class="title">
                        <span>FAQ 건별 순서변경</span>
                    </h3>
                </div>
                <p>
                    <span><i class="require"><em>*</em></i></span>노출상태에 전체 FAQ게시물이 출력되며, 동일한 정렬순서일 경우 가장 나중에 변경된 순서가 우선 정렬됩니다
                </p>
                <form id="frm" name="frm">
                    <input type="hidden" name="BRD_FAQ_EXCEL_YN" value="N" />
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 8%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>정렬순서</th>
                                <th>문의유형</th>
                                <th>제목</th>
                                <th>조회수</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <input type="hidden" name="BRD_FAQ_IDXs" value="<c:out value="${row.BRD_FAQ_IDX }"/>" />
                                                <input type="text" name="BRD_FAQ_SRTs" class="text number" value="<c:out value="${row.BRD_FAQ_SRT }"/>" />
                                            </td>
                                            <td>
                                                <c:out value="${row.BRD_CMN_COM_NM }" />
                                            </td>
                                            <td class="left">
                                                <c:out value="${row.BRD_FAQ_TITLE }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.BRD_FAQ_READ_CNT }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.BRD_FAQ_USE_YN eq 'Y' ? '사용' : '미사용' }" />
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
                </form>
                <div class="grid section-button-search">
                    <a href="javascript:;" id="save" class="button small primary">
                        <span>저장</span>
                    </a>
                    <a href="javascript:self.close();" class="button small">
                        <span>닫기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    BRD_FAQ_SRTs : {
                        required : true,
                        number : true
                    }
                },
                messages : {
                    BRD_FAQ_SRTs : {
                        required : "[정렬순서]은(는) 필수입력 사항입니다.",
                        number : "[정렬순서]은(는) 숫자만 입력해 주십시오."
                    }
                }
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("Sort"));
                    }
                }
            });
        });
    </script>
</body>
</html>
