const todo = {
  state: {
    todos: []
  },
  mutations: {
    addTodo(state, todo) {
      state.todos.push(todo);
    },
    removeTodo(state, index) {
      state.todos.splice(index, 1);
    },
    removeAll(state) {
      state.todos = [];
    }
  },
  //mutations를 호출하는 부분
  actions: {
    addTodo({commit}, todo) {
      return commit("addTodo", todo);
    },
    removeTodo({commit}, index) {
      return commit("removeTodo", index);
    },
    removeAll({commit}) {
      return commit("removeAll");
    },
  },
  getters: {
    loadTodos: function (state) {
      return state.todos;
    }
  },
};

export default todo;
