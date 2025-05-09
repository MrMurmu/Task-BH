import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'todo_model.dart';

class TodoController extends GetxController {
  final _storage = GetStorage();
  final todos = <TodoModel>[].obs;

  final _storageKey = 'todo_list';

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  void loadTodos() {
    final storedTodos = _storage.read<List>(_storageKey);
    if (storedTodos != null) {
      todos.assignAll(
        storedTodos.map((e) => TodoModel.fromMap(Map<String, dynamic>.from(e))),
      );
    }
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
    saveTodos();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    saveTodos();
  }

  void updateTodo(int index, TodoModel updatedTodo) {
    todos[index] = updatedTodo;
    saveTodos();
  }
  
  void saveTodos() {
    final data = todos.map((e) => e.toMap()).toList();
    _storage.write(_storageKey, data);
  }

  void toggleTodoCheck(int index) {
    todos[index].isChecked = !todos[index].isChecked;

    final checked = todos.where((todo) => todo.isChecked).toList();
    _storage.write('checked_todos', checked.map((e) => e.toMap()).toList());
    todos.refresh();
  }

  // void saveCheckedTodos() {
  //   final checked = todos.where((todo) => todo.isChecked).toList();
  //   _storage.write('checked_todos', checked.map((e) => e.toMap()).toList());
  //   Get.snackbar("Saved", "${checked.length} tasks done.");
  // }
}
