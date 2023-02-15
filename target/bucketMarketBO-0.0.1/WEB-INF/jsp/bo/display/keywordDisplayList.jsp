<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
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
                        <span>인기키워드 관리</span>
                    </h2>
                    <form name="frm" id="frm">
                        <table cellspacing="0" class="table-col table-b">
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 20%;" />
                                <col style="width: 25%;" />
                                <col style="width: 50%;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>정렬</th>
                                    <th>키워드명</th>
                                    <th>검색조건</th>
                                    <th>링크URL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="0"/>
                                <c:if test="${not empty list }">
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr class="tr-sort">
                                            <td>
                                                <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                                <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                            </td>
                                            <td>
                                                <input type="hidden" name="PPL_WRD_IDXs" value="<c:out value="${row.PPL_WRD_IDX }"/>"/>
                                                <input type="text" name="PPL_WRD_TEXTs" class="text xlarge" value="<c:out value="${row.PPL_WRD_TEXT }"/>" maxlength="30"/>
                                            </td>
                                            <td>
                                                <c:forEach var="type" items="${Const.KEYWORD_TYPES }" varStatus="y">
                                                    <input type="radio" name="PPL_WRD_SCH_<c:out value="${index }"/>" id="PPL_WRD_SCH_<c:out value="${index }"/>_<c:out value="${y.index }"/>" class="radio" value="<c:out value="${type.key }"/>" <c:if test="${row.PPL_WRD_SCH eq type.key }">checked="checked"</c:if>/>
                                                    <label for="PPL_WRD_SCH_<c:out value="${index }"/>_<c:out value="${y.index }"/>"><c:out value="${type.value }"/></label>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <input type="text" name="PPL_WRD_URLs" class="text xlarge" value="<c:out value="${row.PPL_WRD_URL }"/>" maxlength="100" placeholder="(http://)필수입력"/>
                                            </td>
                                        </tr>
                                        <c:set var="index" value="${index + 1 }"/>
                                    </c:forEach>
                                </c:if>
                                <c:forEach begin="1" end="${10 - fn:length(list) }" varStatus="i">
                                    <tr class="tr-sort">
                                        <td>
                                            <a href="javascript:;" class="row-sort" data-sort_type="up">△ </a>
                                            <a href="javascript:;" class="row-sort" data-sort_type="down"> ▽</a>
                                        </td>
                                        <td>
                                            <input type="hidden" name="PPL_WRD_IDXs" value="0"/>
                                            <input type="text" name="PPL_WRD_TEXTs" class="text xlarge" value="" maxlength="30"/>
                                        </td>
                                        <td>
                                            <c:forEach var="type" items="${Const.KEYWORD_TYPES }" varStatus="y">
                                                <input type="radio" name="PPL_WRD_SCH_<c:out value="${index }"/>" id="PPL_WRD_SCH_<c:out value="${index }"/>_<c:out value="${y.index }"/>" class="radio" value="<c:out value="${type.key }"/>" <c:if test="${y.first }">checked="checked"</c:if>/>
                                                <label for="PPL_WRD_SCH_<c:out value="${index }"/>_<c:out value="${y.index }"/>"><c:out value="${type.value }"/></label>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <input type="text" name="PPL_WRD_URLs" class="text xlarge" value="" maxlength="100" placeholder="(http://)필수입력"/>
                                        </td>
                                    </tr>
                                    <c:set var="index" value="${index + 1 }"/>
                                </c:forEach>
                            </tbody>
                        </table>
                        <small class="desc">
                            <i class="require"><em>필수입력</em></i>최소 1개 이상 ~ 최대 10개 까지 등록 가능하며, 특정 링크 URL로 페이지 이동을 원하시면 ‘링크 페이지로 이동’ 선택 후, 랜딩 URL을 입력해주세요.
                        </small>
                    </form>
                    <div class="section-button">
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                        </div>
                    </div>
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
    <script>
        $(function() {
            var $contents = $("#contents"),
                $frm = $contents.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                ignore : [],
                rules : {
                    PPL_WRD_URLs : {
                        required : function (el) {
                            return ($(el).closest("tr").find("input[type='radio']:checked").val() == "<c:out value="${Const.KEYWORD_TYPE_LINKE}"/>")
                        },
                        url : true,
                    }
                },
                messages : {
                    PPL_WRD_URLs : {
                        required : "[링크URL]은(는) 필수입력 사항입니다.",
                        url : "[링크URL]URL을 올바로 입력해 주십시오."
                    }
                }
            });
            
            <%-- 순서변경 --%>
            $frm.on("click", ".row-sort", function() {
                var $this = $(this);
                var $tr = $this.closest("tr.tr-sort");
                if ($this.data("sort_type") == "up" && $tr.prev().length > 0) {
                    $tr.prev().before($tr.clone());
                    $tr.remove();
                } else if ($this.data("sort_type") == "down" && $tr.next().length > 0) {
                    $tr.next().after($tr.clone());
                    $tr.remove();
                }
            });
            <%-- 저장 버튼 클릭 이벤트 --%>
            $contents.on("click", "#save", function() {
                if ($frm.valid()) {
                    if (confirm("저장 하시겠습니까?")) {
                        var array = new Array();
                        $frm.find("input[name^='PPL_WRD_SCH']:checked").each(function () {
                            array.push(TagUtil.createDynamicInput("hidden", "PPL_WRD_SCHs", $(this).val()));
                        });
                        $frm.append(array);
                        $frm.postSubmit($.action.proc());
                    }
                }
            });
        });
    </script>
</body>
</html>
