<template>
  <section>
    <div class="loading_view" v-if="loadingState">
      Loading...
    </div>
    <div v-else class="movie_detail">
      <img :src="movie.medium_cover_image">
      <fieldset class="movie_detail_inner">
        <legend class="movie_title">{{ movie.title_long }}</legend>
        <p>Desc : {{ movie.description_intro}}</p>
        <p>Language : {{ movie.language }}</p>
        <p>Download Count : {{ movie.download_count}}</p>
        <p>Raiting : {{ movie.rating}}</p>
        <fieldset class="movie_detail_genres">
          <legend class="genres_title">Genres</legend>
          <ul>
            <li v-for="(genre, index) in movie.genres" :key="index">
              {{ genre }}
            </li>
          </ul>
        </fieldset>
      </fieldset>
    </div>
  </section>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
      name: "MovieDetail",
      computed: {
        ...mapGetters(["movie", "loadingState"])
      },
      created() {
          this.$store.dispatch("getMovieDetail", this.$route.params.id);
      }
    }
</script>

<style scoped>
  section {
    text-align: center;
  }
  .movie_detail {
    width: 100%;
    padding: 20px;
  }
  img {
    width: 30%;
    max-width: 800px;
    margin: 20px 0;
    border-radius: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  }
  p {
    font-family: arial;
    margin: 20px 10px;
  }
  .movie_detail_inner {
    width: 80%;
    margin: 0 auto;
    border-color: tomato;
    border-radius: 10px;
  }
  .movie_title {
    font-weight: bold;
    font-size: 26px;
    padding: 0 10px;
  }
  .genres_title {
    font-weight: bold;
    font-size: 20px;
    padding: 0 10px;
  }
  .movie_detail_genres {
    width: 50%;
    margin: 20px auto;
    border-radius: 10px;
  }
  .movie_detail_genres ul li {
    margin: 10px 0;
  }
</style>
