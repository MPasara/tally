import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/features/todos/data/repositories/todo_repository.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';
import 'package:tally_mobile/features/todos/presentation/logic/state/create_todo_state.dart';

@injectable
class CreateTodoCubit extends Cubit<CreateTodoState> {
  CreateTodoCubit(this._repo) : super(CreateTodoInitial());

  final TodoRepository _repo;

  Future<void> createTodo(Todo todo) async {
    emit(const CreateTodoState.loading());
    final result = await _repo.createTodo(todo);
    result.fold(
      (failure) => emit(CreateTodoState.error(failure)),
      (_) => emit(CreateTodoState.created(todo)),
    );
  }
}
