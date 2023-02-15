<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="claim" data-menu_subclass="payMethod">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>결제변경 신청정보</span>
                    </h2>
                    <h3 class="title">
                        <span>고객정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>고객명</th>
                                <th>온라인상품명</th>
                                <th>월납입금</th>
                                <th>만기회차</th>
                                <th>모델분류<br/>(지원혜택)</th>
                                <th>모델명</th>
                                <th>연락처</th>
                                <th>주소(증서 배송)</th>
                                <th>접수일시</th>
                                <th>가입일시</th>
                                <th>가입상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><c:out value="${info.ACCNT_NO }"/></td>
                                <td><c:out value="${info.MEM_NM }"/></td>
                                <td>
                                    <a href="javascript:;" class="product-detail" data-prd_mst_no="<c:out value="${info.PRD_MST_NO }"/>">
                                        <c:out value="${info.PRD_MST_NM }"/>
                                    </a>
                                </td>
                                <td><fmt:formatNumber value="${info.MON_PAY_AMT }" type="number"/></td>
                                <td><fmt:formatNumber value="${info.EXPR_NO }" type="number"/></td>
                                <td><c:out value="${info.MODEL_CD }" /><br/>(<c:out value="${info.PRD_MST_SPL_NM }" />)</td>
                                <td><c:out value="${info.MODEL_NM }"/></td>
                                <td><c:out value="${info.CELL }"/></td>
                                <td>
                                    (<c:out value="${info.INSPL_ZIP }"/>) <c:out value="${info.INSPL_ADDR }"/> <c:out value="${info.INSPL_ADDR2 }"/>
                                </td>
                                <td><ui:formatDate value="${info.REG_DM }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                <td><ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd"/></td>
                                <td><c:out value="${info.KSTBIT }"/></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>납입정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>공제번호</th>
                                <th>결제유형</th>
                                <th>납입현황</th>
                                <th>총납입금액</th>
                                <th>상조부금 납입금</th>
                                <th>결합상품 납입금</th>
                                <th>결합상품 추가 납입금</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><c:out value="${info.DED_NO }"/></td>
                                <td><c:out value="${Dlcc.PAY_METHODS[info.PAY_MTHD] }"/></td>
                                <td><c:out value="${info.PAY_NO }"/> / <c:out value="${info.EXPR_NO }"/></td>
                                <td><fmt:formatNumber value="${info.PAY_AMT + info.PAY_AMT1 + info.PAY_AMT2 }" type="number"/></td>
                                <td><fmt:formatNumber value="${info.PAY_AMT }" type="number"/></td>
                                <td><fmt:formatNumber value="${info.PAY_AMT1 }" type="number"/></td>
                                <td><fmt:formatNumber value="${info.PAY_AMT2 }" type="number"/></td>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>신청정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <c:forEach begin="1" end="${info.CLM_ACT_PAY eq Code.INICIS_CARD_CODE ? 8 : 7 }">
                                <col style="width: auto;" />
                            </c:forEach>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>신청일시</th>
                                <th>결제유형</th>
                                <c:if test="${info.CLM_ACT_PAY eq Code.INICIS_CARD_CODE }">
                                    <th>카드명</th>
                                    <th>카드번호</th>
                                    <th>유효기간</th>
                                </c:if>
                                <c:if test="${info.CLM_ACT_PAY eq Code.INICIS_BACK_CODE }">
                                    <th>은행명</th>
                                    <th>계좌번호</th>
                                </c:if>
                                <th>납부일자</th>
                                <th>해피콜 가능시간</th>
                                <th>진행상태</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><ui:formatDate value="${info.CLM_ACT_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                <td><c:out value="${info.CLM_ACT_PAY_NM }"/></td>
                                <c:if test="${info.CLM_ACT_PAY eq Code.INICIS_CARD_CODE }">
                                    <td><c:out value="${info.CLM_ACT_CRD_NM }"/></td>
                                    <td><c:out value="${info.CLM_ACT_CRD_NO }"/></td>
                                    <td><c:out value="${info.CLM_ACT_CRD_YY }"/>/<c:out value="${info.CLM_ACT_CRD_MM }"/></td>
                                </c:if>
                                <c:if test="${info.CLM_ACT_PAY eq Code.INICIS_BACK_CODE }">
                                    <td><c:out value="${info.CLM_ACT_BNK_NM }"/></td>
                                    <td><c:out value="${info.CLM_ACT_BNK_ACT }"/></td>
                                </c:if>
                                <td><c:out value="${info.CLM_ACT_PAY_DT_NM }"/></td>
                                <td><c:out value="${info.CLM_ACT_HPC_NM }"/></td>
                                <td>
                                    <select name="CMN_COM_IDX" class="select half" data-clm_act_idx="<c:out value="${info.CLM_ACT_IDX }"/>">
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <option value="<c:out value="${row.CMN_COM_IDX }"/>" <c:if test="${info.CMN_COM_IDX eq row.CMN_COM_IDX }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }"/></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    <a href="javascript:;" class="button xsmall save">
                                        <span>저장</span>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="grid section-button-list">
                        <div class="col-1-1 text-center">
                            <a href="javascript:self.close();" class="button small">
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
            var $popup = $(".popup");
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", ".save", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var $target = $(this).siblings("select[name='CMN_COM_IDX']");
                    var array = new Array(),
                        param = new Object();
                    $target.each(function () {
                        var $this = $(this);
                        param.CLM_ACT_IDX = $this.data("clm_act_idx");
                        param.CMN_COM_IDX = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("Modify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
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
