import 'package:equatable/equatable.dart';
import 'package:tally_mobile/common/domain/failure.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';

sealed class GetTodosState extends Equatable {
  const GetTodosState();

  const factory GetTodosState.initial() = GetTodosInitial;
  const factory GetTodosState.loading() = GetTodosLoading;
  const factory GetTodosState.loaded(List<Todo> todos) = GetTodosLoaded;
  const factory GetTodosState.error(Failure failure) = GetTodosError;

  @override
  List<Object?> get props => [];
}

final class GetTodosInitial extends GetTodosState {
  const GetTodosInitial();
}

final class GetTodosLoading extends GetTodosState {
  const GetTodosLoading();
}

final class GetTodosLoaded extends GetTodosState {
  const GetTodosLoaded(this.todos);

  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];
}

final class GetTodosError extends GetTodosState {
  const GetTodosError(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
