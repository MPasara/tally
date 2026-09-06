import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';
import 'package:tally_mobile/features/todos/presentation/logic/state/create_todo_state.dart';

class CreateTodoCubit extends Cubit<CreateTodoState> {
  CreateTodoCubit() : super(CreateTodoInitial());

  Future<void> createTodo(Todo todo) async {
    
  }
}
