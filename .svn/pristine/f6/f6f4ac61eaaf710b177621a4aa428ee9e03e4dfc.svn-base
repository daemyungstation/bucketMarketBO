<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="board" data-menu_subclass="inquiryBoard">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>1:1문의 <c:out value="${info.MEM_ADV_RPL_YN eq 'Y' ? '답변완료' : '답변대기' }"/></span>
                    </h2>
                    <h3 class="title">
                        <span>문의 내용</span>
                    </h3>
                </div>
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
                                <ui:formatDate value="${info.MEM_ADV_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="label">
                                    <span>작성자</span>
                                </label>
                            </th>
                            <td colspan="3">
                                <c:out value="${info.MEM_MST_MEM_NM }"/>/<c:out value="${info.MEM_ADV_HP1 }"/>-<c:out value="${info.MEM_ADV_HP2 }"/>-<c:out value="${info.MEM_ADV_HP3 }"/>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="label">
                                    <span>질문</span>
                                </label>
                            </th>
                            <td colspan="3">
                                <c:out value="${info.MEM_ADV_CONTENTS }" escapeXml="false"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <h3 class="title">
                    <span>답변 하기</span>
                </h3>
                <form id="frm" name="frm">
                    <input type="hidden" name="MEM_ADV_IDX" value="<c:out value="${info.MEM_ADV_IDX }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                    <input type="hidden" name="searchMemAdvTitleAndContents" value="<c:out value="${commandMap.searchMemAdvTitleAndContents }"/>" />
                    <input type="hidden" name="searchMemAdvQstType" value="<c:out value="${commandMap.searchMemAdvQstType }"/>" />
                    <input type="hidden" name="searchMemMstMemNm" value="<c:out value="${commandMap.searchMemMstMemNm }"/>" />
                    <input type="hidden" name="searchMemAdvHp3" value="<c:out value="${commandMap.searchMemAdvHp3 }"/>" />
                    <input type="hidden" name="searchMemAdvRplYn" value="<c:out value="${commandMap.searchMemAdvRplYn }"/>" />
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
                                    <c:out value="${info.MEM_ADV_RPL_YN eq 'Y' ? '답변완료' : '답변대기' }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>답변 내용<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <textarea name="MEM_ADV_RPL_CONTENTS" id="MEM_ADV_RPL_CONTENTS" class="textarea xlarge" style="height: 500px; width: 100%;"><c:out value="${info.MEM_ADV_RPL_CONTENTS }"/></textarea>
                                </td>
                            </tr>
                            <c:if test="${not empty info.MEM_ADV_UPD_ID }">
                                    <tr>
                                        <th>
                                            <label class="label">
                                                <span>등록일</span>
                                            </label>
                                        </th>
                                        <td>
                                            <c:out value="${info.MEM_ADV_UPD_NM }"/>(<c:out value="${info.MEM_ADV_UPD_ID }"/>)/<ui:formatDate value="${info.MEM_ADV_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
    <ui:editor objId="#MEM_ADV_RPL_CONTENTS" />
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    MEM_ADV_RPL_CONTENTS : {
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
                oEditors.getById["MEM_ADV_RPL_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
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
