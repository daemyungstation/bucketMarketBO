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
                        <span>사용자 관리</span>
                    </h2>
                    <h3 class="title">
                        <span>등록</span>
                    </h3>
                    <p>
                        <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                        <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>" />
                        <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>" />
                        <input type="hidden" name="searchAuthority" value="<c:out value="${commandMap.searchAuthority }"/>" />
                        <input type="hidden" name="searchAdmMstState" value="<c:out value="${commandMap.searchAdmMstState }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    </form>
                    <form id="frm" name="frm">
                        <input type="hidden" id="idCheckYn" value="" />
                        <input type="hidden" id="checkId" value="" />
                        <table cellspacing="0" class="table-row table-a">
                            <!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: 30%;" />
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: 30%;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <span>아이디<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" name="ADM_MST_ID" id="ADM_MST_ID" class="text" maxlength="10" />
                                        <a href="javascript:;" id="idCheck" class="button button-c small">
                                            <span>중복확인</span>
                                        </a>
                                        <small style="margin-left: 10px;">4~10자의 영문, 숫자 사용</small>
                                    </td>
                                    <th>
                                        <span>이름<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="text" name="ADM_MST_NM" id="AMD_MST_NM" class="text" maxlength="6" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>비밀번호<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <input type="password" name="ADM_MST_PWD" id="ADM_MST_PWD" class="text" maxlength="10" />
                                        <small style="margin-left: 10px;">4~10자의 영문, 숫자, 특수문자를 포함하여 입력해 주세요.</small>
                                    </td>
                                    <th>
                                        <span>관리자권한<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <select class="select" name="AUT_MST_IDX" id="AUT_MST_IDX">
                                            <option value="">선택</option>
                                            <c:if test="${not empty authList }">
                                                <c:forEach var="row" items="${authList }" varStatus="i">
                                                    <option value="<c:out value="${row.AUT_MST_IDX }"/>" data-aut_mst_vdr_yn="<c:out value="${row.AUT_MST_VDR_YN }"/>"><c:out value="${row.AUT_MST_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <select class="select" name="ADM_MST_SUB_IDX" id="ADM_MST_SUB_IDX" style="display: none;">
                                            <option value="">입점업체선택</option>
                                            <c:if test="${not empty vendorList }">
                                                <c:forEach var="vendorRow" items="${vendorList }" varStatus="i">
                                                    <option value="<c:out value="${vendorRow.VDR_MST_IDX }"/>"><c:out value="${vendorRow.VDR_MST_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>휴대폰<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td>
                                        <select class="select" name="ADM_MST_HP1" id="ADM_MST_HP1">
                                            <option value="">선택</option>
                                            <c:if test="${not empty codes.HP_CODE }">
                                                <c:forEach var="row" items="${codes.HP_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <input type="text" name="ADM_MST_HP2" id="ADM_MST_HP2" class="text number" maxlength="4" />
                                        -
                                        <input type="text" name="ADM_MST_HP3" id="ADM_MST_HP3" class="text number" maxlength="4" />
                                    </td>
                                    <th>
                                        <span>전화번호 </span>
                                    </th>
                                    <td>
                                        <select class="select" name="ADM_MST_TEL1" id="ADM_MST_TEL1">
                                            <option value="">선택</option>
                                            <c:if test="${not empty codes.TEL_CODE }">
                                                <c:forEach var="row" items="${codes.TEL_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                        <input type="text" name="ADM_MST_TEL2" id="ADM_MST_TEL2" class="text number" maxlength="4" />
                                        -
                                        <input type="text" name="ADM_MST_TEL3" id="ADM_MST_TEL3" class="text number" maxlength="4" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>이메일<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" name="ADM_MST_EMAIL_ID" id="ADM_MST_EMAIL_ID" class="text" maxlength="50" />
                                        @
                                        <input type="text" name="ADM_MST_EMAIL_DOMAIN" id="ADM_MST_EMAIL_DOMAIN" class="text" maxlength="50" />
                                        <select class="select" name="emailDomain" id="emailDomain">
                                            <option value="">직접입력</option>
                                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                                <c:forEach var="row" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
                                                    <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }" /></option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span>상태<i class="require"><em>필수입력</em></i></span>
                                    </th>
                                    <td colspan="3">
                                        <input type="radio" id="stateA" name="ADM_MST_STATE" value="Y" class="radio" checked="checked" />
                                        <label for="stateA">사용</label>
                                        <input type="radio" id="stateB" name="ADM_MST_STATE" value="N" class="radio" />
                                        <label for="stateB">미사용</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- // table -->
                    </form>
                    <div class="section-button">
                        <!-- section-button -->
                        <div class="wrap text-center">
                            <a href="javascript:;" id="save" class="button large primary">
                                <span>저장</span>
                            </a>
                            <a href="javascript:;" id="goList" class="button large">
                                <span>목록</span>
                            </a>
                        </div>
                    </div>
                    <!-- // section-button -->
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
                $searchForm = $wrapper.find("#searchForm"),
                $frm = $wrapper.find("#frm");
            <%-- 폼체크 --%>
            $frm.validate({
                rules : {
                    ADM_MST_ID : {
                        required : true,
                        engOrNum : true,
                        minlength : 4,
                        maxlength : 10
                    },
                    ADM_MST_NM : {
                        required : true
                    },
                    ADM_MST_PWD : {
                        required : true,
//                         engOrNum : true,
                        minlength : 4,
                        maxlength : 10,
                        passwordCk : true
                    },
                    AUT_MST_IDX : {
                        required : true
                    },
                    ADM_MST_SUB_IDX : {
                        required : function (el) {
                            return ($frm.find("#AUT_MST_IDX").children(":selected").data("aut_mst_vdr_yn") == "Y");
                        }
                    },
                    ADM_MST_HP1 : {
                        required : true,
                        number : true
                    },
                    ADM_MST_HP2 : {
                        required : true,
                        number : true,
                        minlength : 3,
                        maxlength : 4
                    },
                    ADM_MST_HP3 : {
                        required : true,
                        number : true,
                        minlength : 4,
                        maxlength : 4
                    },
                    ADM_MST_TEL1 : {
                        required : false
                    },
                    ADM_MST_TEL2 : {
                        required : false,
                        number : true,
                        minlength : 3,
                        maxlength : 4
                    },
                    ADM_MST_TEL3 : {
                        required : false,
                        number : true,
                        minlength : 4,
                        maxlength : 4
                    },
                    ADM_MST_EMAIL_ID : {
                        required : true,
                        emailId : true,
                        maxlength : 20
                    },
                    ADM_MST_EMAIL_DOMAIN : {
                        required : true,
                        emailDomain : true,
                        maxlength : 20
                    }
                }
            });
            <%-- 권한 변경시 --%>
            $wrapper.on("change", "select[name=AUT_MST_IDX]", function() {
                if ($(this).children(":selected").data("aut_mst_vdr_yn") == "Y") {
                    $frm.find("#ADM_MST_SUB_IDX").show();
                } else {
                    $frm.find("#ADM_MST_SUB_IDX").hide();
                }
            });
            <%-- 도메인 변경 이벤트 --%>
            $wrapper.on("change", "#emailDomain", function() {
                var $obj = $frm.find("#ADM_MST_EMAIL_DOMAIN");
                $obj.prop("readonly", !($(this).val() == ""));
                $obj.val($(this).val());
            });
            <%-- 목록 버튼 클릭 이벤트 --%> 
            $wrapper.on("click", "#goList", function() {
                $searchForm.postSubmit($.action.list());
            });
            <%-- 아이디 중복 체크 --%>
            $wrapper.on("click", "#idCheck", function() {
                var $obj = $frm.find("#ADM_MST_ID");
                var value = $obj.val();
                $("#checkId").val(value); // 중복체크한 id 
                if (value == "") {
                    alert("[아이디]은(는) 필수입력 사항입니다.");
                    $obj.focus();
                } else {
                    var pattern = /^[0-9a-zA-Z]{4,10}$/;
                    if (!pattern.test(value)) {
                        alert("4~10자의 영문, 숫자만 사용할 수 있습니다.");
                        $obj.focus();
                    } else {
                        $.postSyncJsonAjax($.action.ajax("IdCheck"), {"ADM_MST_ID" : value}, function(data) {
                            if (data.successYn == "Y") {
                                if (data.resultYn == "N") {
                                    alert("이미 사용중인 아이디 입니다.");
                                } else {
                                    alert("사용가능한 아이디 입니다.");
                                }
                                $("#idCheckYn").val(data.resultYn);
                                $obj.focus();
                            } else {
                                alert("데이터 전송중 데이터가 누락 되었습니다./n다시 시도해 주십시오.");
                            }
                        });
                    }
                }
            });
            <%-- 등록 이벤트 --%>
            $wrapper.on("click", "#save", function() {
                if ($frm.valid()) {
                    var $obj = $frm.find("#idCheck");
                    var checkYn = $frm.find("#idCheckYn").val(),
                        admMstId = $frm.find("#ADM_MST_ID").val(),
                        checkId = $frm.find("#checkId").val();
                    if (checkYn == "Y" && checkId == admMstId) {
                        if (confirm("저장 하시겠습니까?")) {
                            $frm.postSubmit($.action.regist());
                        }
                    } else {
                        if (checkId != admMstId) {
                            alert("아이디 중복을 확인해 주십시오.");
                        } else {
                            alert("이미 사용중인 아이디 입니다.");
                        }
                        $obj.focus();
                    }
                }
            });
        });
    </script>
</body>
</html>