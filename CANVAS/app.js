const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
const lineWidth = document.querySelector("#line-width");
const color = document.querySelector("#color");
const colorOptions = Array.from(document.getElementsByClassName("color-option"));
const modeBtn = document.querySelector("#mode-btn");
const destroyBtn = document.querySelector("#destroy-btn");
const eraserBtn = document.querySelector("#eraser-btn");
const fileInput = document.querySelector("#file");

//canvas 기본값
const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 800;
canvas.width = CANVAS_WIDTH;
canvas.height = CANVAS_HEIGHT;
ctx.lineWidth = lineWidth.value;

//변수
let isPainting = false;
let isFilling = false;

function onMouseMove(e) {
    if(isPainting) {
        ctx.lineTo(e.offsetX, e.offsetY);
        ctx.stroke();
        return;
    }
    else {
        ctx.moveTo(e.offsetX, e.offsetY);
    }
}
function startPainting() {
    isPainting = true;
}
function endPainting() {
    isPainting = false;
    ctx.beginPath();
}
function onLineWidthChange(e) {
    ctx.lineWidth = e.target.value;
}
function onColorChange(e) {
    ctx.strokeStyle = e.target.value;
    ctx.fillStyle = e.target.value;
}
function onColorClick(e) {
    const colors = e.target.dataset.color;
    ctx.strokeStyle = colors;
    ctx.fillStyle = colors;
    color.value = colors;
}
function onModeBtnClick() {
    if(isFilling) {
        isFilling = false;
        modeBtn.innerText = "Fill";
    }
    else {
        isFilling = true;
        modeBtn.innerText = "Draw";
    }
}
function onCanvasClick() {
    if(isFilling) {
        ctx.fillRect(0, 0, 800, 800);
    }
}
function onDestoryClick() {
    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, 800, 800);
}
function onEraserClick() {
    ctx.strokeStyle = "white";
    isFilling = false;
    modeBtn.innerText = "Fill";
}
function onFileInputChange(e) {
    const file = e.target.files[0];
    const url = URL.createObjectURL(file);
    //file변수를 통해 받아 변수 url에 파일을 해당 브라우저만 접근 가능한 Url로 변환
    const image = new Image();
    image.src = url;
    image.onload = () => {
        ctx.drawImage(image, 0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
    }
}

canvas.addEventListener("mousemove", onMouseMove);
canvas.addEventListener("mousedown", startPainting);
canvas.addEventListener("mouseup", endPainting);
canvas.addEventListener("mouseleave", endPainting);
canvas.addEventListener("click", onCanvasClick);
lineWidth.addEventListener("change", onLineWidthChange);
color.addEventListener("change", onColorChange);
colorOptions.forEach(color => color.addEventListener("click", onColorClick));
modeBtn.addEventListener("click", onModeBtnClick);
destroyBtn.addEventListener("click", onDestoryClick);
eraserBtn.addEventListener("click", onEraserClick);
fileInput.addEventListener("change", onFileInputChange);