import 'package:equatable/equatable.dart';
import 'package:tally_mobile/common/domain/failure.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  const factory TodoState.initial() = TodoInitial;
  const factory TodoState.loading() = TodoLoading;
  const factory TodoState.loaded(List<Todo> todos) = TodoLoaded;
  const factory TodoState.error(Failure failure) = TodoError;

  @override
  List<Object?> get props => [];
}

final class TodoInitial extends TodoState {
  const TodoInitial();
}

final class TodoLoading extends TodoState {
  const TodoLoading();
}

final class TodoLoaded extends TodoState {
  const TodoLoaded(this.todos, {this.lastAction});

  final List<Todo> todos;
  final TodoActionResult? lastAction;

  @override
  List<Object?> get props => [todos, lastAction];
}

final class TodoError extends TodoState {
  const TodoError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class TodoActionResult extends Equatable {
  const TodoActionResult.success(this.id) : failure = null;
  const TodoActionResult.failure(this.id, Failure this.failure);

  final Object
  id; // unique per emission so BlocListener can detect "new" vs "same"
  final Failure? failure;

  bool get isSuccess => failure == null;

  @override
  List<Object?> get props => [id, failure];
}
