<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="board" data-menu_subclass="contactUsBoard">
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
                <form></form>
                <form id="frm" name="frm">
                    <input type="hidden" name="CTT_US_IDX" value="<c:out value="${info.CTT_US_IDX }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchCttUsTitleAndContents" value="<c:out value="${commandMap.searchCttUsTitleAndContents }"/>"/>
                        <input type="hidden" name="searchCttUsRepYn" value="<c:out value="${commandMap.searchCttUsRepYn }"/>"/>
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
                                        <span>문의자</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.CTT_US_NM }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>연락처</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.CTT_US_HP1 }"/>-<c:out value="${info.CTT_US_HP2 }"/>-<c:out value="${info.CTT_US_HP3 }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>화사명</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.CTT_US_CPN }"/>
                                </td>
                                <th>
                                    <label class="label">
                                        <span>회사소속</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${info.CTT_US_CPN_DIV }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>등록일</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <ui:formatDate value="${info.CTT_US_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>상태<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <input type="radio" name="CTT_US_REP_YN" id="CTT_US_REP_YN0" class="radio" value="N" <c:if test="${info.CTT_US_REP_YN eq 'N' }">checked="checked"</c:if>/>
                                    <label for="CTT_US_REP_YN0">처리대기</label>
                                    <input type="radio" name="CTT_US_REP_YN" id="CTT_US_REP_YN1" class="radio" value="Y" <c:if test="${info.CTT_US_REP_YN eq 'Y' }">checked="checked"</c:if>/>
                                    <label for="CTT_US_REP_YN1">처리완료</label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>제목</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <c:out value="${info.CTT_US_TITLE }"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>문의내용</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <c:out value="${fn:replace(info.CTT_US_CONTENTS, newLineChar, '<br/>') }" escapeXml="false"/>
                                </td>
                            </tr>
                            <c:if test="${not empty info.CMM_FLE_IDX }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>파일첨부</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <a href="javascript:;" class="file-download" data-cmm_fle_idx="<c:out value="${info.CMM_FLE_IDX }"/>">
                                            <c:out value="${info.CMM_FLE_ORG_NM }"/>
                                        </a>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>메모</span>
                                    </label>
                                </th>
                                <td colspan="3">
                                    <textarea name="CTT_US_MEMEO" id="CTT_US_MEMEO" class="textarea xlarge" style="height: 200px; width: 100%;" maxlength="300"><c:out value="${info.CTT_US_MEMEO }"/></textarea>
                                </td>
                            </tr>
                            <c:if test="${not empty info.CTT_US_UPD_ID }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>수정일</span>
                                        </label>
                                    </th>
                                    <td colspan="3">
                                        <c:out value="${info.CTT_US_UPD_NM }"/>(<c:out value="${info.CTT_US_UPD_ID }"/>)/<ui:formatDate value="${info.CTT_US_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    CTT_US_REP_YN : {
                        required : true
                    }
                }
            });
            <%-- 파일다운로드 --%>
            $popup.on("click", ".file-download", function() {
                $.common.file.download($(this).data("cmm_fle_idx"));
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", "#save", function() {
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
