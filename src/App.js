import Button from "./Button";
import styles from "./App.module.css";
import { useEffect, useState } from "react";

function Hello() {
  return (
    <h1>Hello</h1>
  );
};

function App() {
  const [showing, setShowing] = useState(false);
  const onClick = () => {
    setShowing((current) => !current);
  }
  return (
    <div>
      {showing ? <Hello /> : null}
      <button onClick = {onClick}>{showing ? "HIDE" : "SHOW"}</button>
    </div>
  );
}

export default App;
