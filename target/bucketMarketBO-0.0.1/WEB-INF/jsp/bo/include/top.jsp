<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div id="top" class="container" style="background: #414547 url('/resources/img/bg_head.png') no-repeat center top;"><!-- top -->
        <div class="wrap">
            <div class="menu"><!-- menu -->
                <div id="togglerAside" class="toggler left">
                    <a href="#!" class="js-toggle-nav" data-class="is-aside-in" data-lg-class="is-aside-out">
                        <i class="fonti um-fog on"><em>메뉴 펼치기</em></i>
                        <i class="fonti um-fog off"><em>메뉴 접기</em></i>
                    </a>
                </div>
            </div><!-- // menu -->
            <h1 class="logo">
                <a href="<spring:eval expression="@resource['server.ssl.domain']"/>">
                    <img src="<spring:eval expression="@resource['img.ssl.domain']"/>/resources/img/bucketmarket_logo.png" alt="버킷마켓 꿈꾸던 삶을 담다 대명아임레디 다이렉트 가입몰 관리자" />
                </a>
            </h1>
            <div class="util"><!-- util -->
                <div class="col">
                    <a href="<spring:eval expression="@resource['server.ssl.domain']"/>/bo/manager/logout.do"><i class="fonti um-sign-out"><em>로그아웃</em></i></a>
                </div>
                <div class="col">
                    <div id="togglerQuick" class="toggler left">
                        <a href="#!" class="js-toggle-nav" data-class="is-quick-in" data-lg-class="is-quick-out">
                            <i class="fonti um-ellipsis-h on"><em>사용자 메뉴 펼치기</em></i>
                            <i class="fonti um-ellipsis-v off"><em>사용자 메뉴 접기</em></i>
                        </a>
                    </div>
                </div>
            </div><!-- // util -->
        </div>
    </div><!-- // top -->
    <div id="gnb" class="container">
        <div class="wrap core"></div><!-- // gnb -->
        <div class="spacer"></div>
    </div>