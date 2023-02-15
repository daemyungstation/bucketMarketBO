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
            
                <%-- 타이틀 --%>
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <c:choose>
                            <c:when test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_APPROVAL or info.RDP_MST_STATE eq Code.PLANNER_STATE_INACTIVE}">
                                <span>레디 플래너 정보 (활동대기)</span>
                            </c:when>
                            <c:otherwise>
                                <span>레디 플래너 정보 (활동)</span>
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </div>
                
                <%-- 탭 --%>
                <div class="tab-list">
                    <ul>
                        <c:choose>
                            <c:when test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_APPROVAL or info.RDP_MST_STATE eq Code.PLANNER_STATE_INACTIVE}">
                                <li class="in">
                                    <a href="javascript:;" class="term-type-tab"><span>프로필</span></a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="in">
                                    <a href="javascript:;" class="term-type-tab"><span>프로필</span></a>
                                </li>
                                <li>
                                    <a href="javascript:;" class="term-type-tab" id="tabPerformance"><span>실적</span></a>
                                </li>
                                <li>
                                    <a href="javascript:;" class="term-type-tab payment" id="tabPayment"><span>지급</span></a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                
                <%-- 실명/예금주 확인을 위한 이름 필드 --%>
                <input type="hidden" id="rdpMstMemNm" value="<c:out value="${info.RDP_MST_MEM_NM }"/>" />
                
                <%-- 프로필 폼 --%>
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
                                    <c:out value="${info.RDP_MST_MEM_NM }"/> / <c:out value="${info.RDP_MST_ID }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>사업자 유형</span>
                                    </label>
                                </th>
                                <td>
                                    <%-- 추가정보 입력 전에는 정보 출력하지 않음 --%>
                                    <c:choose>
                                        <c:when test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_APPROVAL }">
                                            
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="item" items="${codes.PLANNER_BUSINESS_CLASS}" varStatus="status">
                                                <label for="rdpMstBusiCls<c:out value="${status.index + 1}"/>">
                                                    <input type="radio" name="RDP_MST_BUSI_CLS" id="rdpMstBusiCls<c:out value="${status.index + 1}"/>" class="radio" value="<c:out value="${item.CMN_COM_IDX }"/>" <c:if test="${item.CMN_COM_IDX eq info.RDP_MST_BUSI_CLS }">checked="checked"</c:if>/>
                                                    <span><c:out value="${item.CMN_COM_NM }"/></span>
                                                </label>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                    <%-- // 추가정보 입력 전에는 정보 출력하지 않음 --%>
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
                                    / 
                                    <c:out value="${info.RDP_LVL_NM }"/>
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
                    
                    <%-- 정산 정보 --%>
                    <%-- 추가정보 입력 전에는 정보 출력하지 않음 --%>
                    <c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_APPROVAL  }">
                        
                        <h3 class="title">
                            <c:choose>
                                <c:when test="${empty info.RDP_MST_BUSI_CLS}">
                                    <c:set var="calculateType" value="none"/>
                                    <span id="title_calculate">정산 정보</span>
                                </c:when>
                                <c:when test="${info.RDP_MST_BUSI_CLS eq Code.PLANNER_BUSINESS_CLASS_PRIVATE}">
                                    <c:set var="calculateType" value="private"/>
                                    <span id="title_calculate">개인 / 정산 정보</span>
                                </c:when>
                                <c:when test="${info.RDP_MST_BUSI_CLS ne Code.PLANNER_BUSINESS_CLASS_PRIVATE}">
                                    <c:set var="calculateType" value="business"/>
                                    <span id="title_calculate">사업자 / 정산 정보</span>
                                </c:when>
                            </c:choose>
                        </h3>
                        <table id="table_calculate" cellspacing="0" class="table-row table-a">
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                            
                                <%-- 개인 --%>
                                <tr class="private" <c:if test="${calculateType ne 'private'}">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>주민등록번호</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="hidden" id="RDP_MST_SSN_CHECK" value="<c:if test="${not empty info.RDP_MST_SSN1 and not empty info.RDP_MST_SSN2}" >Y</c:if>" />
                                        <input type="text" id="RDP_MST_SSN1" name="RDP_MST_SSN1" class="text onlyNumber" value="<c:out value="${info.RDP_MST_SSN1 }"/>" maxlength="6"/>-
                                        <input type="text" id="RDP_MST_SSN2" name="RDP_MST_SSN2" class="text onlyNumber" value="<c:out value="${info.RDP_MST_SSN2 }"/>" maxlength="7"/>
                                        <input type="text" id="RDP_MST_SSN3" name="RDP_MST_SSN3" class="text onlyNumber" value="<c:out value=""/>" maxlength="7" style="display: none;"/>
                                        <a id="checkSsn" href="javascript:;" class="button"><span>인증</span></a>
                                    </td>
                                </tr>
                                
                                <%-- 개인사업자 / 법인사업자 --%>
                                <tr class="business" <c:if test="${calculateType ne 'business'}">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>사업자번호</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" id="RDP_MST_BUSI1" name="RDP_MST_BUSI1" class="text onlyNumber small" value="<c:out value="${info.RDP_MST_BUSI1 }"/>" maxlength="3"/>-
                                        <input type="text" id="RDP_MST_BUSI2" name="RDP_MST_BUSI2" class="text onlyNumber small" value="<c:out value="${info.RDP_MST_BUSI2 }"/>" maxlength="2"/>-
                                        <input type="text" id="RDP_MST_BUSI3" name="RDP_MST_BUSI3" class="text onlyNumber small" value="<c:out value="${info.RDP_MST_BUSI3 }"/>" maxlength="5"/>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>대표자명</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" id="RDP_MST_CEO_NM" name="RDP_MST_CEO_NM" class="text large" value="<c:out value="${info.RDP_MST_CEO_NM }"/>" maxlength="10"/>
                                    </td>
                                </tr>
                                <tr class="business" <c:if test="${calculateType ne 'business'}">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>회사명</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" id="RDP_MST_BUSI_NM" name="RDP_MST_BUSI_NM" class="text large" value="<c:out value="${info.RDP_MST_BUSI_NM }"/>" maxlength="16"/>
                                    </td>
                                </tr>
                                <tr class="business" <c:if test="${calculateType ne 'business'}">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>업태</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" id="RDP_MST_BUSI_CDT" name="RDP_MST_BUSI_CDT" class="text large" value="<c:out value="${info.RDP_MST_BUSI_CDT }"/>" maxlength="16"/>
                                    </td>
                                    <th>
                                        <label class="label">
                                            <span>종목</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="text" id="RDP_MST_BUSI_TYPE" name="RDP_MST_BUSI_TYPE" class="text large" value="<c:out value="${info.RDP_MST_BUSI_TYPE }"/>" maxlength="16"/>
                                    </td>
                                </tr>
                                
                                <%-- 공통 --%>
                                <tr class="private business" <c:if test="${calculateType eq 'none'}">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>주소</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <a id="searchPost" href="javascript:;" class="button"><span>주소검색</span></a>
                                        <input type="text" id="RDP_MST_ZIP_CODE" name="RDP_MST_ZIP_CODE" class="text onlyNumber" value="<c:out value="${info.RDP_MST_ZIP_CODE }" />" placeholder="우편번호" readonly="readonly"/>
                                        <input type="text" id="RDP_MST_DR_ADDR1" name="RDP_MST_DR_ADDR1" class="text large" value="<c:out value="${info.RDP_MST_DR_ADDR1 }" />" placeholder="기본주소" maxlength="66" readonly="readonly"/>
                                        <input type="text" id="RDP_MST_DR_ADDR2" name="RDP_MST_DR_ADDR2" class="text large" value="<c:out value="${info.RDP_MST_DR_ADDR2 }" />" placeholder="상세주소" maxlength="66" />
                                    </td>
                                </tr>
                                <tr class="private business" <c:if test="${calculateType eq 'none'}">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>계좌정보</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <input type="hidden" id="RDP_MST_BNK_ACT_CHECK" value="<c:if test="${not empty info.RDP_MST_BNK_CD and not empty info.RDP_MST_BNK_ACT}" >Y</c:if>" />
                                        <select name="RDP_MST_BNK_CD" id="RDP_MST_BNK_CD" class="select">
                                            <option value="">선택</option>
                                            <c:if test="${not empty codes.INICIS_BACK_CODE }">
                                                <c:forEach var="row" items="${codes.INICIS_BACK_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_IDX }"/>" data-cmn_com_etc1="${row.CMN_COM_ETC1 }" <c:if test="${row.CMN_COM_IDX eq info.RDP_MST_BNK_CD }">selected="selected"</c:if>>
                                                        <c:out value="${row.CMN_COM_NM }" />
                                                    </option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <input type="text" id="RDP_MST_BNK_ACT" name="RDP_MST_BNK_ACT" class="text large onlyNumber" value="<c:out value="${info.RDP_MST_BNK_ACT }" />" placeholder="계좌번호" maxlength="20" />
                                        <input type="text" id="RDP_MST_ACT_HDR" name="RDP_MST_ACT_HDR" class="text" value="<c:out value="${info.RDP_MST_ACT_HDR }" />" readonly="readonly"/>
                                        <a id="checkBankAccount" href="javascript:;" class="button"><span>계좌확인</span></a>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                        
                    </c:if>
                    <%-- // 추가정보 입력 전에는 정보 출력하지 않음 --%>
                    
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
                                        <span>홍보사이트</span>
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
                                                            <c:choose>
                                                                <c:when test="${fn:indexOf(item.RDP_SIT_ADR, 'http://') eq -1 and fn:indexOf(item.RDP_SIT_ADR, 'https://') eq -1}">
                                                                    <a href="http://${item.RDP_SIT_ADR}" target="_blank">${item.RDP_SIT_ADR }</a><c:if test="${!status.last}">, </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="${item.RDP_SIT_ADR}" target="_blank">${item.RDP_SIT_ADR }</a><c:if test="${!status.last}">, </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>성격</span>
                                                </th>
                                                <td>
                                                    <c:out value="${fn:replace(info.RDP_MST_SIT_DSC, newLineChar, '<br/>') }" escapeXml="false"/>
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
                                        <span>교육이수</span>
                                    </label>
                                </th>
                                <td>
                                    <c:if test="${info.RDP_MST_EDU_YN eq 'Y'}">이수</c:if><c:if test="${info.RDP_MST_EDU_YN ne 'Y'}">이수안함</c:if>
                                </td>
                            </tr>
                            
                            <%-- 신청 상태에서는 처리 정보를 출력하지 않는다. --%>
                            <c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_APPLY}">
                            
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
                            
                            </c:if>
                            
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>최근 접속 일시</span>
                                    </label>
                                </th>
                                <td>
                                    <ui:formatDate value="${info.RDP_HIS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
                                </td>
                            </tr>
                            
                            <%-- 자걱 구분 --%>
                            <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_ACTIVE or info.RDP_MST_STATE eq Code.PLANNER_STATE_STOP or info.RDP_MST_STATE eq Code.PLANNER_STATE_REQUEST_RELEASE}">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>자격 구분</span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="radio" id="rdpMstState_0" class="radio" name="RDP_MST_STATE" value="<c:out value="${Code.PLANNER_STATE_ACTIVE }"/>" <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_ACTIVE }">checked="checked"</c:if>/>
                                        <label for="rdpMstState_0">정상</label>
                                        <input type="radio" id="rdpMstState_1" class="radio" name="RDP_MST_STATE" value="<c:out value="${Code.PLANNER_STATE_STOP }"/>" <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_STOP }">checked="checked"</c:if>/>
                                        <label for="rdpMstState_1">정지</label>
                                        <input type="radio" id="rdpMstState_2" class="radio" name="RDP_MST_STATE" value="<c:out value="${Code.PLANNER_STATE_REQUEST_RELEASE }"/>" <c:if test="${info.RDP_MST_STATE eq Code.PLANNER_STATE_REQUEST_RELEASE }">checked="checked"</c:if> disabled="disabled" />
                                        <label for="rdpMstState_2">해제요청</label>
                                    </td>
                                </tr>
                                <tr id="tr_rdpMstStpRsn" <c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_STOP }">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>정지 사유</span>
                                        </label>
                                    </th>
                                    <td>
                                        <textarea name="RDP_MST_STP_RSN" id="RDP_MST_STP_RSN" class="textarea xlarge" style="height: 100px; width: 100%;"><c:out value="${info.RDP_MST_STP_RSN }"/></textarea>
                                    </td>
                                </tr>
                                <tr id="tr_rdpMstRlsRsn" <c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_REQUEST_RELEASE }">style="display:none;"</c:if>>
                                    <th>
                                        <label class="label">
                                            <span>해제요청 사유</span>
                                        </label>
                                    </th>
                                    <td>
                                        <textarea name="RDP_MST_RLS_RSN" id="RDP_MST_RLS_RSN" class="textarea xlarge" style="height: 100px; width: 100%;" readonly="readonly"><c:out value="${info.RDP_MST_RLS_RSN }"/></textarea>
                                    </td>
                                </tr>
                            </c:if>
                            
                        </tbody>
                    </table>
                    
                </form>
                
                <%-- 탭 폼 --%>
                <form id="tabFrm" name="tabFrm">
                    <input type="hidden" name="RDP_MST_IDX" value="<c:out value="${info.RDP_MST_IDX }"/>" />
                </form>

                <%-- 저장/닫기 --%>
                <div class="grid section-button-search">
                
                    <%-- 추가정보 입력 전 상태에서는 정보를 수정하지 못하게 막는다. --%>
                    <c:if test="${info.RDP_MST_STATE ne Code.PLANNER_STATE_APPROVAL}">
                        <a href="javascript:;" id="save" class="button small primary">
                            <span>저장</span>
                        </a>
                    </c:if>
                    <%-- // 추가정보 입력 전 상태에서는 정보를 수정하지 못하게 막는다. --%>
                    
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
                $tabFrm = $popup.find("#tabFrm");
            // 폼 체크
            $frm.validate({
                // ignore : [],
                rules : {
                    RDP_MST_BUSI_CLS : { required : true },
                    RDP_MST_SSN1 : { required : true, number : true, minlength : 6, maxlength : 6 },
                    RDP_MST_SSN2 : { required : true, number : true, minlength : 7, maxlength : 7 },
                    RDP_MST_SSN3 : { required : true },
                    RDP_MST_BUSI1 : { required : true, number : true, minlength : 3, maxlength : 3 },
                    RDP_MST_BUSI2 : { required : true, number : true, minlength : 2, maxlength : 2 },
                    RDP_MST_BUSI3 : { required : true, number : true, minlength : 5, maxlength : 5 },
                    RDP_MST_CEO_NM : { required : true },
                    RDP_MST_BUSI_NM : { required : true },
                    RDP_MST_ZIP_CODE : { required : true },
                    RDP_MST_DR_ADDR1 : { required : true },
                    RDP_MST_DR_ADDR2 : { required : true },
                    RDP_MST_BUSI_CDT : { required : true },
                    RDP_MST_BUSI_TYPE : { required : true },
                    RDP_MST_BNK_CD : { required : true },
                    RDP_MST_BNK_ACT : { required : true, number : true },
                    RDP_MST_ACT_HDR : { required : true },
                    RDP_MST_STATE : { required : true }
                }
            });
            // 탭
            $popup.on("click", "#tabPerformance", function() {
                $tabFrm.postSubmit($.action.popup("Performance"));
            });
            $popup.on("click", "#tabPayment", function() {
                $tabFrm.postSubmit($.action.popup("Payment"));
            });
            // 우편번호 검색
            new ZipCode("searchPost", function(data) {
                console.log(data);
                $popup.find("#RDP_MST_ZIP_CODE").val(data.zipcode);
                $popup.find("#RDP_MST_DR_ADDR1").val(data.roadAddress);
            });
            // 사업자 유형
            $popup.on("click", "input[name='RDP_MST_BUSI_CLS']", function() {
                var rdpMstBusiCls = $popup.find("input[name='RDP_MST_BUSI_CLS']:checked").val();
                if (rdpMstBusiCls == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>") {
                    // 개인
                    $popup.find("#title_calculate").text("개인 / 정산 정보");
                    $popup.find("#table_calculate tr.business").hide();
                    $popup.find("#table_calculate tr.private").show();
                } else {
                    // 사업자
                    $popup.find("#title_calculate").text("사업자 / 정산 정보");
                    $popup.find("#table_calculate tr.private").hide();
                    $popup.find("#table_calculate tr.business").show();
                }
            });
            // 주민등록번호
            $popup.on("input", "#RDP_MST_SSN1, #RDP_MST_SSN2", function() {
                $popup.find("#RDP_MST_SSN_CHECK").val("");
            });
            $popup.on("click", "#checkSsn", function() {
                if (!ValidationUtil.checkSsn($popup.find('#RDP_MST_SSN1').val(), $popup.find('#RDP_MST_SSN2').val())) {
                    alert("[주민등록번호] 유효하지 않은 주민등록번호입니다.");
                    $popup.find('#RDP_MST_SSN1').focus();
                    return;
                }
                var param = {
                    "jumin1" : $popup.find("#RDP_MST_SSN1").val(),
                    "jumin2" : $popup.find("#RDP_MST_SSN2").val(),
                    "name" : $popup.find("#rdpMstMemNm").val(),
                    "srvNo" : "<c:out value="${sciServiceNo }"/>" // 각 페이지에 맞는 서비스번호
                };
                $.postSyncJsonAjax($.action.common.ajax("checkSsn"), param, function(data) {
                    if (data.isSuccess) {
                        $popup.find("#RDP_MST_SSN_CHECK").val("Y");
                        alert("[주민등록번호] 인증되었습니다.");
                    } else {
                        $popup.find("#RDP_MST_SSN_CHECK").val("");
                        alert("[주민등록번호] 인증이 실패하였습니다.");
                    }
                });
            });
            // 계좌정보
            $popup.on("input", "#RDP_MST_BNK_CD, #RDP_MST_BNK_ACT", function() {
                $popup.find("#RDP_MST_BNK_ACT_CHECK").val("");
            });
            $popup.on("click", "#checkBankAccount", function() {
                var param = {
                    "bankCode" : $popup.find("#RDP_MST_BNK_CD").find(":selected").data("cmn_com_etc1"),
                    "bankAccount" : $popup.find("#RDP_MST_BNK_ACT").val()
                };
                $.postSyncJsonAjax($.action.common.ajax("checkBankAccount"), param, function(data) {
                    $popup.find("#RDP_MST_ACT_HDR").val("");
                    if (data.isSuccess) {
                        $popup.find("#RDP_MST_ACT_HDR").val(data.depositor);
                        if ($popup.find("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_LEGAL_PERSON }"/>") {
                            // 법인 사업자는 계좌 예금주와 법인명이 동일한지 확인하지 않음.
                            $popup.find("#RDP_MST_BNK_ACT_CHECK").val("Y");
                            alert("[계좌정보] 인증되었습니다.");
                        } else if ($popup.find("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>") {
                            // 개인인 경우 사용자 이름과 동일해야 함
                            if (data.depositor == $("#rdpMstMemNm").val()) {
                                $popup.find("#RDP_MST_BNK_ACT_CHECK").val("Y");
                                alert("[계좌정보] 인증되었습니다.");
                            } else {
                                $popup.find("#RDP_MST_BNK_ACT_CHECK").val("");
                                alert("[계좌정보] 계좌확인이 실패하였습니다. - 예금주가 사용자 이름과 동일해야 합니다.");
                            }
                        } else if ($popup.find("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_NATURAL_PERSON }"/>") {
                            // 개인사업자인 경우 대표자명과 동일해야 함
                            if (data.depositor == $("#RDP_MST_CEO_NM").val()) {
                                $popup.find("#RDP_MST_BNK_ACT_CHECK").val("Y");
                                alert("[계좌정보] 인증되었습니다.");
                            } else {
                                $popup.find("#RDP_MST_BNK_ACT_CHECK").val("");
                                alert("[계좌정보] 계좌확인이 실패하였습니다. - 예금주가 대표자명과 동일해야 합니다.");
                            }
                        }
                    } else {
                        $popup.find("#RDP_MST_BNK_ACT_CHECK").val("");
                        alert("[계좌정보] 계좌확인이 실패하였습니다. - " + data.message);
                        $popup.find('#RDP_MST_BNK_ACT').focus();
                    }
                });
            });
            // 자격 구분
            $popup.on("change", "input[name='RDP_MST_STATE']", function() {
                var state = $("input[name='RDP_MST_STATE']:checked").val();
                if (state === "<c:out value="${Code.PLANNER_STATE_ACTIVE }"/>") {
                    $popup.find('#tr_rdpMstStpRsn').hide();
                    $popup.find('#tr_rdpMstRlsRsn').hide();
                }
                if (state === "<c:out value="${Code.PLANNER_STATE_STOP }"/>") {
                    $popup.find('#tr_rdpMstStpRsn').show();
                    $popup.find('#tr_rdpMstRlsRsn').hide();
                }
                if (state === "<c:out value="${Code.PLANNER_STATE_REQUEST_RELEASE }"/>") {
                    $popup.find('#tr_rdpMstStpRsn').hide();
                    $popup.find('#tr_rdpMstRlsRsn').show();
                }
            });
            // 저장
            $popup.on("click", "#save", function() {
                // 저장
                if ($frm.valid()) {
                    var isPrivate = $popup.find("input[name='RDP_MST_BUSI_CLS']:checked").val() == "<c:out value="${Code.PLANNER_BUSINESS_CLASS_PRIVATE }"/>";
                    if (isPrivate) {
                        if (!ValidationUtil.checkSsn($popup.find('#RDP_MST_SSN1').val(), $popup.find('#RDP_MST_SSN2').val())) {
                            alert("[주민등록번호] 유효하지 않은 주민등록번호입니다.");
                            $popup.find('#RDP_MST_SSN1').focus();
                            return;
                        }
                        if ($popup.find("#RDP_MST_SSN_CHECK").val() != "Y") {
                            alert("[주민등록번호] 인증이 필요합니다.");
                            $popup.find('#RDP_MST_SSN1').focus();
                            return;
                        }
                        if ($popup.find("#RDP_MST_BNK_ACT_CHECK").val() != "Y") {
                            alert("[계좌정보] 계좌확인이 필요합니다.");
                            $popup.find('#RDP_MST_BNK_ACT').focus();
                            return;
                        }
                    } else {
                        if (!ValidationUtil.checkBizNo($popup.find('#RDP_MST_BUSI1').val(), $popup.find('#RDP_MST_BUSI2').val(), $popup.find('#RDP_MST_BUSI3').val())) {
                            alert("[사업자번호] 유효하지 않은 사업자번호입니다.");
                            $popup.find('#RDP_MST_BUSI1').focus();
                            return;
                        }
                        if ($popup.find("#RDP_MST_BNK_ACT_CHECK").val() != "Y") {
                            alert("[계좌정보] 계좌확인이 필요합니다.");
                            $popup.find('#RDP_MST_BNK_ACT').focus();
                            return;
                        }
                    }
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("Profile"));
                    }
                }
            });
        });
    </script>
</body>
</html>
