const todoForm = document.querySelector("#todo-form");
const todoInput = todoForm.querySelector("input");
const todoList = document.querySelector("#todo-list");
let toDos = [];

const TODOS_KEY = "todos";

function saveToDos() {
    localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
}

function deleteToDo(event) {
    const li = event.target.parentElement;
    li.remove(li);
    toDos = toDos.filter(toDo => toDo.id !== parseInt(li.id));
    saveToDos();
}

function paintToDo(newToDo) {
    const li = document.createElement("li");
    li.id = newToDo.id;
    const span = document.createElement("span");
    span.innerText = newToDo.text;
    const button = document.createElement("button");
    button.innerText = "❌";
    button.addEventListener("click", deleteToDo);
    li.appendChild(span);
    li.appendChild(button);
    todoList.appendChild(li);
}

function handleToDoSubmit(event) {
    event.preventDefault();
    const newToDo = todoInput.value;
    todoInput.value = "";
    const newToDoObject = {
        text : newToDo,
        id : Date.now(),
    }
    toDos.push(newToDoObject);
    paintToDo(newToDoObject);
    saveToDos();
}

todoForm.addEventListener("submit", handleToDoSubmit);

const getSavedToDo = localStorage.getItem(TODOS_KEY);
if(getSavedToDo !== null) {
    const parsedToDos = JSON.parse(getSavedToDo);
    toDos = parsedToDos;
    parsedToDos.forEach(paintToDo);
}