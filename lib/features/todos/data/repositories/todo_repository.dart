import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/common/data/services/database_service.dart';
import 'package:tally_mobile/common/domain/failure.dart';
import 'package:tally_mobile/common/utils/either.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';

abstract class TodoRepository {
  EitherFailureOr<void> createTodo(Todo todo);
  EitherFailureOr<List<Todo>> getAllTodos();
}

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._database);

  final DatabaseService _database;

  @override
  EitherFailureOr<void> createTodo(Todo todo) async {
    try {
      await _database.createTodo(todo);
      return Right(null);
    } catch (e, st) {
      return Left(
        Failure(title: 'Create todo failed', error: e, stackTrace: st),
      );
    }
  }

  @override
  EitherFailureOr<List<Todo>> getAllTodos() async {
    try {
      final todos = await _database.fetchAllTodos();
      return Right(todos);
    } catch (e, st) {
      return Left(
        Failure(title: 'Get all todos failed', error: e, stackTrace: st),
      );
    }
  }
}
