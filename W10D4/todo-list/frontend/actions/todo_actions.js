export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const resetTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos
  };
};

export const addTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo
  };
};
