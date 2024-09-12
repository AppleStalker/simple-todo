import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title,String subtitle) {
    if (title.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
      description: subtitle
    );

    emit([...state, todo]);
  } 
}
