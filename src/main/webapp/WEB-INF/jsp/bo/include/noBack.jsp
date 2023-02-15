<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var historyBackControl = function (callbackFuntion) {
    <%-- window 내 mouse 위치 여부를 체크하기 위한 변수 --%>
    window.innerDoc = false;
    <%-- mouseover Event Listener --%>
    window.addEventListener("mouseover", function(e) {
        window.innerDoc = true; 
    });
    <%-- mouseout Event Listener--%>
    window.addEventListener("mouseout", function(e) {
       window.innerDoc = false; 
    });
    <%-- 바로 이전 페이지로 이동하는 것을 막기위해 history state 추가 --%>
    history.pushState({page : "first"}, document.title, document.pathname);
    window.addEventListener("popstate", function(e) {
        <%-- history state 추가하여 페이지 이동 막음 (뒤로가기 막기) --%>
        history.pushState({page : "pageChange"}, document.title, document.pathname);
        <%-- 
            * window 영역 밖에서 history가 변경 됐을경우 callbackFunction 실행 (뒤로가기 버튼 등) 
            * 이전 POST 페이지에 정상적으로 데이터 재전송하여 SUBMIT 등 수행 
        --%>
        if (!window.innerDoc) {
            callbackFuntion();
        }
    });
};
/*
historyBackControl(function () {
    
});
*/
</script>