<template>
  <section>
    <div class="listBox">
      <transition-group name="list" tag="ul">
        <li v-for="(todo, index) in loadTodos" :key="index" v-on:dblclick="handleClick">
          <span class="todo_text">{{ todo }}</span>
          <i class="removeBtn fa fa-times" aria-hidden="true" v-on:click="removeHandle(index)"></i>
        </li>
      </transition-group>
      <span class="removeAll" v-on:click="removeAllHandle">Remove All</span>
    </div>
  </section>
</template>

<script>
  import {mapActions, mapGetters} from "vuex";

  export default {
    methods: {
      ...mapActions(["removeTodo", "removeAll"]),
      handleClick(e) {
        e.currentTarget.classList.toggle("clear");
      },
      removeHandle(index) {
        this.removeTodo(index);
      },
      removeAllHandle() {
        this.removeAll();
      }
    },
    computed: {
      ...mapGetters(["loadTodos"])
    }
  }
</script>

<style scoped>

  ul {
    position: relative;
  }
  ul li {
    width: 100%;
    margin: 20px 0px;
    padding: 10px;
    border-radius: 10000px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.4);
    font-size: 18px;
    font-family: arial;
    font-weight: bold;
    transition: all 0.4s;
  }
  ul li.clear {
    background-color: rgba(2, 2, 2, 0.4);
  }
  ul li.clear > span {
    filter: blur(3px);
  }
  ul li::before {
    content: "Clear";
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
    color: green;
    opacity: 0;
    line-height: 25px;
  }
  ul li.clear::before {
    opacity: 1;
  }
  .todo_text {
    margin-left: 10px;
  }
  i.removeBtn {
    float: right;
    margin-right: 10px;
    line-height: 20px;
    cursor: pointer;
    color: red;
    transition: all 0.3s;
  }
  i.removeBtn:hover {
    transform: scale(1.2);
  }
  .removeAll {
    display: inline-block;
    position: relative;
    border-radius: 10000px;
    padding: 10px 20px;
    margin-top: 30px;
    left: 50%;
    transform: translateX(-50%);
    background-color: tomato;
    color: white;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.4);
    transition: all 0.4s;
  }
  .removeAll:hover {
    background-color: white;
    color: tomato;
  }
  .list-enter-active, .list-leave-active {
    transition: all 1s;
  }
  .list-enter, .list-leave-to {
    opacity: 0;
    filter: blur(50px);
    transform: translateX(30px);
  }
</style>
