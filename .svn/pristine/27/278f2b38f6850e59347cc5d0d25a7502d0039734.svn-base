<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="display" data-menu_subclass="popupDisplay">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span><c:out value="${Const.DEVICE[commandMap.POP_MST_CHN_GBN] }"/> 팝업 등록</span>
                    </h2>
                    <div class="text-left">
                        <small class="desc">
                            <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                        </small>
                    </div>
                </div>
                <form id="frm" name="frm"  enctype="multipart/form-data">
                    <input type="hidden" name="POP_MST_CHN_GBN" value="<c:out value="${commandMap.POP_MST_CHN_GBN }"/>" />
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>노출여부<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <input type="radio" name="POP_MST_USE_YN" id="POP_MST_USE_YN0" class="radio" value="Y" checked="checked"/>
                                    <label for="POP_MST_USE_YN0">노출</label>
                                    <input type="radio" name="POP_MST_USE_YN" id="POP_MST_USE_YN1" class="radio" value="N"/>
                                    <label for="POP_MST_USE_YN1">노출 안함</label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>팝업제목<i class="require"><em>필수입력</em></i></span>
                                </th>
                                <td>
                                    <input type="text" name="POP_MST_TITLE" id="POP_MST_TITLE" class="text xlarge" maxlength="70" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>노출기간<i class="require"><em>필수입력</em></i></span>
                                </th>
                                <td>
                                    <a href="javascript:;" class="js-datepickr">
                                        <span class="icon datepickr">
                                            <em>날짜선택</em>
                                        </span>
                                    </a>
                                    <input type="text" name="POP_MST_ST_DT" id="POP_MST_ST_DT" class="text date" value="" data-target-end="#POP_MST_ED_DT" />
                                    <select name="POP_MST_ST_HH" id="POP_MST_ST_HH" class="select small">
                                        <c:forEach var="hh" begin="0" end="23" step="1">
                                            <c:set var="hour" value="${hh }"/>
                                            <c:if test="${hh lt 10 }">
                                                <c:set var="hour" value="0${hour }"/>
                                            </c:if>
                                            <c:out value="${hour }"/>
                                            <option value="<c:out value="${hour }"/>"><c:out value="${hour }"/></option>
                                        </c:forEach>
                                    </select>
                                    <select name="POP_MST_ST_MM" id="POP_MST_ST_MM" class="select small">
                                        <c:forEach var="mm" begin="0" end="59" step="1">
                                            <c:set var="minute" value="${mm }"/>
                                            <c:if test="${mm lt 10 }">
                                                <c:set var="minute" value="0${minute }"/>
                                            </c:if>
                                            <option value="<c:out value="${minute }"/>"><c:out value="${minute }"/></option>
                                        </c:forEach>
                                    </select>
                                    ~
                                    <a href="javascript:;" class="js-datepickr">
                                        <span class="icon datepickr">
                                            <em>날짜선택</em>
                                        </span>
                                    </a>
                                    <input type="text" name="POP_MST_ED_DT" id="POP_MST_ED_DT" class="text date" value="" data-target-start="#POP_MST_ST_DT" />
                                    <select name="POP_MST_ED_HH" id="POP_MST_ED_HH" class="select small">
                                        <c:forEach var="hh" begin="0" end="23" step="1">
                                            <c:set var="hour" value="${hh }"/>
                                            <c:if test="${hh lt 10 }">
                                                <c:set var="hour" value="0${hour }"/>
                                            </c:if>
                                            <c:out value="${hour }"/>
                                            <option value="<c:out value="${hour }"/>"><c:out value="${hour }"/></option>
                                        </c:forEach>
                                    </select>
                                    <select name="POP_MST_ED_MI" id="POP_MST_ED_MI" class="select small">
                                        <c:forEach var="mm" begin="0" end="59" step="1">
                                            <c:set var="minute" value="${mm }"/>
                                            <c:if test="${mm lt 10 }">
                                                <c:set var="minute" value="0${minute }"/>
                                            </c:if>
                                            <option value="<c:out value="${minute }"/>"><c:out value="${minute }"/></option>
                                        </c:forEach>
                                    </select>
                                    <a href="javascript:DateUtil.fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 0, 1,  '-');" class="button button-a xsmall">
                                        <span>내일</span>
                                    </a>
                                    <a href="javascript:DateUtil.fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 0, 8,  '-');" class="button button-a xsmall">
                                        <span>일주일</span>
                                    </a>
                                    <a href="javascript:DateUtil.fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 0, 16,  '-');" class="button button-a xsmall">
                                        <span>15일</span>
                                    </a>
                                    <a href="javascript:DateUtil.fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 1, 1,  '-');" class="button button-a xsmall">
                                        <span>한달</span>
                                    </a>
                                    <a href="javascript:DateUtil.fnDateSet('POP_MST_ST_DT', 'POP_MST_ED_DT', 0, 0, 1, 0, 2, 1,  '-');" class="button button-a xsmall">
                                        <span>두달</span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>닫기옵션</span>
                                </th>
                                <td>
                                    <span>'오늘 하루 보이지 않음'</span>
                                    <input type="radio" name="POP_MST_DAY_YN" id="POP_MST_DAY_YN0" class="radio" value="N" checked="checked"/>
                                    <label for="POP_MST_DAY_YN0">사용안함</label>
                                    <input type="radio" name="POP_MST_DAY_YN" id="POP_MST_DAY_YN1" class="radio" value="Y"/>
                                    <label for="POP_MST_DAY_YN1">사용함</label>
                                </td>
                            </tr>
                            <c:if test="${commandMap.POP_MST_CHN_GBN eq Const.PC }">
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>팝업창 크기</span>
                                        </label>
                                    </th>
                                    <td>
                                        <label for="POP_MST_W">가로 </label>
                                        <input type="text" name="POP_MST_W" id="POP_MST_W" class="text onlyNumber" value="" maxlength="4"/> PX
                                        <label for="POP_MST_H">세로 </label>
                                        <input type="text" name="POP_MST_H" id="POP_MST_H" class="text onlyNumber" value="" maxlength="4"/> PX
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>팝업창 위치</span>
                                        </label>
                                    </th>
                                    <td>
                                        <label for="POP_MST_X">모니터 화면 왼쪽에서 </label>
                                        <input type="text" name="POP_MST_X" id="POP_MST_X" class="text onlyNumber" value="" maxlength="4"/> PX 이동,
                                        <label for="POP_MST_Y">화면 위쪽에서 </label>
                                        <input type="text" name="POP_MST_Y" id="POP_MST_Y" class="text onlyNumber" value="" maxlength="4"/> PX 만큼 아래에 위치합니다.
                                        <small class="desc">
                                            <i class="require"><em>필수입력</em></i>다중 팝업창을 띄우는 경우, 겹치지 않도록 위치를 각각 조정해 주세요.
                                        </small>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>
                                    <span>이미지<i class="require"><em>필수입력</em></i></span>
                                </th>
                                <td>
                                    <spring:eval var="fileSize" expression="@file['file.max.byte.size.image']"/>
                                    <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                        <jsp:param name="fileName" value="FILE"/>
                                        <jsp:param name="order" value="0"/>
                                        <jsp:param name="isMulti" value="false"/>
                                        <jsp:param name="maxCount" value="1"/>
                                        <jsp:param name="allow" value="image"/>
                                        <jsp:param name="size" value="${fileSize }"/>
                                        <jsp:param name="fileType" value="${commandMap.POP_MST_CHN_GBN }"/>
                                    </jsp:include>
                                    <c:if test="${commandMap.POP_MST_CHN_GBN eq Const.MOBILE }">
                                        <p>
                                            <small class="desc">*  (642px*642px 최적화)</small>
                                        </p>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>링크 URL</span>
                                </th>
                                <td>
                                    <c:forEach var="target" items="${Const.LINK_TARGET }" varStatus="i">
                                        <input type="radio" name="POP_MST_MDE" id="POP_MST_MDE<c:out value="${i.index }"/>" value="<c:out value="${target.key }"/>" <c:if test="${target.key eq Const.LINK_TARGET_NONE }">checked="checked"</c:if>/>
                                        <label for="POP_MST_MDE<c:out value="${i.index }"/>"><c:out value="${target.value }"/></label>
                                    </c:forEach>
                                    <br/>
                                    <input type="text" placeholder="링크 입력 시 https://를 포함하여 전체 링크를 입력해 주세요" name="POP_MST_LNK" id="POP_MST_LNK" class="text xlarge" value="" maxlength="100" disabled="disabled"/>
                                </td>
                            </tr>
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
                    POP_MST_USE_YM : {
                        required : true
                    },
                    POP_MST_TITLE : {
                        required : true,
                        maxlength : 70
                    },
                    POP_MST_ST_DT : {
                        required : true
                    },
                    POP_MST_ST_HH : {
                        required : true
                    },
                    POP_MST_ST_MM : {
                        required : true
                    },
                    POP_MST_ED_DT : {
                        required : true
                    },
                    POP_MST_ED_HH : {
                        required : true
                    },
                    POP_MST_ED_MI : {
                        required : true
                    },
                    FILE : {
                        required : true
                    },
                    POP_MST_LNK : {
                        required : function (el) {
                            return ($frm.find("input[name='POP_MST_MDE']:checked").val() != "<c:out value="${Const.LINK_TARGET_NONE }"/>")
                        },
                        url : true,
                        maxlength : 100
                    }
                }
            });
            <%-- 링크타켓 변경 이벤트 --%>
            $frm.on("change", "input[name='POP_MST_MDE']", function() {
                var $this = $(this);
                var isDisabled = ($this.val() == "<c:out value="${Const.LINK_TARGET_NONE }"/>");
                if (isDisabled) {
                    $this.siblings("#POP_MST_LNK").val("");
                }
                $this.siblings("#POP_MST_LNK").prop("disabled", isDisabled);
            });
            <%-- 저장버튼 클릭 이벤트 --%>
            $popup.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.regist());
                    }
                }
            });
        });
    </script>
</body>
</html>
