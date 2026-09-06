import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:tally_mobile/common/utils/sembast_constants.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';

abstract interface class DatabaseService {
  Future<void> initDatabases();
  Future<void> createTodo(Todo todo);
}

@LazySingleton(as: DatabaseService)
class DatabaseServiceImpl implements DatabaseService {
  final _storeRef = intMapStoreFactory.store(SembastConstants.todosStore);
  late final Database _database;

  @override
  Future<void> initDatabases() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, SembastConstants.dbName);
    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Future<void> createTodo(Todo todo) async {
    
  }
}
