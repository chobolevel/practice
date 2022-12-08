<template>
  <section>
    <form class="inputForm" v-on:submit="addToDo">
      <div class="inputBox">
        <input type="text" v-model="todo" placeholder="Write your focus!"/>
        <button>
          <i class="fa fa-plus" aria-hidden="true"></i>
        </button>
      </div>
    </form>
  </section>
</template>

<script>
    import {mapActions, mapGetters} from "vuex";

    export default {
      data() {
        return {
          todo: ''
        }
      },
      methods: {
        ...mapActions(["addTodo"]),
        addToDo(e) {
          e.preventDefault();
          if(this.todo !== null && this.todo !== '') {
            this.addTodo(this.todo);
            this.clearInput();
          }
        },
        clearInput() {
          this.todo = '';
        },
      }
    }
</script>

<style scoped>
  .inputBox {
    width: 100%;
    height: 40px;
    display: flex;
    justify-content: space-between;
    margin: 20px 0px;
  }
  input {
    width: 96%;
    border: none;
    border-bottom: 1px solid #ccc;
    padding: 5px;
    font-size: 18px;
  }
  input:focus {
    outline: none;
  }
  button {
    width: 4%;
    border: 3px solid tomato;
    border-radius: 0px 10px 10px 0px;
    background-color: tomato;
    color: white;
    transition: all 0.5s;
    cursor: pointer;
  }
  button:hover {
    background-color: white;
    color: tomato;
  }
</style>
