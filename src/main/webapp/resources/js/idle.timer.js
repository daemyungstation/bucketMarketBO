class IdleTimer {
    constructor({ timeout, warningSec }) {
        localStorage.removeItem("_expiredTime");
        this.timeout = timeout;
        this.warningSec = warningSec;
        this.countdownTimer = 0;
        //console.log( "constructor : %s, %s", timeout, warningSec);
        const expiredTime = parseInt(localStorage.getItem("_expiredTime") || 0, 10);
        //console.log("expiredTime : %s", expiredTime);
        if (expiredTime > 0 && expiredTime < Date.now()) {
            this.onExpired();
            return;
        }
        this.eventHandler = this.updateExpiredTime.bind(this);
        this.tracker();
        this.startInterval();
    }
    stopInterval() {
        clearInterval(this.interval);
    }

    startInterval() {
        this.updateExpiredTime();
        this.interval = setInterval(() => {
            const expiredTime = parseInt(localStorage.getItem("_expiredTime") || 0,10);
            //console.log("startInterval %s %s",  expiredTime , (Date.now() - expiredTime) / 1000 );
            if (expiredTime > 0 && expiredTime  < Date.now()) {
                if (this.onTimeout) {
                    this.onTimeout(this );
                    this.startCountDown(new Date(expiredTime + this.warningSec * 1000), ".idle-left-time")
                    this.stopInterval();
                }
            }
        }, 1000);
    }

    updateExpiredTime() {
        if (this.timeoutTracker) {
            clearTimeout(this.timeoutTracker);
        }
        this.timeoutTracker = setTimeout(() => {
            //console.log("setExpiredTime : %s", Date.now() + this.timeout * 1000 - this.warningSec * 1000);
            localStorage.setItem("_expiredTime", Date.now() + this.timeout * 1000 - this.warningSec * 1000);
        }, 300);
    }

    tracker() {
        window.addEventListener("mousemove", this.eventHandler);
        window.addEventListener("scroll", this.eventHandler);
        window.addEventListener("keydown", this.eventHandler);
    }

    cleanUp() {
        localStorage.removeItem("_expiredTime");
        clearInterval(this.interval);
        window.removeEventListener("mousemove", this.eventHandler);
        window.removeEventListener("scroll", this.eventHandler);
        window.removeEventListener("keydown", this.eventHandler);
    }
    countdown(selectorDay, selectorHMS, onExpired) {
        //D-Day 설정
        let dDay = new Date(selectorDay);
        let ts = dDay.getTime() - new Date().getTime();
        let tzSec = parseInt(ts/ 1000);
        if( tzSec < 0 ) {
            onExpired();
        }
        //let hText = ((parseInt(tzSec / 3600) % 24) < 10 ? '0' : '') + ((parseInt(tzSec / 3600) % 24) > 0 ? (parseInt(tzSec / 3600) % 24).toString() : '0');
        let mText = ((parseInt(tzSec / 60) % 60) < 10 ? '0' : '') + ((parseInt(tzSec / 60) % 60) > 0 ? (parseInt(tzSec / 60) % 60).toString() : '0');
        let sText = (parseInt(tzSec % 60) < 10 ? '0' : '') + (parseInt(tzSec % 60) > 0 ? parseInt(tzSec % 60).toString() : '0');
        let countdownHMSText =  mText + '분 ' + sText + '초 ';
        $(selectorHMS).text(countdownHMSText);
    }
    startCountDown(selectorDay, selectorHMS) {
        if (this.countdownTimer != 0) {
            clearInterval(this.countdownTimer);
        }
        this.countdownTimer = setInterval(this.countdown, 1000, selectorDay, selectorHMS, this.onExpired);
    }
    onTimeout(idleTimer) {
        alertify.set({ labels: {ok     : "로그아웃하기", cancel: "로그인 시간 연장하기"} });
        alertify.confirm("<div style='height: 150px'><div class='idle-title' >자동로그아웃 안내</div><div class='idle-border'></div><div class='idle-left-label'>로그아웃까지 남은시간</div><div class='idle-left-time'>--분 --초</div><div class='idle-descrition'>장시간 활동이 없어 자동으로 로그아웃됩니다. 계속 이용하시려면 로그인 시간을 연장해 주세요</div></div>",
            function(e){
                if(e) {
                    //console.log("로그아웃")
                    alertify.error('로그아웃합니다');
                    location.href = "/bo/manager/logout.do";
                } else {
                    //console.log("로그인연장")
                    alertify.success('로그인 시간이 연장되었습니다. ')
                    $.postSyncJsonAjax($.action.common.ajax("Ping"), {}, function() {
                        clearInterval(idleTimer.countdownTimer);
                        idleTimer.startInterval();
                    });
                }
            })
    }
    onExpired() {
        location.href = "/bo/manager/logout.do"  ;
    }
    //startCountDown('.countdown_day', '.countdown_hms');
}
$(document).ready(function(e){
    idleTimer = new IdleTimer({"timeout": 1800, "warningSec": 180})
});


