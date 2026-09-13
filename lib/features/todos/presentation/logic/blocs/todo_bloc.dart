import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/features/todos/data/repositories/todo_repository.dart';
import 'package:tally_mobile/features/todos/presentation/logic/blocs/todo_events.dart';
import 'package:tally_mobile/features/todos/presentation/logic/state/todo_state.dart';
import 'package:uuid/uuid.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._repo) : super(const TodoInitial()) {
    on<LoadTodos>(_loadTodos);
    on<RefreshTodos>(_refreshTodos);
    on<DeleteTodo>(_deleteTodo);
  }

  final TodoRepository _repo;

  Future<void> _loadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());

    final result = await _repo.getAllTodos();
    //if (isClosed) return;
    result.fold(
      (failure) => emit(TodoState.error(failure)),
      (todos) => emit(TodoState.loaded(todos)),
    );
  }

  Future<void> _refreshTodos(
    RefreshTodos event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());

    final result = await _repo.getAllTodos();
    //if (isClosed) return;
    result.fold(
      (failure) => emit(TodoState.error(failure)),
      (todos) => emit(TodoState.loaded(todos)),
    );
  }

  Future<void> _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    final currentState = state;
    if (currentState is! TodoLoaded) return;

    final previousTodos = currentState.todos;
    final updated = previousTodos
        .where((todo) => todo.id != event.todoId)
        .toList();
    emit(TodoLoaded(updated));

    final result = await _repo.deleteTodo(event.todoId);
    if (emit.isDone) return;

    result.fold(
      (failure) => emit(
        TodoLoaded(
          previousTodos,
          lastAction: TodoActionResult.failure(const Uuid().v4(), failure),
        ),
      ),
      (_) => emit(
        TodoLoaded(
          updated,
          lastAction: TodoActionResult.success(const Uuid().v4()),
        ),
      ),
    );
  }
}
