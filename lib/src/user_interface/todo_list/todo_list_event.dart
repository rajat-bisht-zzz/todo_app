part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String todoDescription;

  AddTodoEvent({required this.todoDescription});

  @override
  List<Object> get props => [todoDescription];
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDescription;

  const EditTodoEvent(this.id, this.todoDescription);

  @override
  List<Object> get props => [id, todoDescription];
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;

  const ToggleTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;

  const RemoveTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}
