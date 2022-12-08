<template>
  <footer>
    &copy; {{ date }} ToDo List
  </footer>
</template>

<script>
    export default {
        data() {
          return {
            date: new Date().getFullYear()
          }
        }
    }
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css?family=Gugi:400');
  footer {
    width: 100%;
    margin-top: 50px;
    padding: 40px 20px;
    text-align: center;
    font-size: 20px;
    font-family: Gugi;
    color: tomato;
  }
</style>
