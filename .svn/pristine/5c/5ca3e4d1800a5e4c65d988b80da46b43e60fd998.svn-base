<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta property="og:title" content="BucketMarket">
<meta property="og:url" content="">
<meta property="og:image" content="">
<meta property="og:description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-language" content="kr" />
<meta http-equiv="imagetoolbar" content="no" />
<meta http-equiv="Cache-control" content="no-cache">
<meta name="facebook-domain-verification" content="8bc5vlhjr7zdrzgjp0ykldrb7n03mw" />
<meta name="_csrf_name" content="<c:out value="${_csrf.parameterName}"/>" class="csrf-name">
<meta name="_csrf_token" content="<c:out value="${_csrf.token}"/>" class="csrf-token">
<meta name="_csrf_header" content="<c:out value="${_csrf.headerName}"/>" class="csrf-header"/>
<title><spring:eval expression="@resource['project.title']"/></title>
<c:choose>
    <c:when test="${isLoginPage }">
        <link rel="stylesheet" type="text/css" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/pc-admin/dm-css/admin.css">
        <script type="text/javascript" src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/pc-admin/dm-js/lib.js"></script>
        <script type="text/javascript" src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/pc-admin/dm-js/style.js"></script>
        <link rel="shortcut icon" href="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc-admin/dm-img/favicon.ico" type="image/x-icon" />
    </c:when>
    <c:otherwise>
        <meta name="title" content="DAEMYUNGSTATION" />
        <meta name="description" content="DAEMYUNGSTATION" />
        <meta name="copyright" content="DAEMYUNGSTATION" />
        <link rel="author" href="http://upleat.com"/>
        <link rel="publisher" href="http://upleat.com" />
        <link rel="apple-touch-icon" href="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/img/apple-touch-icon.png" />
        <link rel="stylesheet" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/css/normalize-3.0.2.css" />
        <link rel="stylesheet" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/css/fontium.css" /><!-- fontium css -->
        <!--
        <link rel="stylesheet" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/css/upleat.base-0.1.css" />
        -->
        <link rel="stylesheet" href="<spring:eval expression="@resource['css.ssl.domain']"/>/resources/css/style.css" /><!-- less compiled css -->
        <script>document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/,'js');</script>
        <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/modernizr.custom.2.8.3.min.js"></script>
        <!--[if (gte IE 6)&(lte IE 8)]>
            <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery-1.11.2.min.js"></script>
        <![endif]-->
        <!--[if (gt IE 8)|!(IE)]> <!--> <script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/vendor/jquery-2.1.3.min.js"></script> <!--<![endif]-->
        <script>window.jQuery || document.write('<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"><\/script>')</script>
    </c:otherwise>
</c:choose>
<link rel="shortcut icon" href="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/pc-admin/dm-img/favicon.ico" type="image/x-icon" />
<script src="<spring:eval expression="@resource['js.ssl.domain']"/>/resources/js/plugins/jquery.cookie.js"></script>
<script>
$.resources = {
    domain : {
        server : "<spring:eval expression="@resource['server.ssl.domain']"/>",
        cdn : "<spring:eval expression="@resource['cdn.ssl.domain']"/>",
        img : "<spring:eval expression="@resource['cdn.ssl.domain']"/>"
    },
    page : {
        main : {
            administrator : "<spring:eval expression="@resource['administrator.main.page']"/>",
            guest : "<spring:eval expression="@resource['guest.main.page']"/>"
        }
    },
    cookie : {
        name : {
            login : "<c:out value="${CookieName.LOGIN_PATH_COOKIE_NAME}"/>"
        }
    },
    isLogin : <c:out value="${empty isLogin ? false : isLogin }"/>,
    isScm : <c:out value="${empty isScm ? false : isScm }"/>
};
</script>