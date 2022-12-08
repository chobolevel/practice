<template>
  <nav>
    <router-link to="/write">Write</router-link>
    <router-link to="/list">List</router-link>
    <router-link to="/movie">Movie</router-link>
  </nav>
</template>

<script>
  export default {

  }
</script>

<style>
  nav {
    width: 100%;
    text-align: center;
    margin: 10px 0;
  }
  a {
    font-size: 16px;
    display: inline-block;
    padding: 10px;
    margin: 0 10px;
    font-weight: bold;
    color: #222;
  }
  a:hover {
    color: tomato;
    text-decoration: underline;
  }
</style>
