const btn = document.querySelector("#more");
const info = document.querySelector(".info");
const left = document.querySelector(".left");
const right = document.querySelector(".right");

btn.addEventListener("click", () => {
    info.classList.toggle("show");
});
left.addEventListener("click", () => {
    left.classList.add("trans");
})
right.addEventListener("click", () => {
    right.classList.add("trans");
})
