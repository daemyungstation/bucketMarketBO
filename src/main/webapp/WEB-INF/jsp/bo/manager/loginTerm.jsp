<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="isLoginPage" value="true"/>
    <%@ include file="/WEB-INF/jsp/bo/include/head.jsp"%>
    <%@ include file="/WEB-INF/jsp/bo/include/noBack.jsp"%> 
</head>
<body class="page-login" data-menu_group="manager" data-menu_subclass="login">
    <header class="area-header">
        <div class="contain-header">
            <h1><img src="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc-admin/dm-img/img_logo_admin.png" alt="대명아임레디" /></h1>
        </div>
    </header>
    <div class="area-body">
        <div class="contain-admin-login">
            <div class="box-main-title">
                <p class="login-title-blue">제휴업체 약관동의</p>
                <p class="login-totle-text">최초 1회, 로그인 시 제휴사 약관 동의가 필요합니다.</p>
            </div>
    
            <div class="box-main-agreement">
                <div class="box-agreement-inner">
                    <c:out value="${info.AGR_MST_CONTENTS }" escapeXml="false"/>
                </div>
            </div>
    
            <div class="box-agreement-check">
                <form id="frm" name="frm" method="post">
                    <label class="form-checkbox"><input type="checkbox" id="VDR_AGR_YN" name="VDR_AGR_YN" value="Y">제휴사 약관에 동의합니다.<i>(필수)</i></label>
                </form>
                <span class="btn-type-text1"><button onclick="goLogin()">확인</button></span>
            </div>
            
        </div>
    </div>
    <footer class="area-footer">
        <div class="area-inner">
            <p class="text-copyright">Copyright © DAEMYUNGSTATION.CO.LTD. All rights reserved.</p>
        </div>
    </footer>
    <%@ include file="/WEB-INF/jsp/bo/include/script.jsp"%>
    <script>
        $(function() {
            var $frm = $("#frm");
            <%-- 폼체크 --%> 
            $frm.validate({
                rules : {
                    VDR_AGR_YN : {
                        required : true
                    }
                },
                messages : {
                    VDR_AGR_YN : {
                        required : "제휴사 약관에 동의하여 주시기바랍니다."
                    }
                }
            });
            <%-- 이전약관 보기  --%>
            $frm.on("click", ".prev-term", function() {
                var $this = $(this);
                $.postSyncJsonAjax($.action.ajax("Term"), {"AGR_MST_IDX" : $(this).data("agr_mst_idx")}, function(data) {
                    var info = data.info;
                    if (typeof(info) != "undefined") {
                        $frm.find(".div-term").empty();
                        $frm.find(".div-term").append(info.AGR_MST_CONTENTS);
                        if (info.AGR_MST_PRE_YN == "Y" && info.AGR_MST_PRV_IDX > 0) {
                            $this.data("agr_mst_idx", info.AGR_MST_PRV_IDX);
                            $this.attr({"data-agr_mst_idx" : info.AGR_MST_PRV_IDX});
                        } else {
                            $this.closest("p").remove();
                        }
                    }
                });
            });
            <%-- 인증확인  --%>
            goLogin = function() {
                if ($frm.valid()) {
                    $frm.postSubmit($.action.modify("Term"));
                }
            };
        });
    </script>
</body>
</html>