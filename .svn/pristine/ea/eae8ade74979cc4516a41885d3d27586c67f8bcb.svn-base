<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="support" data-menu_subclass="supportRental">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>렌탈상세정보</span>
                    </h2>
                </div>
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="ORD_MST_IDX" value="<c:out value="${info.ORD_MST_IDX }"/>" />
                    <input type="hidden" name="INSPL_CELL" value="<c:out value="${info.INSPL_CELL }"/>" />
                    <h3 class="title">
                        <span>고객정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>접수일</th>
                                <th>고객명</th>
                                <th>연락처</th>
                                <th>증소(증서배송)</th>
                                <th>모델분류(지원혜택)</th>
                                <th>모델명</th>
                                <th>제휴사 승인결과</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <ui:formatDate value="${info.ORD_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
                                </td>
                                <td>
                                    <c:out value="${info.MEM_NM }" />
                                </td>
                                <td>
                                    <c:out value="${info.CELL }" />
                                </td>
                                <td>
                                    <c:out value="${info.HOME_ADDR}" /><c:out value="${info.HOME_ADDR2}" />
                                </td>
                                <td>
                                    <c:out value="${info.MODEL_CL_NM}" />
                                    <BR>
                                    <c:out value="${info.PRD_MST_SPL_NM}" />
                                </td>
                                <td>
                                    <c:out value="${info.MODEL_NM}" />
                                </td>
                                <td>
                                    <c:out value="${info.ORD_MST_VDR_APV_NM}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    
                    <h3 class="title">
                        <span>설치주소</span>
                    </h3>
                    <p>
                        <span><i class="require"><em>필수입력</em></i></span>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <div class="grid section-button-search-right">
                        <a href="javascript:;" id="save" class="button small">
                            <span>배송정보 저장</span>
                        </a>
                    </div>                        
                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: 35%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <label class="label">
                                        <span>수령인<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <input type="text" name="INSPL_MEM_NM" id="INSPL_MEM_NM" class="text short" maxlength="10" value="<c:out value="${info.INSPL_MEM_NM }"/>" />
                                </td>
                                <th>
                                    <label class="label">
                                        <span>수령인 연락처<i class="require"><em>필수입력</em></i></span>
                                    </label>
                                </th>
                                <td>
                                    <select class="select" name="INSPL_CELL1" id="INSPL_CELL1">
                                        <option value="" <c:if test="${empty info.INSPL_CELL1 }">selected="selected"</c:if>>선택</option>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="row" items="${codeList }" varStatus="i">
                                                <option value="<c:out value="${row.CMN_COM_NM }"/>" <c:if test="${info.INSPL_CELL1 eq row.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${row.CMN_COM_NM }" /></option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                    - 
                                    <input type="text" name="INSPL_CELL2" id="INSPL_CELL2" class="text short number" maxlength="4" value="<c:out value="${info.INSPL_CELL2 }"/>" />
                                    -
                                    <input type="text" name="INSPL_CELL3" id="INSPL_CELL3" class="text short number" maxlength="4" value="<c:out value="${info.INSPL_CELL3 }"/>" />
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>주소<i class="require"><em>필수입력</em></i></span>
                                </th>
                                <td colspan="3">
                                    <input type="text" name="INSPL_ZIP" id="INSPL_ZIP" class="text number" maxlength="5" value="<c:out value="${info.INSPL_ZIP }"/>" readonly="readonly" />
                                    <a href="javascript:;" id="searchPostBtn" class="button button-a small">
                                        <span>우편번호 찾기</span>
                                    </a>
                                    <br/>
                                    <input type="text" name="INSPL_ADDR" id="INSPL_ADDR" class="text large" maxlength="60" value="<c:out value="${info.INSPL_ADDR }"/>" readonly="readonly" style="margin-top: 5px;" />
                                    <input type="text" name="INSPL_ADDR2" id="INSPL_ADDR2" class="text large" maxlength="60" value="<c:out value="${info.INSPL_ADDR2 }"/>" style="margin-top: 5px;" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
    <%@ include file="/WEB-INF/jsp/common/template/zipCode.jsp"%>
    <script>
        $(function () {
            var $popup = $(".popup"),
                $frm = $popup.find("#frm");
            $frm.validate({
                ignore : [],
                rules : {
                    INSPL_MEM_NM : {
                        required : true
                    },
                    INSPL_CELL1 : {
                        required : true
                    },
                    INSPL_CELL2 : {
                        required : true
                    },
                    INSPL_CELL3 : {
                        required : true
                    },                    
                    INSPL_ZIP : {
                        required : true
                    },
                    INSPL_ADDR : {
                        required : true
                    },
                    INSPL_ADDR2 : {
                        required : true
                    }
                }
            });
            <%-- 배송정보 저장 이벤트  --%>
            $popup.on("click", "#save", function() {
                $frm.find("input[name='INSPL_CELL']").val($frm.find("#INSPL_CELL1 option:selected").val()+$frm.find("#INSPL_CELL2").val()+$frm.find("#INSPL_CELL3").val());
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("InstallInfo"));
                    }
                }
            });            
            <%-- 우편번호 검색 --%>
            new ZipCode("searchPostBtn", function(data) {
                $frm.find("#INSPL_ZIP").val(data.zipcode);
                $frm.find("#INSPL_ADDR").val(data.roadAddress);
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
