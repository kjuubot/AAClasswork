import React from "react";
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

export const TodoList = (props) => {
  const todoList = props.todos.map((todo) => {
    return(
        <TodoListItem
          key={todo.id}
          todo={todo}
          removeTodo={props.removeTodo}/>
    );
  });
  
  return(
    <div>
        <h3>Here are our to-dos!</h3>
        <TodoForm addTodo={props.addTodo} />
        <ul>
          {todoList}
        </ul>
    </div>
  );
};

export default TodoList;