<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="product" data-menu_subclass="productQnA">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>상품QnA 상세 <c:out value="${info.PRD_QNA_RPL_YN eq 'Y' ? '답변완료' : '답변대기' }"/></span>
                    </h2>
                    <h3 class="title">
                        <span>문의 내용</span>
                    </h3>
                </div>
                <form id="frm" name="frm">
                    <input type="hidden" name="PRD_QNA_IDX" value="<c:out value="${info.PRD_QNA_IDX }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
                    <input type="hidden" name="searchModelClNm" value="<c:out value="${commandMap.searchModelClNm }"/>" />
                    <input type="hidden" name="searchModelNm" value="<c:out value="${commandMap.searchModelNm }"/>" />
                    <input type="hidden" name="searchPrdQna" value="<c:out value="${commandMap.searchPrdQna }"/>" />
                    <input type="hidden" name="searchPrdQnaMemNm" value="<c:out value="${commandMap.searchPrdQnaMemNm }"/>" />
                    <input type="hidden" name="searchQnaDspYn" value="<c:out value="${commandMap.searchQnaDspYn }"/>" />
                    <input type="hidden" name="searchPrdQnaRplYn" value="<c:out value="${commandMap.searchPrdQnaRplYn }"/>" />
                    <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>" />
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>온라인 상품명</span>
                                    </label>
                                </th>
                                <td>
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${info.PRD_MST_NO }"/>">
                                        <c:out value="${info.PRD_MST_NM }" />
                                    </a>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>모델분류(지원혜택)</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.MODEL_CL_NM }" />
                                    (
                                    <c:out value="${info.PRD_MST_SPL_NM }" />
                                    )
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>모델명</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.MODEL_NM }" />
                                </td>
                                <th>
                                    <label class="label">
                                        <span>질문공개여부</span>
                                    </label>
                                </th>
                                <td>
                                    <input type="radio" name="PRD_QNA_DSP_YN" id="PRD_QNA_DSP_YN1" class="radio" value="Y" <c:if test="${info.PRD_QNA_DSP_YN eq 'Y'}">checked="checked"</c:if> />
                                    <label for="PRD_QNA_DSP_YN1">공개</label>
                                    <input type="radio" name="PRD_QNA_DSP_YN" id="PRD_QNA_DSP_YN2" class="radio" value="N" <c:if test="${info.PRD_QNA_DSP_YN eq 'N'}">checked="checked"</c:if> />
                                    <label for="PRD_QNA_DSP_YN2">비공개</label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>작성자</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.PRD_QNA_MEM_NM }" />
                                    /
                                    <c:out value="${info.PRD_QNA_HP1 }" />
                                    -
                                    <c:out value="${info.PRD_QNA_HP2 }" />
                                    -
                                    <c:out value="${info.PRD_QNA_HP3 }" />
                                </td>
                                <th>
                                    <label class="label">
                                        <span>등록일</span>
                                    </label>
                                </th>
                                <td>
                                    <ui:formatDate value="${info.PRD_QNA_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>답변알림여부</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <c:out value="${info.PRD_QNA_SMS_YN }" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>질문</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <c:out value="${info.PRD_QNA_CTS }" escapeXml="false" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h3 class="title">
                        <span>답변 하기</span>
                    </h3>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>답변상태</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.PRD_QNA_RPL_YN eq 'Y' ? '답변완료' : '답변대기' }" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>답변 내용<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <textarea name="PRD_QNA_RPL_CTS" id="PRD_QNA_RPL_CTS" class="textarea xlarge" style="height: 500px; width: 100%;"><c:out value="${info.PRD_QNA_RPL_CTS }" /></textarea>
                                </td>
                            </tr>
                            <c:if test="${not empty info.PRD_QNA_UPD_ID }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>등록일</span>
                                        </label>
                                    </th>
                                    <td>
                                        <c:out value="${info.PRD_QNA_UPD_NM }" />
                                        (
                                        <c:out value="${info.PRD_QNA_UPD_ID }" />
                                        )/
                                        <ui:formatDate value="${info.PRD_QNA_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                    </td>
                                </tr>
                            </c:if>
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
    <ui:editor objId="#PRD_QNA_RPL_CTS" />
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    PRD_QNA_RPL_CTS : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    }
                }
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", "#save", function() {
                oEditors.getById["PRD_QNA_RPL_CTS"].exec("UPDATE_CONTENTS_FIELD", []);
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify());
                    }
                }
            });
        });
    </script>
</body>
</html>
