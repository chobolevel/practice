const loginInput = document.querySelector("#login-form input");
const loginForm = document.querySelector("#login-form");
const greeting = document.querySelector("#greeting");
const todoInput1 = document.querySelector("#todo-form input");

const HIDDEN_CLASSNAME = "hidden";

function onLoginSubmit(event) {
    event.preventDefault();
    const userName = loginInput.value;
    localStorage.setItem("username", userName);
    loginForm.classList.add(HIDDEN_CLASSNAME);
    greeting.innerText = `Hello ${userName}`;
    greeting.classList.remove(HIDDEN_CLASSNAME);
}



const savedUserName = localStorage.getItem("username");

if(savedUserName === null) {
    loginForm.classList.remove(HIDDEN_CLASSNAME);
    loginForm.addEventListener("submit", onLoginSubmit);
} else {
    greeting.innerText = `Hello ${savedUserName}`;
    greeting.classList.remove(HIDDEN_CLASSNAME);
    todoInput1.classList.remove("noneDisplay");
}