import axios from "axios"

const movie = {
  state: {
    movie: "",
    movies: [],
    isLoading: true
  },
  mutations: {
    setMovie(state, movie) {
      state.movie = movie;
    },
    setMovies(state, movies) {
      state.movies = movies;
    },
    setLoading(state, bool) {
      state.isLoading = bool;
    }
  },
  actions: {
    getMovieDetail({commit}, id) {
      commit("setLoading", true);
      axios.get("https://yts.mx/api/v2/movie_details.json", { params: { movie_id: id } })
        .then((response) => {
          commit("setLoading", false);
          commit("setMovie", response.data.data.movie);
        });
    },
    getMovieList({commit}) {
      commit("setLoading", true);
      axios.get("https://yts.mx/api/v2/list_movies.json?minimum_rating=8.5&sort_by=year")
        .then((response) => {
            if("data" in response) {
              commit("setLoading", false);
              commit("setMovies", response.data.data.movies);
            }
        });
    }
  },
  getters: {
    movie: function(state) {
      return state.movie;
    },
    movies: function(state) {
      return state.movies;
    },
    loadingState: function(state) {
      return state.isLoading;
    }
  }
};

export default movie;
