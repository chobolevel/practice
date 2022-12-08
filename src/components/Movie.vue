<template>
  <section>
    <div class="loading_view" v-if="loadingState">
      Loading...
    </div>
    <ul>
      <li v-if="movies.length !== 0" v-for="movie in movies">
        <img class="cover_image" :src="movie.medium_cover_image">
        <router-link :to="/movie/ + movie.id" v-bind:propsdata="movie">{{ movie.title }}</router-link>
      </li>
    </ul>
  </section>
</template>

<script>
  import {mapGetters} from "vuex";

  export default {
    computed: {
      ...mapGetters(["movies", "loadingState"])
    },
    created() {
      this.$store.dispatch("getMovieList");
    }
  }
</script>

<style scoped>
  ul {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
  }
  li {
    width: 100%;
    padding: 20px;
  }
  li img {
    width: 100%;
  }
  li span {
    font-size: 20px;
    font-weight: bold;
  }
  .loading_view {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    padding: 50px 0;
  }
</style>
