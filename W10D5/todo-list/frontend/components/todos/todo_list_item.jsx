import React from 'react';

const TodoListItem = (props) => {
  return(
    <li>
      {props.todo.title}
      <br/>
      <button onClick={() => props.removeTodo(props.todo)}>Delete</button>
    </li>
  );
};

export default TodoListItem;