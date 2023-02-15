<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="board" data-menu_subclass="commentBoard">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>후기상세</span>
                    </h2>
                    <h3 class="title">
                        <span>후기 내용</span>
                    </h3>
                </div>
                <form id="frm" name="frm">
                    <input type="hidden" name="PRD_REV_IDX" value="<c:out value="${info.PRD_REV_IDX }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchProdNo" value="<c:out value="${commandMap.searchProdNo }"/>" />
                    <input type="hidden" name="searchPrdMstType" value="<c:out value="${commandMap.searchPrdMstType }"/>" />
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" />
                    <input type="hidden" name="searchPrdRevPit" value="<c:out value="${commandMap.searchPrdRevPit }"/>" />
                    <input type="hidden" name="searchPrdRevBstYn" value="<c:out value="${commandMap.searchPrdRevBstYn }"/>" />
                    <input type="hidden" name="searchPrdRevUseYn" value="<c:out value="${commandMap.searchPrdRevUseYn }"/>" />
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
                                        <span>온라인 상품코드</span>
                                    </label>
                                </th>
                                <td>
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${info.PRD_MST_NO }"/>">
                                        <c:out value="${info.PRD_MST_NO }"/>
                                    </a>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>온라인 상품명</span>
                                    </label>
                                </th>
                                <td>
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${info.PRD_MST_NO }"/>">
                                        <c:out value="${info.PRD_MST_NM }"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>모델명</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.MODEL_NM }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>등록일</span>
                                    </label>
                                </th>
                                <td>
                                    <ui:formatDate value="${info.PRD_REV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>작성자</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.PRD_REV_REG_NM }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>상태<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <input type="radio" name="PRD_REV_USE_YN" id="PRD_REV_USE_YN0" class="radio" value="Y" <c:if test="${info.PRD_REV_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                    <label for="PRD_REV_USE_YN0">노출</label>
                                    <input type="radio" name="PRD_REV_USE_YN" id="PRD_REV_USE_YN1" class="radio" value="N" <c:if test="${info.PRD_REV_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                    <label for="PRD_REV_USE_YN1">노출 안함</label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>후기내용</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <c:out value="${fn:replace(info.PRD_REV_CTS, newLineChar, '<br/>') }" escapeXml="false"/>
                                </td>
                            </tr>
                            <c:if test="${not empty info.CMM_FLE_WEB_PATH }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>이미지</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <img src="<spring:eval expression="@resource['cdn.ssl.domain']"/><c:out value="${info.CMM_FLE_WEB_PATH }"/>" alt="<c:out value="${info.CMM_FLE_ORG_NM }"/>" style="max-width:500px"/>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>답변 내용<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <textarea name="PRD_REV_RPL" id="PRD_REV_RPL" class="textarea xlarge" style="height: 500px; width: 100%;"><c:out value="${info.PRD_REV_RPL }"/></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>베스트 후기</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <input type="checkbox" name="PRD_REV_BST_YN" id="PRD_REV_BST_YN" class="checkbox" value="Y" <c:if test="${info.PRD_REV_BST_YN eq 'Y' }">checked="checked"</c:if>/>
                                    <label for="PRD_REV_BST_YN">베스트 선정</label>
                                </td>
                            </tr>
                            <c:if test="${not empty info.PRD_REV_UPD_ID }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>수정일</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <c:out value="${info.PRD_REV_UPD_NM }"/>(<c:out value="${info.PRD_REV_UPD_ID }"/>)/<ui:formatDate value="${info.PRD_REV_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
    <ui:editor objId="#PRD_REV_RPL" />
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    PRD_REV_USE_YN : {
                        required : true
                    },
                    PRD_REV_RPL : {
                        required : function(el) {
                            if (el.value == "<p>&nbsp;</p>") {
                                el.value = "";
                            }
                            return true;
                        }
                    }
                }
            });
            <%-- 상품 상세 이동 --%>
            $popup.on("click", ".product-detail", function() {
                $.common.popup.product.detail($(this).data("prd_mst_no"));
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", "#save", function() {
                oEditors.getById["PRD_REV_RPL"].exec("UPDATE_CONTENTS_FIELD", []);
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
