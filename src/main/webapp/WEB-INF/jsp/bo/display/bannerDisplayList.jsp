<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="contents-inner" data-cmn_com_idx="<c:out value="${commandMap.CMN_COM_IDX }"/>">
    <h3 class="title">
        <span><c:out value="${commandMap.CMN_COM_PATH }" escapeXml="false"/></span>
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
            <a href="javascript:;" id="save" class="button small info">
                <span>순서저장</span>
            </a>
            <a href="javascript:;" id="goForm" class="button small primary">
                <span>등록</span>
            </a>
        </div>
    </div>
    <form id="frm" name="frm">
        <input type="hidden" name="BNR_MST_IDX" value="" />
        <c:forEach var="item" items="${commandMap}">
            <c:if test="${item.key eq 'CMN_COM_PATH' }">
                <input type="hidden" name="<c:out value="${item.key }"/>" value="<c:out value="${item.value }" escapeXml="false"/>" />
            </c:if>
            <c:if test="${item.key ne 'CMN_COM_PATH' }">
                <input type="hidden" name="<c:out value="${item.key }"/>" value="<c:out value="${item.value }"/>" />
            </c:if>
        </c:forEach>
        <table cellspacing="0" class="table-col table-b">
            <colgroup>
                <col style="width: 4%;" />
                <col style="width: auto;" />
                <col style="width: 15%;" />
                <col style="width: 10%;" />
                <col style="width: 10%;" />
                <col style="width: 10%;" />
                <col style="width: 10%;" />
                <col style="width: 10%;" />
            </colgroup>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>배너명</th>
                    <th>전시기간</th>
                    <th>잔여기간</th>
                    <th>진행여부</th>
                    <th>PC</th>
                    <th>MOBILE</th>
                    <th>전시순서</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="row" items="${list }" varStatus="i">
                            <tr class="tr-sort" data-bnr_mst_idx="<c:out value="${row.BNR_MST_IDX }"/>">
                                <td>
                                    <c:out value="${fn:length(list) - i.index }" />
                                </td>
                                <td>
                                    <a href="javascript:;" class="list-title" data-bnr_mst_idx="<c:out value="${row.BNR_MST_IDX }"/>">
                                        <c:out value="${row.BNR_MST_TITLE }"/>
                                    </a>
                                </td>
                                <td>
                                    <ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy.MM.dd"/>
                                    ~
                                    <ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy.MM.dd"/>
                                </td>
                                <td>
                                    <c:out value="${row.BNR_MST_DIFF }"/>
                                </td>
                                <td>
                                    <c:out value="${row.BNR_MST_STATE}"/>
                                </td>
                                <td>
                                    <a href="javascript:;" class="button xsmall info image-preview" data-cmm_fle_idx="<c:out value="${row.CMM_FLE_PC_IDX }"/>" data-device="<c:out value="${Const.DEVICE[Const.PC] }"/>">
                                        <span>미리보기</span>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:;" class="button xsmall info image-preview" data-cmm_fle_idx="<c:out value="${row.CMM_FLE_MOBILE_IDX }"/>" data-device="<c:out value="${Const.DEVICE[Const.MOBILE] }"/>">
                                        <span>미리보기</span>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                    <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td class="td_no_result"></td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </form>
</div>
<script>
    $(function () {
        var $contents = $(".contents-inner"),
            $frm = $contents.find("#frm");
        <%-- 순서변경 --%>
        $frm.off("click", ".row-sort").on("click", ".row-sort", function() {
            var $this = $(this);
            var $tr = $this.closest("tr.tr-sort");
            if ($this.data("sort_type") == "up" && $tr.prev().length > 0) {
                $tr.prev().before($tr.clone());
                $tr.remove();
            } else if ($this.data("sort_type") == "down" && $tr.next().length > 0) {
                $tr.next().after($tr.clone());
                $tr.remove();
            }
            $tr = $frm.find("tbody tr");
            $tr.each(function (i) {
                $(this).children("td:first").text($tr.length - i);
            });
            
        });
        <%-- 순서저장 버튼 클릭 이벤트 --%>
        $contents.off("click", "#save").on("click", "#save", function() {
            var $tr = $frm.find(".tr-sort");
            if ($tr.length > 0) {
                if (confirm("저장 하시겠습니까?")) {
                    var array = new Array();
                    $tr.each(function (i) {
                        var param = new Object();
                        param.BNR_MST_IDX = $(this).data("bnr_mst_idx");
                        param.BNR_MST_SRT = (i + 1);
                        array.push(param);
                    });
                    $.postSyncJsonAjax($.action.ajax("Modify"), {"PARAMS" : JSON.stringify(array)}, function(data) {
                        if (data.isSuccess) {
                            alert("저장 되었습니다.");
                        } else {
                            alert("저장에 실패하였습니다.");
                        }
                    });
                }
            }
        });
        <%-- 등록 버튼 클릭 이벤트 --%>
        $contents.off("click", "#goForm").on("click", "#goForm", function() {
            $.postSyncHtmlAjax($.action.form(), $frm.serialize(), setMainContents);
        });
        <%-- 제목 a Tag 클릭 이벤트 --%>
        $contents.off("click", ".list-title").on("click", ".list-title", function() {
            $frm.find("input[name='BNR_MST_IDX']").val($(this).data("bnr_mst_idx"));
            $.postSyncHtmlAjax($.action.edit(), $frm.serialize(), setMainContents);
        });
        <%-- 미리보기 버튼 클릭 이벤트 --%>
        $contents.off("click", ".image-preview").on("click", ".image-preview", function() {
            var $this = $(this);
            $.common.popup.display.preview($this.data("cmm_fle_idx"), $this.data("device"))
        });
    });
    
</script>