<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
</head>
<body class="popup page-popup" data-menu_group="support" data-menu_subclass="supportDelivery">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <div class="push-guide instant">
                    <i class="icon"></i>
                    <h2 class="title">
                        <span>상품발주 상세정보</span>
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
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>접수일</th>
                                <th>고객명</th>
                                <th>연락처</th>
                                <th>증소(증서배송)</th>
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
                                    <ui:formatDate value="${info.ORD_MST_ORD_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
                                    <ui:formatDate value="${info.JOIN_DT }" pattern="yyyy.MM.dd HH:mm:ss" />
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
                    
                    <h3 class="title">
                        <span>배송정보</span>
                    </h3>
                    <table cellspacing="0" class="table-col table-b">
                        <colgroup>
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: auto;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                        </colgroup>
                            <thead>
                                <tr>
                                    <th>회원번호</th>
                                    <th>제휴업체</th>
                                    <th>모델분류(지원혜택)</th>
                                    <th>제품타입</th>
                                    <th>모델명</th>
                                    <th>배송예정일</th>
                                    <th>배송완료일</th>
                                    <th>배송보류일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <c:out value="${info.ACCNT_NO }" />
                                    </td>                                                
                                    <td>
                                        <c:out value="${info.VDR_MST_NM}" />
                                    </td>
                                    <td>
                                        <c:out value="${info.MODEL_CL_NM}" />
                                        <BR>
                                        <c:out value="${info.PRD_MST_SPL_NM}" />
                                    </td>
                                    <td>
                                        <c:if test="${not empty info.PRD_OPT_DTL_LIST }">
                                            <select class="select" name="PRD_OPT_IDX" id="PRD_OPT_IDX" data-ord_mst_idx="<c:out value="${info.ORD_MST_IDX }"/>">
                                                <c:forTokens  var="option" items="${info.PRD_OPT_DTL_LIST}" delims=",">
                                                <c:set var="value" value="${fn:split(option,'|')}" />
                                                    <option value="<c:out value="${value[0] }"/>" <c:if test="${value[0] eq info.PRD_OPT_IDX }">selected="selected"</c:if>>
                                                        <c:out value="${value[1] }" />
                                                    </option>
                                                </c:forTokens>
                                            </select>
                                            <BR>
                                            <a href="javascript:;" class="button xsmall option">
                                                <span>저장</span>
                                            </a>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:out value="${info.MODEL_NM}" />
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="ORD_MST_DLV_ING_DT" id="ORD_MST_DLV_ING_DT" class="text" data-ord_mst_idx="<c:out value="${info.ORD_MST_IDX}"/>" value="<ui:formatDate value="${info.ORD_MST_DLV_ING_DT}" pattern="yyyy-MM-dd" />" maxlength="10"/>
                                        <a href="javascript:;" class="button xsmall ing">
                                            <span>저장</span>
                                        </a>                                                    
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="ORD_MST_DLV_CPL_DT" id="ORD_MST_DLV_CPL_DT" class="text" data-ord_mst_idx="<c:out value="${info.ORD_MST_IDX}"/>" value="<ui:formatDate value="${info.ORD_MST_DLV_CPL_DT}" pattern="yyyy-MM-dd" />" maxlength="10"/>
                                        <a href="javascript:;" class="button xsmall complete">
                                            <span>저장</span>
                                        </a>                                                    
                                    </td>
                                    <td>
                                        <a href="javascript:;" class="js-datepickr">
                                            <span class="icon datepickr">
                                                <em>날짜선택</em>
                                            </span>
                                        </a>
                                        <input type="text" name="ORD_MST_DLV_WAT_DT" id="ORD_MST_DLV_WAT_DT" class="text" data-ord_mst_idx="<c:out value="${info.ORD_MST_IDX}"/>" value="<ui:formatDate value="${info.ORD_MST_DLV_WAT_DT}" pattern="yyyy-MM-dd" />" maxlength="10"/>
                                        <a href="javascript:;" class="button xsmall hold">
                                            <span>저장</span>
                                        </a>                                                    
                                    </td>
                                    <td class="dlievery-status">
                                        <c:out value="${info.ORD_MST_DLV_STATE_NM}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
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
                                <c:when test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
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
                                    <c:if test="${empty list}">
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
            
            <%-- 옵션저장 클릭 이벤트 --%>
            $frm.on("click", ".option", function() {
                if (confirm("저장 하시겠습니까?")) {
                    var $target = $(this).siblings("select[name='PRD_OPT_IDX']");
                    var array = new Array(),
                        param = new Object();
                    $target.each(function () {
                        var $this = $(this);
                        param.ORD_MST_IDX = $this.data("ord_mst_idx");
                        param.PRD_OPT_IDX = $this.val();
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("OptionModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            });
            <%-- 배송예정일 클릭 이벤트 --%>
            $frm.on("click", ".ing", function() {
                if($(this).siblings("input[name='ORD_MST_DLV_ING_DT']").val()!=""){
                    if (confirm("저장 하시겠습니까?")) {
                        var $button = $(this);
                        var $target = $button.siblings("input[name='ORD_MST_DLV_ING_DT']");
                        var array = new Array(),
                            param = new Object();
                        $target.each(function () {
                            var $this = $(this);
                            param.ORD_MST_IDX = $this.data("ord_mst_idx");
                            param.ORD_MST_DLV_ING_DT = $this.val();
                            array.push(param);
                        });
                        $.postSyncJsonAjax($.action.ajax("DateModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                setDeliveryStatus($button, data.deliveryStatus);
                            } else {
                                alert("저장에 실패하였습니다.");
                            }
                        });
                    }
                } else {
                    alert("날짜를 입력하세요.");
                }
            });
            <%-- 배송완료 클릭 이벤트 --%>
            $frm.on("click", ".complete", function() {
                if($(this).siblings("input[name='ORD_MST_DLV_CPL_DT']").val()!=""){
                    if (confirm("저장 하시겠습니까?")) {
                        var $button = $(this);
                        var $target = $button.siblings("input[name='ORD_MST_DLV_CPL_DT']");
                        var array = new Array(),
                            param = new Object();
                        $target.each(function () {
                            var $this = $(this);
                            param.ORD_MST_IDX = $this.data("ord_mst_idx");
                            param.ORD_MST_DLV_CPL_DT = $this.val();
                            array.push(param);
                        });
                        $.postSyncJsonAjax($.action.ajax("DateModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                setDeliveryStatus($button, data.deliveryStatus);
                            } else {
                                alert("저장에 실패하였습니다.");
                            }
                        });
                    }
                } else {
                    alert("날짜를 입력하세요.");
                }                    
            });
            <%-- 배송보류 클릭 이벤트 --%>
            $frm.on("click", ".hold", function() {
                if($(this).siblings("input[name='ORD_MST_DLV_WAT_DT']").val()!=""){
                    if (confirm("저장 하시겠습니까?")) {
                        var $button = $(this);
                        var $target = $button.siblings("input[name='ORD_MST_DLV_WAT_DT']");
                        var array = new Array(),
                            param = new Object();
                        $target.each(function () {
                            var $this = $(this);
                            param.ORD_MST_IDX = $this.data("ord_mst_idx");
                            param.ORD_MST_DLV_WAT_DT = $this.val();
                            array.push(param);
                        });
                        $.postSyncJsonAjax($.action.ajax("DateModify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                            if (data.isSuccess) {
                                alert("저장 되었습니다.");
                                setDeliveryStatus($button, data.deliveryStatus);
                            } else {
                                alert("저장에 실패하였습니다.");
                            }
                        });
                    }
                } else {
                    alert("날짜를 입력하세요.");
                }                      
            });
            function setDeliveryStatus ($object, stat) {
                $object.closest("td").siblings(".dlievery-status").text(stat);
            }
            <%-- 페이지 이동 --%>
            goPage = function(cPage) {
                $frm.find("input[name='cPage']").val(cPage);
                $frm.postSubmit($.action.popup("Detail"));
            };
            <%-- 특이사항 저장 이벤트  --%>
            $popup.on("click", "#memo", function() {
                if ($frm.find("textarea[name='ORD_MEMO_CTS']").val()!="") {
                    if (confirm("저장 하시겠습니까?")) {
                        $frm.postSubmit($.action.modify("MemoInfo"));
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
