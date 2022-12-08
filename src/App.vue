<template>
  <div id="app">
    <Header></Header>
    <Nav></Nav>
    <transition name="page">
      <router-view></router-view>
    </transition>
    <Footer></Footer>
  </div>
</template>

<script>
  import Header from "./components/Header";
  import Footer from "./components/Footer";
  import Nav from "./components/Nav";

  export default {
    components: {
      "Header": Header,
      "Nav": Nav,
      "Footer": Footer
    }
  }
</script>

<style>
  * {
    padding: 0;
    margin: 0;
    font-family: -apple-system;
    box-sizing: border-box;
  }
  ul li {
    list-style-type: none;
  }
  a {
    text-decoration: none;
  }
  body {
    background-color: #eee;
  }
  #app {
    width: 100%;
    max-width: 1200px;
    min-width: 768px;
    margin: 100px auto;
    padding: 30px;
    border-radius: 20px;
    background-color: white;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
  }
  .page-enter-active, .page-leave-active {
    transition: opacity .3s;
  }
  .page-enter, .page-leave-to {
    opacity: 0;
  }
</style>
