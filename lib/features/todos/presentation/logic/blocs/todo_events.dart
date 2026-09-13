import 'package:equatable/equatable.dart';

//load todos, refresh todos, mark as complete, delete todo, create new todo
sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

final class LoadTodos extends TodoEvent {
  const LoadTodos();

  @override
  List<Object?> get props => [];
}

final class RefreshTodos extends TodoEvent {
  const RefreshTodos();

  @override
  List<Object?> get props => [];
}

final class DeleteTodo extends TodoEvent {
  const new(this.todoId);

  final String todoId;

  @override
  List<Object?> get props => [todoId];
}
