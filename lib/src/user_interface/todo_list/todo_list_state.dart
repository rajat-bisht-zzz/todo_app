part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Woke Up', time: DateTime.now(), place: 'Flat/Home', reminder: 1),
      Todo(id: '2', desc: 'Breakfast', time: DateTime.now(), place: 'Flat/Home', reminder: 1),
      Todo(id: '3', desc: 'Office', time: DateTime.now(), place: '', reminder: 1),
    ]);
  }

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
