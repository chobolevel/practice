const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
//ctx는 canvas에서 쓰일 브러쉬임

canvas.width = 800;
canvas.height = 800;
ctx.lineWidth = 2;

let isPainting = false;

function onMove(event) {
    if(isPainting === true) {
        ctx.lineTo(event.offsetX, event.offsetY);
        ctx.stroke();
        return;
    }
    else {
        ctx.moveTo(event.offsetX, event.offsetY);
    }
}

function startPainting() {
    isPainting = true;
}

function cancelPainting() {
    isPainting = false;
}

canvas.addEventListener("mousemove", onMove);
canvas.addEventListener("mousedown", startPainting);
canvas.addEventListener("mouseup", cancelPainting);
canvas.addEventListener("mouseleave", cancelPainting);