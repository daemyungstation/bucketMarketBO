<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="support" data-menu_subclass="supportBenefit">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>혜택/지급상세</span>
                    </h2>
                </div>
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>" />
                    <h3 class="title">
                        <span>고객정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>고객명</th>
                                <th>접수일시</th>
                                <th>납입현황</th>
                                <th>혜택현황</th>
                                <th>모델분류(지원혜택)</th>
                                <th>모델명</th>
                                <th>가입일시</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <c:out value="${info.ACCNT_NO }" />
                                </td>
                                <td>
                                    <c:out value="${info.MEM_NM }" />
                                </td>
                                <td>
                                    <ui:formatDate value="${info.ORD_MST_REG_DT }" pattern="yyyy.MM.dd" />
                                </td>
                                <td>
                                    <c:out value="${info.PAY_NO }" />/<c:out value="${info.EXPR_NO }" />
                                </td>
                                <td>
                                    <c:out value="${info.BENEFIT_NO }" />/<c:out value="${info.REL_CNT }" />
                                </td>
                                <td>
                                    <c:out value="${info.MODEL_CL_NM}" />
                                    <BR>
                                    <c:out value="${info.PRD_MST_SPL_NM}" />
                                </td>
                                <td>
                                    <c:out value="${info.MODEL_NM }" />
                                </td>
                                <td>
                                    <ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd" />
                                </td>
                            </tr>
                            <c:if test="${empty info}">
                                <tr>
                                    <td class="td_no_result"></td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                    
                    <h3 class="title">
                        <span>혜택/지급정보</span>
                    </h3>
                    <p><span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.</p>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 8%;" />
                            <col style="width: 15%;" />
                            <col style="width: 30%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회차</th>
                                <th>납입월</th>
                                <th>혜택/지급일자<i class="require"><em>필수입력</em></i></th>
                                <th>지급내역<i class="require"><em>필수입력</em></i></th>
                                <th>추가정보<i class="require"><em>필수입력</em></i></th>
                                <th>지급상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${row.PAY_NO }" />
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.PAY_DAY }" pattern="yyyy.MM.dd" />
                                            </td>
                                            <td>
                                                <a href="javascript:;" class="js-datepickr">
                                                    <span class="icon datepickr">
                                                        <em>날짜선택</em>
                                                    </span>
                                                </a>
                                                <input type="text" name="ORD_BNF_DT" id="ORD_BNF_DT" class="text large" value="<ui:formatDate value="${row.ORD_BNF_DT}" pattern="yyyy-MM-dd" />" maxlength="10"/>
                                            </td>
                                            <td>
                                                <input type="text" name="PRD_MST_SPT_TXT" id="PRD_MST_SPT_TXT" class="text large" value="<c:out value="${row.PRD_MST_SPT_TXT}" />" maxlength="40"/>
                                            </td>
                                            <td>
                                                <input type="text" name="ORD_MST_VDR_BNF_ID" id="ORD_MST_VDR_BNF_ID" class="text large" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX}"/>" value="<c:out value="${row.ORD_MST_VDR_BNF_ID}" />" maxlength="20"/>
                                            </td>
                                            <td class="benefit-yn">
                                                <c:out value="${row.ORD_BNF_YN eq 'Y' ? '지급완료' : '미지급' }" />
                                                <br>
                                                <c:if test="${row.ORD_BNF_YN eq 'N'}">
                                                    <a href="javascript:;" class="button xsmall save" data-accnt_no="<c:out value="${row.ACCNT_NO }"/>" data-pay_no="<c:out value="${row.PAY_NO}" />" data-ord_mst_idx="<c:out value="${row.ORD_MST_IDX }"/>">
                                                        <span>혜택지급</span>
                                                    </a> 
                                                </c:if>
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
                </form>
                <form id="frmMemo" name="frmMemo">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>" />
                    
                    <h3 class="title">
                        <span>특이사항</span>
                    </h3>
                    
                    <div class="grid section-button-search-right">
                        <a href="javascript:;" id="memo" class="button small">
                            <span>특이사항 저장</span>
                        </a>
                    </div>                        
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>특이사항 입력</span>
                                    </label>
                                </th>
                                <td>
                                    <textarea name="ORD_MEMO_CTS" id="ORD_MEMO_CTS" class="textarea xlarge" style="height: 50px; width: 100%;" maxlength="1800"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>특이사항</th>
                                <th>작성자</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty mlist }">
                                    <c:forEach var="row" items="${mlist }" varStatus="i">
                                        <tr>
                                            <td>
                                                <c:out value="${paging.listNum - i.index }" />
                                            </td>
                                            <td>
                                                <c:out value="${row.ORD_MEMO_CTS }" />
                                            </td>                                                
                                            <td>
                                                <c:if test="${row.AUT_MST_VDR_YN eq 'Y'}">
                                                    <c:out value="${row.VDR_MST_NM }" />(<c:out value="${row.ADM_MST_NM }" />)
                                                </c:if>
                                                <c:if test="${row.AUT_MST_VDR_YN ne 'Y' }">
                                                    <c:out value="${row.AUT_MST_NM }" />(<c:out value="${row.ADM_MST_NM }" />)
                                                </c:if>                                                
                                            </td>
                                            <td>
                                                <ui:formatDate value="${row.ORD_MEMO_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${empty mlist}">
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
                    </div>
                </form>
                <div class="grid section-button-search">
                    <a href="javascript:;" id="close" class="button small">
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
                $frmMemo = $("#frmMemo");
                
            $frm.validate({
                ignore : [],
                rules : {
                    ORD_BNF_DT : {
                        required : true
                    },
                    PRD_MST_SPT_TXT : {
                        required : true
                    },
                    ORD_MST_VDR_BNF_ID : {
                        required : true
                    }
                }
            });
            <%-- 지급상태 저장 클릭 이벤트 --%>
            $frm.on("click", ".save", function() {
                var $this = $(this),
                    $td = $(this).closest("td").siblings("td");
                var isValid = true, 
                    params = new Object();
                var targets = [["ORD_BNF_DT", "지급일자"], ["ORD_MST_VDR_BNF_ID", "추가정보"], ["PRD_MST_SPT_TXT", "지급내역"]];
                $.each(targets, function (i, target) {
                    var value = $td.find("input[name='" + target[0] + "']").val();
                    if (value != "") {
                        params[target[0]] = value;
                    } else {
                        alert(target[1] + "을(를) 입력하세요.");
                        isValid = false;
                        return false;  
                    } 
                });
                if (isValid) {
                    if (confirm("저장 하시겠습니까?")) {
                        params.ACCNT_NO = $this.data("accnt_no");
                        params.PAY_NO = $this.data("pay_no");
                        params.ORD_MST_IDX = $this.data("ord_mst_idx");
                        $.postSyncJsonAjax($.action.ajax("BatchTargetModify"), params, function(data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                setBenefitYn($td, data.benefitYn);
                            } else {
                                alert("저장에 실패하였습니다.");
                            }
                        });
                    }
                }
            });
            function setBenefitYn ($object, stat) {
                stat = "지급완료";
                $object.closest("td").siblings(".benefit-yn").text(stat)
            }
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.popup("Detail"));
            };
            <%-- 특이사항 저장 이벤트  --%>
            $popup.on("click", "#memo", function() {
                if ($frmMemo.find("textarea[name='ORD_MEMO_CTS']").val()!="") {
                    if (confirm("저장 하시겠습니까?")) {
                        $frmMemo.postSubmit($.action.modify("MemoInfo"));
                    }
                } else {
                    alert("특이사항 내용을 입력해 주세요.");
                }
            });
            <%-- 닫기  --%>
            $popup.on("click", "#close", function() {
                opener.location.reload();
                window.close();
            });
            
        });
    </script>
</body>
</html>
