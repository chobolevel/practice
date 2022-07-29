const todoForm = document.querySelector("#todo-form");
const todoInput = todoForm.querySelector("input");
const todoList = document.querySelector("#todo-list");
let toDos = [];

const TODOS_KEY = "todos";

function saveToDos() {
    localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
    //스트링 형으로 지정해주고 로컬 스토리지에 저장
}

function deleteToDo(e) {
    const li = e.target.parentElement;
    //이벤트 발생한 button을 통해 부모 요소 찾음
    li.remove(li);
    toDos = toDos.filter(toDo => toDo.id !== parseInt(li.id));
    //부모 요소를 제거한 ToDos를 filter를 통해 만들어줌
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

function handleToDoSubmit(e) {
    e.preventDefault();
    const newToDo = todoInput.value;
    todoInput.value = "";
    const newToDoObject = {
        id : Date.now(),
        text : newToDo,
    };
    toDos.push(newToDoObject);
    paintToDo(newToDoObject);
    saveToDos();
}

todoForm.addEventListener("submit", handleToDoSubmit);

const getSavedToDo = localStorage.getItem(TODOS_KEY);
if(getSavedToDo !== null) {
    const parsedToDos = JSON.parse(getSavedToDo);
    //일반 저장방식에서 배열 방식으로 바꿔줌
    toDos = parsedToDos;
    parsedToDos.forEach(paintToDo);
    //배열 각각요소들에 대해서 paintToDo함수 실행시켜줌
}