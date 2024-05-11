part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Sleep'),
      Todo(id: '2', desc: 'Woke Up'),
      Todo(id: '3', desc: 'Brush'),
    ]);
  }
  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [todos];
}
