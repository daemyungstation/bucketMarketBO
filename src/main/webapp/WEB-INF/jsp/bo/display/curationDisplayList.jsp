<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<style type="text/css">
    .custom-table {
        width: 100%;
        border: 0px;
    }
    .custom-table tbody tr {
        border: 0px;
    }
    .custom-table tbody tr td {
        border: 0px;
    }
</style>
</head>
<body>
    <!-- body class, 중요 -->
    <div id="header">
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <div id="container">
        <div id="aside" class="aside left">
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <div id="wrapper">
            <div id="breadcrumb"></div>
            <div id="contents">
                <div class="container">
                    <h2 class="title">
                        <span>큐레이션 관리</span>
                    </h2>
                    <small class="desc">
                        <i class="require"><em>필수입력</em></i>보이는 순서대로 질문이 화면에 노출되며, 질문 > 선택 키워드 > 연관검색 키워드는 <strong style="color: red;">모두 필수 입력</strong> 하셔야 합니다.
                    </small>
                    <form name="frm" id="frm">
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 15%;" />
                                <col style="width: 30%;" />
                                <col style="width: 50%;" />
                                <col style="width: 5%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>정렬</th>
                                    <th>질문</th>
                                    <th>선택 키워드(최대10개)</th>
                                    <th colspan="2">연관검색 키워드(제한없음)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr class="tr-sort">
                                            <td>
                                                <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                                <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                            </td>
                                            <td>
                                                <input type="hidden" name="CRT_MST_KEYs" value="<c:out value="${i.index }"/>"/>
                                                <input type="text" name="CRT_MST_QSTs" class="text xlarge" value="<c:out value="${row.CRT_MST_QST }"/>" maxlength="70"/>
                                            </td>
                                            <td colspan="2" class="left">
                                                <table class="custom-table">
                                                    <colgroup>
                                                        <col style="width: 40%" />
                                                        <col style="width: 50%;" />
                                                        <col style="width: 5%;" />
                                                        <col style="width: 5%;" />
                                                    </colgroup>
                                                    <tbody>
                                                        <c:if test="${not empty row.keywordList }">
                                                            <c:forEach var="keywordRow" items="${row.keywordList }" varStatus="y">
                                                                <tr>
                                                                    <td>
                                                                        <input type="text" name="CRT_KWD_SLT<c:out value="${i.index }"/>" class="text large required" value="<c:out value="${keywordRow.CRT_KWD_SLT }"/>" maxlength="100" title="[선택 키워드]은(는) 필수입력 사항입니다."/>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="CRT_KWD_RLT<c:out value="${i.index }"/>" class="text xlarge required" value="<c:out value="${keywordRow.CRT_KWD_RLT }"/>" maxlength="700" title="[연관검색 키워드]은(는) 필수입력 사항입니다."/>
                                                                    </td>
                                                                    <td>
                                                                        <a href="javascript:;" class="button xsmall keyword-search">
                                                                            <span>검색</span>
                                                                        </a>
                                                                    </td>
                                                                    <td>
                                                                        <c:if test="${y.first }">
                                                                            <a href="javascript:;" class="button xsmall add-keyword">
                                                                                <span>+</span>
                                                                            </a>
                                                                        </c:if>
                                                                        <c:if test="${not y.first }">
                                                                            <a href="javascript:;" class="button xsmall warning remove-keyword">
                                                                                <span>-</span>
                                                                            </a>
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${empty row.keywordList }">
                                                            <tr>
                                                                <td>
                                                                    <input type="text" name="CRT_KWD_SLT<c:out value="${i.index }"/>" class="text large required" value="" maxlength="100" title="[선택 키워드]은(는) 필수입력 사항입니다."/>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="CRT_KWD_RLT<c:out value="${i.index }"/>" class="text xlarge required" value="" maxlength="700" title="[연관검색 키워드]은(는) 필수입력 사항입니다."/>
                                                                </td>
                                                                <td>
                                                                    <a href="javascript:;" class="button xsmall keyword-search">
                                                                        <span>검색</span>
                                                                    </a>
                                                                </td>
                                                                <td>
                                                                    <a href="javascript:;" class="button xsmall add-keyword">
                                                                        <span>+</span>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>
                                            </td>
                                            <td>
                                                <c:if test="${i.first }">
                                                    <a href="javascript:;" class="button xsmall add-curation">
                                                        <span>추가</span>
                                                    </a>
                                                </c:if>
                                                <c:if test="${not i.first }">
                                                    <a href="javascript:;" class="button xsmall warning remove-curation">
                                                        <span>삭제</span>
                                                    </a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list }">
                                    <tr class="tr-sort">
                                        <td>
                                            <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                            <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                        </td>
                                        <td>
                                            <input type="hidden" name="CRT_MST_KEYs" value="0"/>
                                            <input type="text" name="CRT_MST_QSTs" class="text xlarge" value="" maxlength="70"/>
                                        </td>
                                        <td colspan="2" class="left">
                                            <table class="custom-table">
                                                <colgroup>
                                                    <col style="width: 40%" />
                                                    <col style="width: 50%;" />
                                                    <col style="width: 5%;" />
                                                    <col style="width: 5%;" />
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="CRT_KWD_SLT0" class="text large required" value="" maxlength="100" title="[선택 키워드]은(는) 필수입력 사항입니다."/>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="CRT_KWD_RLT0" class="text xlarge required" value="" maxlength="700" title="[연관검색 키워드]은(는) 필수입력 사항입니다."/>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:;" class="button xsmall keyword-search">
                                                                <span>검색</span>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:;" class="button xsmall add-keyword">
                                                                <span>+</span>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td>
                                            <a href="javascript:;" class="button xsmall add-curation">
                                                <span>추가</span>
                                            </a>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </form>
                    <div class="section-button">
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                        </div>
                    </div>
                    <form name="popupForm" id="popupForm"></form>
                </div>
            </div>
        </div>
        <div id="quickmenu" class="aside right">
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
    </div>
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery.tmpl.min.js"></script>
    <script id="keywordTemplate" type="text/x-jquery-tmpl">
        <tr>
            <td>
                <input type="text" name="CRT_KWD_SLT\${KEY}" class="text large required" value="" maxlength="100" title="[선택 키워드]은(는) 필수입력 사항입니다."/>
            </td>
            <td>
                <input type="text" name="CRT_KWD_RLT\${KEY}" class="text xlarge required" value="" maxlength="700" title="[연관검색 키워드]은(는) 필수입력 사항입니다."/>
            </td>
            <td>
                <a href="javascript:;" class="button xsmall keyword-search">
                    <span>검색</span>
                </a>
            </td>
            <td>
                {{if KEYWORD_FIRST_YN == "Y"}}
                    <a href="javascript:;" class="button xsmall add-keyword">
                        <span>+</span>
                    </a>
                {{else}}
                    <a href="javascript:;" class="button xsmall warning remove-keyword">
                        <span>-</span>
                    </a>
                {{/if}}
            </td>
        </tr>
    </script>
    <script id="curationTemplate" type="text/x-jquery-tmpl">
        <tr class="tr-sort">
            <td>
                <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
            </td>
            <td>
                <input type="hidden" name="CRT_MST_KEYs" value="\${KEY}"/>
                <input type="text" name="CRT_MST_QSTs" class="text xlarge" value="" maxlength="70"/>
            </td>
            <td colspan="2" class="left">
                <table class="custom-table">
                    <colgroup>
                        <col style="width: 40%" />
                        <col style="width: 50%;" />
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                    </colgroup>
                    <tbody>
                        {{tmpl "#keywordTemplate"}}
                    </tbody>
                </table>
            </td>
            <td>
                <a href="javascript:;" class="button xsmall warning remove-curation">
                    <span>삭제</span>
                </a>
            </td>
        </tr>
    </script>
    <script>
        $(function() {
            var $contents = $("#contents"),
                $frm = $contents.find("#frm"),
                $popupForm = $contents.find("#popupForm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    CRT_MST_QSTs : {
                        required : true
                    }
                },
                messages : {
                    CRT_MST_QSTs : {
                        required : "[질문]은(는) 필수입력 사항입니다."
                    }
                }
            });
            
            <%-- 순서변경 --%>
            $frm.on("click", ".row-sort", function() {
                var $this = $(this),
                    $tr = $this.closest("tr"),
                    $tbody = $this.closest("tbody");
                if (($this.data("sort_type") == "up" && $tr.prev().length > 0) ||
                        ($this.data("sort_type") == "down" && $tr.next().length > 0)) {
                    var $tds = $tr.find("td");
                    var $contents = $tds.slice($tds.filter(":first").index() + 1, $tds.filter(":last").index()).detach();
                    var $targetTr = ($this.data("sort_type") == "up") ? $tr.prev() : $tr.next();
                    var $targetTds = $targetTr.find("td");
                    var $targetContents = $targetTds.slice($targetTds.filter(":first").index() + 1, $targetTds.filter(":last").index()).detach();
                    $targetTr.find("td:first").after($contents);
                    $tr.find("td:first").after($targetContents);
                }
            });
            <%-- 검색 버튼 클릭 이벤트 --%>
            $frm.on("click", ".keyword-search", function() {
                var $this = $(this);
                $popupForm.postPop($.action.popup("Search"), "curationDisplaySearchPopup", "width=900,height=500,left=10,top=10", {
                    display : {
                        curation : {
                            search : function (data) {
                                var $target = $this.closest("tr").find("input[name^='CRT_KWD_RLT']");
                                var value = $target.val();
                                if (value != "") {
                                    value += ",";
                                    var keywords = value.split(",");
                                    $.each(data, function(i, keyword) {
                                        if (keywords.indexOf(keyword) > -1) {
                                            data.splice(i, 1);
                                        }
                                    });
                                }
                                if (data.length > 0) {
                                    value += data.join(",");
                                    $target.val(value);
                                } 
                            }
                        }
                    }
                });
            });
            
            var key = $frm.find(".tr-sort").length;
            var $curationTemplate = $("#curationTemplate")
                , $keywordTemplate = $("#keywordTemplate");
            <%-- 큐레이션 질문 추가 버튼 클릭 이벤트 --%>
            $frm.on("click", ".add-curation", function() {
                $curationTemplate.tmpl({"KEY" : key++, KEYWORD_FIRST_YN : "Y"}).appendTo($(this).closest("tbody"));
            });
            <%-- 큐레이션 키워드 추가 버튼 클릭 이벤트 --%>
            $frm.on("click", ".add-keyword", function() {
                var $this = $(this);
                var $tbody = $this.closest("tbody");
                if ($tbody.find("tr").length < 10) {
                    $keywordTemplate.tmpl({"KEY" : $this.closest(".tr-sort").find("input[name='CRT_MST_KEYs']").val(), KEYWORD_FIRST_YN : "N"}).appendTo($tbody);
                }
            });
            <%-- 큐레이션 질문, 키워드 삭제 버튼 클릭 이벤트 --%>
            $frm.on("click", ".remove-curation, .remove-keyword", function() {
                $(this).closest("tr").remove();
            });
            <%-- 저장 버튼 클릭 이벤트 --%>
            $contents.on("click", "#save", function() {
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
