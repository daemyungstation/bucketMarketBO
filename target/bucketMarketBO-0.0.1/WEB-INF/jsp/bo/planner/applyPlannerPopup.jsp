<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="planner" data-menu_subclass="plannerPopup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>레디 플래너 정보 (신청)</span>
                    </h2>
                </div>
                
                <%-- 탭 --%>
                <div class="tab-list">
                    <ul>
                        <li class="in">
                            <a href="javascript:;" class="term-type-tab"><span>프로필</span></a>
                        </li>
                    </ul>
                </div>
                
                <%-- 승인/반려 폼 --%>
                <form id="frm" name="frm">
                    <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${info.RDP_MST_IDX }"/>" />
                
                    <%-- 기본정보 --%>
                    <h3 class="title">
                        <span>기본 정보</span>
                    </h3>
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
                                        <span>플래너 번호</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.RDP_MST_NO }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>이름 / 아이디</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.RDP_MST_MEM_NM }"/> / -
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>사업자 유형</span>
                                    </label>
                                </th>
                                <td>
                                    -
                                </td>
                                <th>
                                    <label class="label">
                                        <span>소속 / 등급</span>
                                    </label>
                                </th>
                                <td>
                                    <c:choose>
                                        <c:when test="${info.RDP_MST_DM_YN eq 'Y' }">임직원(<c:out value="${info.RDP_MST_DM_NO }"/>)</c:when>
                                        <c:when test="${info.RDP_MST_DM_YN eq 'N' }">일반</c:when>
                                    </c:choose>
                                    / -
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>연락처</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.RDP_MST_HP1 }"/>-<c:out value="${info.RDP_MST_HP2 }"/>-<c:out value="${info.RDP_MST_HP3 }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>이메일</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.RDP_MST_MAIL }"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <%-- 활동정보 --%>
                    <h3 class="title">
                        <span>활동 정보</span>
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
                                        <span>홍보계정</span>
                                    </label>
                                </th>
                                <td>
                                    
                                    <table cellspacing="0" class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 15%;" />
                                            <col style="width: auto;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>계정</span>
                                                </th>
                                                <td>
                                                    <c:if test="${not empty info.RDP_SIT_ADR_LIST}">
                                                        <c:forEach var="item" items="${info.RDP_SIT_ADR_LIST}" varStatus="status">
                                                            <a href="${item.RDP_SIT_ADR}" target="_blank">${item.RDP_SIT_ADR }</a><c:if test="${!status.last}">, </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>성격</span>
                                                </th>
                                                <td>
                                                    <c:out value="${info.RDP_MST_SIT_DSC }"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>주제</span>
                                                </th>
                                                <td>
                                                    <c:out value="${info.RDP_SUB_CD }"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>질문 / 답변</span>
                                    </label>
                                </th>
                                <td>
                                    
                                    <table cellspacing="0" class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 15%;" />
                                            <col style="width: 30%;" />
                                            <col style="width: auto;" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>NO</span>
                                                </th>
                                                <th>
                                                    <span>질문</span>
                                                </th>
                                                <th>
                                                    <span>답변</span>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>1</span>
                                                </td>
                                                <td>
                                                    <span>레디플래너 가입 경로는?</span>
                                                </td>
                                                <td>
                                                    <c:out value="${info.RDP_MST_ANS1 }"></c:out>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>2</span>
                                                </td>
                                                <td>
                                                    <span>이용약관과 운영정책 내용 확인하셨나요?</span>
                                                </td>
                                                <td>
                                                    <c:out value="${info.RDP_MST_ANS2 }"></c:out>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>신청일시</span>
                                    </label>
                                </th>
                                <td>
                                    <ui:formatDate value="${info.RDP_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>상태</span>
                                    </label>
                                </th>
                                <td>
                                    <input type="radio" id="rdpMstState_0" class="radio" name="RDP_MST_STATE" value="<c:out value="${Code.PLANNER_STATE_APPROVAL }"/>" <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_APPROVAL }">checked="checked"</c:if>/>
                                    <label for="rdpMstState_0">승인</label>
                                    <input type="radio" id="rdpMstState_1" class="radio" name="RDP_MST_STATE" value="<c:out value="${Code.PLANNER_STATE_REJECT }"/>" <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_REJECT }">checked="checked"</c:if>/>
                                    <label for="rdpMstState_1">반려</label>
                                </td>
                            </tr>
                            <tr id="tr_rdpMstRjtRsn" <c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_REJECT }">style="display:none;"</c:if>>
                                <th>
                                    <label class="label">
                                        <span>반려사유</span>
                                    </label>
                                </th>
                                <td>
                                    <textarea name="RDP_MST_RJT_RSN" id="RDP_MST_RJT_RSN" class="textarea xlarge" style="height: 100px; width: 100%;"><c:out value="${info.RDP_MST_RJT_RSN }"/></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>처리자 / 처리일시</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.RDP_MST_UPD_NM }"></c:out> / <ui:formatDate value="${info.RDP_MST_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </form>

                <%-- 저장/닫기 --%>
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
            // 폼 체크
            $frm.validate({
                // ignore : [],
                rules : {
                    RDP_MST_STATE : { 
                        required : true
                    },
                    RDP_MST_RJT_RSN : {
                        required : function(el) {
                            return $("input[name='RDP_MST_STATE']:checked").val() == "<c:out value="${Code.PLANNER_STATE_REJECT }"/>"; // 반려일때만 필수
                        }
                    }
                }
            });
            // 상태
            $popup.on("change", "input[name='RDP_MST_STATE']", function() {
                var refuse = $("input[name='RDP_MST_STATE']:checked").val() == "<c:out value="${Code.PLANNER_STATE_REJECT }"/>";
                if (!refuse) {
                    $("#frm").find("#RDP_MST_RJT_RSN").val("");
                }
                $("#tr_rdpMstRjtRsn").toggle(refuse);
            });
            // 저장
            $popup.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("Apply"));
                    }
                }
            });
        });
    </script>
</body>
</html>
