<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
<style type="text/css">
<!--
-->
</style>
</head>
<body>
    <!-- body class, 중요 -->
    <div id="header">
        <!-- header -->
        <%@ include file="/WEB-INF/jsp/bo/include/top.jsp"%>
    </div>
    <!-- // header -->
    <div id="container">
        <!-- container -->
        <div id="aside" class="aside left">
            <!-- aside -->
            <%@ include file="/WEB-INF/jsp/bo/include/left.jsp"%>
        </div>
        <!-- // aside -->
        <div id="wrapper">
            <!-- wrapper -->
            <div id="breadcrumb"></div>
            <!-- breadcrumb -->
            <div id="contents">
                <!-- contents -->
                <div class="container">
                
                    <!-- container -->
                    <h2 class="title">
                        <span>등급 관리</span>
                    </h2>
                    
                    <form id="frm" name="frm">
                    
                        <h3 class="title">
                            <span>등급산정 기간</span>
                        </h3>
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>등급산정 기간<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <td>
                                        <input type="hidden" name="RDP_TERM_IDX" value="<c:out value="${term.RDP_TERM_IDX }" />"/>
                                        <select name="RDP_TERM_CD">
                                            <c:forEach var="item" items="${codes.PLANNER_GRADE_TERM }" varStatus="i">
                                                <option value="<c:out value="${item.CMN_COM_IDX }"/>" <c:if test="${term.RDP_TERM_CD eq item.CMN_COM_IDX }">selected="selected"</c:if> >
                                                    ${item.CMN_COM_NM }
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <!-- // table -->
                        <h3 class="title">
                            <span>등급</span>
                        </h3>
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 5%;" />
                                <col style="width: 10%;" />
                                <col style="width: 20%;" />
                                <col style="width: auto;" />
                                <col style="width: 8%;" />
                                <col style="width: 8%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label class="label">
                                            <span>레벨<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <th>
                                        <label class="label">
                                            <span>등급명<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <th>
                                        <label class="label">
                                            <span>등급산정 기준<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <th>
                                        <label class="label">
                                            <span>등급별 혜택<i class="require"><em>필수입력</em></i></span>
                                        </label>
                                    </th>
                                    <th>
                                        <label class="label">
                                            <span>회원수</span>
                                        </label>
                                    </th>
                                    <th>
                                        <label class="label">
                                            <span>관리</span>
                                        </label>
                                    </th>
                                </tr>
                                
                                <%-- 등급 목록 --%>
                                <c:forEach var="item" items="${list}" varStatus="i">
                                    <tr>
                                        <input type="hidden" name="RDP_LVL_IDX" value="<c:out value="${item.RDP_LVL_IDX }" />" />
                                        <td class="text-center">
                                            <span>${i.count }</span>
                                        </td>
                                        <td>
                                            <input type="text" name="RDP_LVL_NM" class="text large" value="<c:out value="${item.RDP_LVL_NM }" />" maxlength="30" />
                                        </td>
                                        <td>
                                            <input type="text" name="RDP_LVL_STD" class="text xlarge" value="<c:out value="${item.RDP_LVL_STD }" />" maxlength="2000" />
                                        </td>
                                        <td>
                                            <input type="text" name="RDP_LVL_BNF" class="text xlarge" value="<c:out value="${item.RDP_LVL_BNF }" />" maxlength="2000" />
                                        </td>
                                        <td class="text-center">
                                            <a href="javascript:;" class="showMember" data-rdp_lvl_idx="${item.RDP_LVL_IDX }"><span><c:out value="${item.PLANNER_COUNT }" /></span></a>
                                        </td>
                                        <td>
                                            <a href="javascript:;" class="button selectMember" data-rdp_lvl_idx="${item.RDP_LVL_IDX }"><span>회원선정</span></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%-- 등급 목록 --%>
                                
                            </tbody>
                        </table>
                    </form>
                    
                    <%-- 팝업 - 회원선정 / 회원목록 --%>
                    <form id="plannerForm" name="plannerForm">
                        <input type="hidden" name="RDP_LVL_IDX" value="" />
                        <input type="hidden" name="searchRdpLvlIdx" value="" />
                    </form>
                    
                    <div class="section-button">
                        <!-- section-button -->
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                        </div>
                    </div>
                    
                </div>
                <!-- // container -->
            </div>
            <!-- // contents -->
        </div>
        <!-- // wrapper -->
        <div id="quickmenu" class="aside right">
            <!-- quickmenu-->
            <%@ include file="/WEB-INF/jsp/bo/include/quick.jsp"%>
        </div>
        <!-- // quickmenu -->
    </div>
    <!-- // container -->
    <div id="footer">
        <%@ include file="/WEB-INF/jsp/bo/include/footer.jsp"%>
    </div>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
    $(function() {
        var $wrapper = $("#wrapper"),
            $frm = $wrapper.find("#frm"),
            $plannerForm = $wrapper.find("#plannerForm");
        // 폼
        $frm.validate({
            rules : {
                RDP_LVL_NM : {
                    required : true
                },
                RDP_LVL_STD : {
                    required : true
                },
                RDP_LVL_BNF : {
                    required : true
                }
            },
            messages : {
                RDP_LVL_NM : {
                    required : "[등급명] 은(는) 필수입력 사항입니다."
                },
                RDP_LVL_STD : {
                    required : "[등급산정 기준] 은(는) 필수입력 사항입니다."
                },
                RDP_LVL_BNF : {
                    required : "[등급별 혜택] 은(는) 필수입력 사항입니다."
                }
            }
        });
        // 회원수
        $wrapper.on("click", "a.showMember", function() {
            $plannerForm.find("input[name='searchRdpLvlIdx']").val($(this).data("rdp_lvl_idx"));
            $plannerForm.postPop($.action.popup("List"), "plannerGradeListPopup", "width=1600,height=800,left=50,top=50");
        });
        // 회원선정
        $wrapper.on("click", "a.selectMember", function() {
            $plannerForm.find("input[name='RDP_LVL_IDX']").val($(this).data("rdp_lvl_idx"));
            $plannerForm.postPop($.action.popup("Upload"), "plannerGradeUploadPopup", "width=800,height=600,left=100,top=100");
        });
        // 저장
        $wrapper.on("click", "#save", function() {
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
