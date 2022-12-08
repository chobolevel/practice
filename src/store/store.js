import Vue from "vue";
import Vuex from "vuex";
import todo from "../modules/todo"
import movie from "../modules/movie"
import createPersistedState from "vuex-persistedstate"

Vue.use(Vuex);

export default new Vuex.Store({
  strict: true,
  modules: {
    todo,
    movie
  },
  plugins: [createPersistedState({
    paths: ["todo"]
  })]
});
