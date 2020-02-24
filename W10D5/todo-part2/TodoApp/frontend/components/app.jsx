import React from 'react';
import TodoListContainer from "./todos/todo_list_container";

const App = (props) => {
  return (
    <div id="app-div">
        <h1>App Component</h1>
        <TodoListContainer />
    </div>
  );
};

export default App;