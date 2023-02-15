<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="contents-inner" data-cmn_com_idx="<c:out value="${commandMap.CMN_COM_IDX }"/>">
    <h3 class="title">
        <span><c:out value="${commandMap.CMN_COM_PATH }" escapeXml="false"/> 등록</span>
    </h3>
    <div class="grid section-button-list">
        <div class="col-1-2 text-left">
            <small class="desc">PC 배너사이즈 : <c:out value="${commandMap.CMN_COM_ETC1 }"/></small>
            <c:if test="${commandMap.CMN_COM_IDX ne Code.DISPLAY_SKYSCRAPER }">
                /
                <small class="desc">MOBILE 배너사이즈 : <c:out value="${commandMap.CMN_COM_ETC2 }"/></small>
            </c:if>
        </div>
        <div class="col-1-2 text-right">
            <small class="desc">
                <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
            </small>
        </div>
    </div>
    <form id="frm" name="frm" enctype="multipart/form-data">
        <c:forEach var="item" items="${commandMap}">
            <c:if test="${item.key eq 'CMN_COM_PATH' }">
                <input type="hidden" name="<c:out value="${item.key }"/>" value="<c:out value="${item.value }" escapeXml="false"/>" />
            </c:if>
            <c:if test="${item.key ne 'CMN_COM_PATH' }">
                <input type="hidden" name="<c:out value="${item.key }"/>" value="<c:out value="${item.value }"/>" />
            </c:if>
        </c:forEach>
        <table cellspacing="0" class="table-row table-a">
            <colgroup>
                <col style="width: 20%;"/>
                <col style="width: auto;" />
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <span>사용여부<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN0" class="radio" value="Y" checked="checked"/>
                        <label for="BNR_MST_USE_YN0">사용</label>
                        <input type="radio" name="BNR_MST_USE_YN" id="BNR_MST_USE_YN1" class="radio" value="N" />
                        <label for="BNR_MST_USE_YN1">미사용</label>
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>배너명<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <input type="text" name="BNR_MST_TITLE" id="BNR_MST_TITLE" class="text xlarge" maxlength="70" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <span>전시기간<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <a href="javascript:;" class="js-datepickr">
                            <span class="icon datepickr">
                                <em>날짜선택</em>
                            </span>
                        </a>
                        <input type="text" name="BNR_MST_ST_DT" id="BNR_MST_ST_DT" class="text date" value="" data-target-end="#BNR_MST_ED_DT" />
                        <select name="BNR_MST_ST_HH" id="BNR_MST_ST_HH" class="select small">
                            <c:forEach var="hh" begin="0" end="23" step="1">
                                <c:set var="hour" value="${hh }"/>
                                <c:if test="${hh lt 10 }">
                                    <c:set var="hour" value="0${hour }"/>
                                </c:if>
                                <c:out value="${hour }"/>
                                <option value="<c:out value="${hour }"/>"><c:out value="${hour }"/></option>
                            </c:forEach>
                        </select>
                        <select name="BNR_MST_ST_MM" id="BNR_MST_ST_MM" class="select small">
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
                        <input type="text" name="BNR_MST_ED_DT" id="BNR_MST_ED_DT" class="text date" value="" data-target-start="#BNR_MST_ST_DT" />
                        <select name="BNR_MST_ED_HH" id="BNR_MST_ED_HH" class="select small">
                            <c:forEach var="hh" begin="0" end="23" step="1">
                                <c:set var="hour" value="${hh }"/>
                                <c:if test="${hh lt 10 }">
                                    <c:set var="hour" value="0${hour }"/>
                                </c:if>
                                <c:out value="${hour }"/>
                                <option value="<c:out value="${hour }"/>"><c:out value="${hour }"/></option>
                            </c:forEach>
                        </select>
                        <select name="BNR_MST_ED_MM" id="BNR_MST_ED_MM" class="select small">
                            <c:forEach var="mm" begin="0" end="59" step="1">
                                <c:set var="minute" value="${mm }"/>
                                <c:if test="${mm lt 10 }">
                                    <c:set var="minute" value="0${minute }"/>
                                </c:if>
                                <option value="<c:out value="${minute }"/>"><c:out value="${minute }"/></option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <c:forEach var="device" items="${Const.DEVICE }" varStatus="i">
                    <c:if test="${not (commandMap.CMN_COM_IDX eq Code.DISPLAY_SKYSCRAPER and i.last)}">
                        <tr>
                            <th>
                                <span><c:out value="${device.value }"/> 배너<i class="require"><em>필수입력</em></i></span>
                            </th>
                            <td>
                                <spring:eval var="fileSize" expression="@file['file.max.byte.size.image']"/>
                                <jsp:include page="/WEB-INF/jsp/common/template/file.jsp" flush="false">
                                    <jsp:param name="fileName" value="FILE"/>
                                    <jsp:param name="order" value="${i.index }"/>
                                    <jsp:param name="isMulti" value="false"/>
                                    <jsp:param name="maxCount" value="1"/>
                                    <jsp:param name="allow" value="image"/>
                                    <jsp:param name="size" value="${fileSize }"/>
                                    <jsp:param name="fileType" value="${device.key }"/>
                                </jsp:include>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                <tr>
                    <th>
                        <span>링크 URL<i class="require"><em>필수입력</em></i></span>
                    </th>
                    <td>
                        <c:forEach var="target" items="${Const.LINK_TARGET }" varStatus="i">
                            <input type="radio" name="BNR_MST_TGT" id="BNR_MST_TGT<c:out value="${i.index }"/>" value="<c:out value="${target.key }"/>" <c:if test="${target.key eq Const.LINK_TARGET_NONE }">checked="checked"</c:if>/>
                            <label for="BNR_MST_TGT<c:out value="${i.index }"/>"><c:out value="${target.value }"/></label>
                        </c:forEach>
                        <br/>
                        <input type="text" placeholder="링크 입력 시 https://를 포함하여 전체 링크를 입력해 주세요" name="BNR_MST_URL" id="BNR_MST_URL" class="text xlarge" value="" maxlength="100" disabled="disabled"/>
                    </td>
                </tr>
                <c:if test="${commandMap.CMN_COM_IDX eq Code.DISPLAY_BANNER_AREA_CATEGORY_CODE}">
                <tr>
                    <th>
                        <span>전시 카테고리 선택</span>
                    </th>
                    <td>
                        <select name="PRD_CTG_IDX">
                            <option value="">전체</option>
                            <c:forEach items="${cateList }" var="cateRow" >
                            <option value="<c:out value="${cateRow.PRD_CTG_IDX }"/>"><c:out value="${cateRow.PRD_CTG_NM }"/></option>
                            </c:forEach>
                        </select>
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
</div>
<script>
    $(function () {
        var $contents = $(".contents-inner"),
            $frm = $contents.find("#frm");
        <%-- 폼체크 --%>
        $frm.validate({
            ignore : [],
            rules : {
                BNR_MST_USE_YM : {
                    required : true
                },
                BNR_MST_TITLE : {
                    required : true,
                    maxlength : 70
                },
                BNR_MST_ST_DT : {
                    required : true
                },
                BNR_MST_ST_HH : {
                    required : true
                },
                BNR_MST_ST_MM : {
                    required : true
                },
                BNR_MST_ED_DT : {
                    required : true
                },
                BNR_MST_ED_HH : {
                    required : true
                },
                BNR_MST_ED_MM : {
                    required : true
                },
                FILE : {
                    required : true
                },
                BNR_MST_URL : {
                    required : function (el) {
                        return ($frm.find("input[name='BNR_MST_TGT']:checked").val() != "<c:out value="${Const.LINK_TARGET_NONE }"/>")
                    },
                    url : true,
                    maxlength : 100
                }
            }
        });
        <%-- 링크타켓 변경 이벤트 --%>
        $frm.off("change", "input[name='BNR_MST_TGT']").on("change", "input[name='BNR_MST_TGT']", function() {
            var $this = $(this);
            var isDisabled = ($this.val() == "<c:out value="${Const.LINK_TARGET_NONE }"/>");
            if (isDisabled) {
                $this.siblings("#BNR_MST_URL").val("");
            }
            $this.siblings("#BNR_MST_URL").prop("disabled", isDisabled);
        });
        <%-- 저장버튼 클릭 이벤트 --%>
        $contents.off("click", "#save").on("click", "#save", function() {
            if ($frm.valid()) {
                if (confirm("저장 하시겠습니까?")){
                    $frm.postSubmit($.action.regist());
                }
            }
        });
    });
</script>