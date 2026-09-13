import 'package:equatable/equatable.dart';
import 'package:tally_mobile/common/domain/failure.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';

sealed class CreateTodoState extends Equatable {
  const CreateTodoState();

  const factory CreateTodoState.initial() = CreateTodoInitial;
  const factory CreateTodoState.loading() = CreateTodoLoading;
  const factory CreateTodoState.created(Todo todo) = CreateTodoCreated;
  const factory CreateTodoState.error(Failure failure) = CreateTodoError;

  @override
  List<Object?> get props => [];
}

final class CreateTodoInitial extends CreateTodoState {
  const CreateTodoInitial();
}

final class CreateTodoLoading extends CreateTodoState {
  const CreateTodoLoading();
}

final class CreateTodoCreated extends CreateTodoState {
  const CreateTodoCreated(this.todo);

  final Todo todo;

  @override
  List<Object?> get props => [todo];
}

final class CreateTodoError extends CreateTodoState {
  const CreateTodoError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
