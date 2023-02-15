<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerPayment">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
            
                <%-- 타이틀 --%>
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        일괄지급완료
                    </h2>
                </div>
                
                <table cellspacing="0" class="table-row table-a">
                    <colgroup>
                        <col style="width: 30%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                <label class="label">
                                    <span>미지급 대상</span>
                                </label>
                            </th>
                            <td>
                                <c:out value="${commandMap.plannerCount}"/> 건
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="label">
                                    <span>지급 완료일</span>
                                </label>
                            </th>
                            <td>
                                <a href="javascript:;" class="js-datepickr">
                                    <span class="icon datepickr">
                                        <em>날짜선택</em>
                                    </span>
                                </a>
                                <input type="text" class="text small paymentDate" readonly="readonly">
                            </td>
                        </tr>
                    </tbody>
                </table>

                <%-- 저장/닫기 --%>
                <div class="grid section-button-search">
                    <a href="javascript:;" id="save" class="button small primary">
                        <span id="btnSave">저장</span>
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
            var $popup = $(".popup");
                $paymentDate = $popup.find("input.paymentDate");
            $popup.on("click", "#btnSave", function() {
                var paymentDate = $paymentDate.val();
                if (paymentDate && paymentDate.length == 10) {
                    if (confirm("일괄 지급 처리 하시겠습니까?")) {
                        var param = {
                            RMT_ORD_PAY_DT : paymentDate,
                            PARAMS : '<c:out value="${commandMap.PARAMS }"/>',
                            paymentYear : '<c:out value="${commandMap.paymentYear }"/>',
                            paymentMonth : '<c:out value="${commandMap.paymentMonth }"/>'
                        }
                        $.postSyncJsonAjax($.action.ajax("CompleteAll"), param, function(data) {
                            if (data.isSuccess) {
                                alert("일괄 지급이 처리 되었습니다.");
                                parent.opener.location.reload();
                                self.close();
                            } else {
                                alert("일괄 지급 처리가 실패하였습니다.");
                            }
                        });
                    }                
                } else {
                    alert("지급일자를 입력해주세요.");
                }
            });
        });
    </script>
</body>
</html>
