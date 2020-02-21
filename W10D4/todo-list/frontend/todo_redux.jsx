import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { resetTodos, addTodo } from './actions/todo_actions';
import App from './components/app';
import Root from './components/root';
import { allTodos } from './reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  const store = configureStore();
  window.store = store;
  window.resetTodos = resetTodos;
  window.addTodo = addTodo;
  window.allTodos = allTodos;

  ReactDOM.render(<Root store={store} />, root);

});