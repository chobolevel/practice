const loginForm = document.querySelector("#login-form");
const loginInput = loginForm.querySelector("input");
const greeting = document.querySelector("#greeting");
const userName = localStorage.getItem("username");

const HIDDEN_CLASSNAME = "hidden";

function onLoginSubmit(e) {
    e.preventDefault();
    const inputValue = loginInput.value;
    loginInput.value = "";
    localStorage.setItem("username", inputValue);
    greeting.innerText = `Hello ${inputValue}`;
    greeting.classList.remove(HIDDEN_CLASSNAME);
    loginForm.classList.add(HIDDEN_CLASSNAME);
};

if(userName === null) {
    loginForm.classList.remove(HIDDEN_CLASSNAME);
    loginForm.addEventListener("submit", onLoginSubmit);
} else {
    greeting.innerText = `Hello ${userName}`;
    greeting.classList.remove(HIDDEN_CLASSNAME);
}