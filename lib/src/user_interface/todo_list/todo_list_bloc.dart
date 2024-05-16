import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/src/models/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>((event, emit) {
      final newTodo = Todo(desc: event.todoDescription);
      final newTodos = [...state.todos, newTodo];

      emit(state.copyWith(todos: newTodos));
    });

    on<EditTodoEvent>((event, emit) {
      final newTodo = state.todos.map((Todo todo) {
        if (todo.id == event.id) {
          return Todo(desc: event.todoDescription, id: event.id, completed: todo.completed);
        }
        return todo;
      }).toList();
      emit(state.copyWith(todos: newTodo));
    });

    on<ToggleTodoEvent>((event, emit) {
      final newTodos = state.todos.map((Todo todo) {
        if (todo.id == event.id) {
          return Todo(desc: todo.desc, id: event.id, completed: !todo.completed);
        }
        return todo;
      }).toList();

      emit(state.copyWith(todos: newTodos));
    });

    on<RemoveTodoEvent>((event, emit) {
      final newTodos = state.todos.where((Todo t) => t.id != event.todo.id).toList();

      emit(state.copyWith(todos: newTodos));
    });
  }
}
