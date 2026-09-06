import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/features/todos/data/repositories/todo_repository.dart';
import 'package:tally_mobile/features/todos/presentation/logic/state/get_todos_state.dart';

@injectable
class GetTodosCubit extends Cubit<GetTodosState> {
  GetTodosCubit(this._repo) : super(const GetTodosState.initial());

  final TodoRepository _repo;

  Future<void> getAllTodos() async {
    emit(const GetTodosState.loading());
    final result = await _repo.getAllTodos();
    if (isClosed) return;
    result.fold(
      (failure) => emit(GetTodosState.error(failure)),
      (todos) => emit(GetTodosState.loaded(todos)),
    );
  }
}
