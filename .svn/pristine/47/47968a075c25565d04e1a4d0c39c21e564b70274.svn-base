<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="contents-inner" data-cmn_com_idx="<c:out value="${commandMap.CMN_COM_IDX }"/>">
    <h3 class="title">
        <span>카테고리관리 상세</span>
    </h3>
    <div class="text-left">
        <small class="desc">
            <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
        </small>
    </div>
    <form id="frm" name="frm">
        <input type="hidden" name="PRD_CTG_IDX" value="<c:out value="${info.PRD_CTG_IDX }"/>"/>
        <input type="hidden" name="PRD_CTG_TOP_IDX" value="<c:out value="${info.PRD_CTG_TOP_IDX }"/>"/>
        <input type="hidden" name="PRD_CTG_LEVEL" value="<c:out value="${info.PRD_CTG_LEVEL }"/>"/>
        <input type="hidden" name="PRD_CTG_PATH" value="<c:out value="${info.PRD_CTG_PATH }"/>"/>
        <table cellspacing="0" class="table-row table-a">
            <colgroup>
                <col style="width: 20%;"/>
                <col style="width: auto;" />
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <span>카테고리 ID</span>
                    </th>
                    <td>
                        <c:out value="${info.PRD_CTG_IDX }"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>현재 위치</span>
                    </th>
                    <td>
                        <c:out value="${info.PRD_CTG_PATH }"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>카테고리명<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="text" name="PRD_CTG_NM" id="PRD_CTG_NM" class="text xlarge" value="<c:out value="${info.PRD_CTG_NM }"/>" maxlength="70"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>노출관련 키워드</span>
                    </th>
                    <td>
                        <input type="text" name="PRD_CTG_KWD" id="PRD_CTG_KWD" class="text xlarge" value="<c:out value="${info.PRD_CTG_KWD }"/>" maxlength="700"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>카테고리 사용여부<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="radio" name="PRD_CTG_USE_YN" id="PRD_CTG_USE_YN0" value="Y" <c:if test="${info.PRD_CTG_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                        <label for="PRD_CTG_USE_YN0">사용</label>
                        <input type="radio" name="PRD_CTG_USE_YN" id="PRD_CTG_USE_YN1" value="N" <c:if test="${info.PRD_CTG_USE_YN eq 'N' }">checked="checked"</c:if>/>
                        <label for="PRD_CTG_USE_YN1">미사용</label>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>카테고리 노출여부<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="radio" name="PRD_CTG_DSP_YN" id="PRD_CTG_DSP_YN0" value="Y" <c:if test="${info.PRD_CTG_DSP_YN eq 'Y' }">checked="checked"</c:if>/>
                        <label for="PRD_CTG_DSP_YN0">사용</label>
                        <input type="radio" name="PRD_CTG_DSP_YN" id="PRD_CTG_DSP_YN1" value="N" <c:if test="${info.PRD_CTG_DSP_YN eq 'N' }">checked="checked"</c:if>/>
                        <label for="PRD_CTG_DSP_YN1">미사용</label>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>카테고리메뉴 숨김여부<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="radio" name="PRD_CTG_HID_YN" id="PRD_CTG_HID_YN0" value="Y" <c:if test="${info.PRD_CTG_HID_YN eq 'Y' }">checked="checked"</c:if>/>
                        <label for="PRD_CTG_HID_YN0">숨김</label>
                        <input type="radio" name="PRD_CTG_HID_YN" id="PRD_CTG_HID_YN1" value="N" <c:if test="${info.PRD_CTG_HID_YN eq 'N' }">checked="checked"</c:if>/>
                        <label for="PRD_CTG_HID_YN1">노출</label>
                    </td>
                </tr>
                <c:if test="${not empty childList }">
                    <tr>
                        <th>
                            <span>하위 카테고리 정렬</span>
                        </th>
                        <td>
                            <table class="table-a">
                                <colgroup>
                                    <col style="width: 10%;" />
                                    <col style="width: auto;" />
                                </colgroup>
                                <tbody>
                                    <c:forEach var="row" items="${childList }" varStatus="i">
                                        <tr class="tr-sort" data-prd_ctg_idx="<c:out value="${row.PRD_CTG_IDX }"/>">
                                            <td>
                                                <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                                <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                            </td>
                                            <td>
                                                <input type="hidden" name="PRD_CTG_CHILD_IDXs" value="<c:out value="${row.PRD_CTG_IDX }"/>"/>
                                                <input type="hidden" name="PRD_CTG_CHILD_SORTs" value="<c:out value="${row.PRD_CTG_SORT }"/>" />
                                                <c:out value="${row.PRD_CTG_NM }"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </form>
    <div class="section-button">
        <div class="wrap text-center">
            <a href="javascript:;" id="save" class="button primary">
                <span>저장</span>
            </a>
        </div>
    </div>
    <script>
        $(function () {
            <%-- 폼체크 --%>
            $("#frm").validate({
                ignore : [],
                rules : {
                    PRD_CTG_NM : {
                        required : true
                    },
                    PRD_CTG_USE_YN : {
                        required : true
                    },
                    PRD_CTG_DSP_YN : {
                        required : true
                    }
                }
            });
        });
    </script>
</div>