import 'package:equatable/equatable.dart';
import 'package:tally_mobile/common/domain/failure.dart';

sealed class CreateTodoState<State> extends Equatable {
  const CreateTodoState();

  const factory CreateTodoState.initial() = CreateTodoInitial;
  const factory CreateTodoState.loading() = CreateTodoLoading;
  const factory CreateTodoState.todoCreated(State todo) = CreateTodoCreated;
  const factory CreateTodoState.error(Failure failure) = CreateTodoError;

  @override
  List<Object?> get props => [];
}

final class CreateTodoInitial<State> extends CreateTodoState<State> {
  const CreateTodoInitial();
}

final class CreateTodoLoading<State> extends CreateTodoState<State> {
  const CreateTodoLoading();
}

final class CreateTodoCreated<State> extends CreateTodoState<State> {
  const CreateTodoCreated(this.todo);

  final State todo;

  @override
  List<Object?> get props => [todo];
}

final class CreateTodoError<State> extends CreateTodoState<State> {
  const CreateTodoError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
