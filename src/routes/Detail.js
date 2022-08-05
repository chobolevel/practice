import { useEffect, useState } from "react";
import {useParams} from "react-router-dom";

function Detail() {
    const [movie, setMovie] = useState([]);
    const [loading, setLoading] = useState(true);
    const {id} = useParams();
    const getMovie = async() => {
        const json = await(await fetch(`https://yts.mx/api/v2/movie_details.json?movie_id=${id}`)).json();
        setMovie(json.data.movie);
        setLoading(false);
        console.log(json.data.movie);
    }
    useEffect(() => {
        getMovie();
    }, [])
    return (
        <div>
            <h1>Movie Detail</h1>
            {loading ? (<h1>Loading</h1>) : (
                <div>
                    <h2>{movie.title_long}</h2>
                    <img src = {movie.medium_cover_image} alt = ""/>
                    <p>Update date : {movie.date_uploaded}</p>
                    <p>Rating : {movie.rating}</p>
                    <p>Desc : {movie.description_full}</p>
                    <p>Category</p>
                    <ul>
                        {movie.genres.map((g) => (
                            <li style = {{display : "inline", margin : "10px"}}key = {g}>{g}</li>
                        ))}
                    </ul>
                </div>
            )}
        </div>
    );
}
export default Detail;