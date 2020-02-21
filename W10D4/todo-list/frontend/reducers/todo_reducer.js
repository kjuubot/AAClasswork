import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';


const todoReducer = (state = initialState, action) => {
  Object.freeze(state);
  let nextState = {};
  switch (action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach((todo) => {
        nextState[todo.id] = todo;
      });
      return nextState;
    case RECEIVE_TODO:
      nextState = Object.assign({}, state);
      nextState[action.todo.id] = action.todo;
      return nextState;
    default:
      return state;
  }
};

const initialState = {
  1: {
    id: 1,
    title: "prepare for js 1",
    body: "don't die",
    done: true
  },
  2: {
    id: 2,
    title: "prepare for react 1",
    body: "just try to survive",
    done: false
  }
};


export default todoReducer;

