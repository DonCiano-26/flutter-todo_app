
import 'package:get/get.dart';
import '../models/todo.dart';


class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String task) {
    if (task.isNotEmpty) {
      todos.add(Todo(task: task));
    }
  }

  void toggleComplete(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    todos.refresh();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}