const clock = document.querySelector("#clock");

function getClock() {
    const date = new Date();
    const hours = String(date.getHours()).padStart(2, "0");
    const min = String(date.getMinutes()).padStart(2, "0");
    const sec = String(date.getSeconds()).padStart(2, "0");
    clock.innerText = `${hours}:${min}:${sec}`;
}
getClock();
//setInterval만 있으면 1초기다려야 하므로
//먼저 실행하고 1초뒤부터 계속 실행되게 만들어줌
setInterval(getClock, 1000);