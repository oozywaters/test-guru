document.addEventListener('turbolinks:load', function() {
    function toHHMMSS(secs) {
        var sec_num = parseInt(secs, 10);
        var hours   = Math.floor(sec_num / 3600) % 24;
        var minutes = Math.floor(sec_num / 60) % 60;
        var seconds = sec_num % 60;
        return [hours,minutes,seconds]
            .map(function(v) {
                return v < 10 ? '0' + v : v;
            })
            .filter(function(v, i) {
                return v !== '00' || i > 0;
            })
            .join(':')
    }

    function startTimer(timerEl, seconds, timeoutCb) {
        if (seconds <= 0) {
            timeoutCb();
        }
        timerEl.innerHTML = toHHMMSS(seconds);
        setTimeout(function() {
            startTimer(timerEl, seconds - 1, timeoutCb);
        }, 1000);
    }

    var timer = document.getElementById('timer');
    if (timer) {
        var secondsLeft = timer.dataset.timeleft;
        startTimer(timer, secondsLeft, function() {
            alert('Время вышло');
            document.querySelector('form').submit();
        });
    }
});
