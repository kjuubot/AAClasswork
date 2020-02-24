import { connect } from 'react-redux';
import { TodoList } from "./todo_list";
import {allTodos} from "../../reducers/selectors";
import { addTodo, removeTodo } from "../../actions/todo_actions";

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  addTodo: todo => dispatch(addTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo))
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);