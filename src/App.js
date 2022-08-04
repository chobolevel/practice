import Button from "./Button";
import styles from "./App.module.css";
import { useEffect, useState } from "react";

function App() {
  const [toDo, setToDo] = useState("");
  const [toDos, setToDos] = useState([]);
  const onChange = (e) => {setToDo(e.target.value);}
  const onSubmit = (e) => {
    e.preventDefault();
    if(toDo === "") {
      return;
      //만약 값이 없는 채로 submit했을 때 저장을 방지함
    }
    setToDo("");
    setToDos(currentArray => [toDo, ...currentArray])
  }
  console.log(toDos);
  return (
    <div>
      <h1>My To Dos ({toDos.length})</h1>
      <form onSubmit={onSubmit}>
      <input 
      type = "text" 
      placeholder = "write your to do..."  
      value = {toDo}
      onChange = {onChange}
      />
      <button>Add To Do</button>
      </form>
      <hr />
      <ul>
       {toDos.map((item, index) => <li key = {index}>{item}</li>)}
      </ul>
    </div>
  );
};

export default App;
