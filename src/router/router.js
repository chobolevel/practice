import Vue from "vue"
import VueRouter from "vue-router"
import Input from "../components/Input"
import List from "../components/List"
import Movie from "../components/Movie"
import MovieDetail from "../components/MovieDetail";

Vue.use(VueRouter);

export default new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/write",
      component: Input,
    },
    {
      path: "/list",
      component: List
    },
    {
      path: "/movie",
      component: Movie
    },
    {
      path: "/movie/:id",
      component: MovieDetail
    }
  ]
})
