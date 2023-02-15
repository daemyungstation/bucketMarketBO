<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="display" data-menu_subclass="categoryDisplay">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>카테고리 추가</span>
                    </h2>
                    <div class="text-left">
                        <small class="desc">
                            <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                        </small>
                    </div>
                </div>
                <form name="frm" id="frm">
                    <input type="hidden" name="PRD_CTG_UP_IDX" value="<c:out value="${commandMap.PRD_CTG_IDX }"/>"/>
                    <input type="hidden" name="PRD_CTG_TOP_IDX" value="<c:out value="${commandMap.PRD_CTG_TOP_IDX }"/>"/>
                    <input type="hidden" name="PRD_CTG_LEVEL" value="<c:out value="${commandMap.PRD_CTG_LEVEL }"/>"/>
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>카테고리 위치</span>
                                    </label>
                                </th>
                                <td>
                                    <c:out value="${not empty commandMap.PRD_CTG_PATH ? commandMap.PRD_CTG_PATH : '최상위' } "  escapeXml="false"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>카테고리명<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <input type="text" name="PRD_CTG_NM" id="PRD_CTG_NM" class="text xlarge" value="" maxlength="70"/>
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
                    PRD_CTG_NM : {
                        required : true
                    }
                }
            });
            <%-- 저장버튼 클릭이벤트 --%>
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
