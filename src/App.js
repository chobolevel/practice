import styles from "./App.module.css";
import { useEffect, useState } from "react";

function App() {
  const [loading, setLoading] = useState(true);
  const [movies, setMovies] = useState([]);
  const getMovies = async() => {
    const json = await (await fetch("https://yts.mx/api/v2/list_movies.json?minimum_rating=8.8&sort_by=year")).json();
    //then없이 api호출하는 방법
    setMovies(json.data.movies);
    setLoading(false);
    //render2번
  };
  useEffect(() => {
    getMovies();
  }, []);
  return (
    <div>
      <h1>MOVIES</h1>
      {loading ? <h1>Loading</h1> : null}
      {movies.map((movie => 
      <div key = {movie.id}>
        <img src = {movie.medium_cover_image} />
        <h2>{movie.title}</h2>
        <p>{movie.summary}</p>
        <ul>
          {movie.genres.map((g) => <li key = {g}>{g}</li>)}
        </ul>
      </div>
      ))}
    </div>
  );
}

export default App;
