import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/checked_todos_screen.dart';
import 'package:todo_app/todo_controller.dart';

class TodoListScreen extends StatelessWidget {
  final controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List",
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.checklist, color: Colors.white),
              onPressed: () => Get.to(() => CheckedTodosScreen()),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  leading: Checkbox(
                    value: todo.isChecked,
                    activeColor: Colors.green,
                    onChanged: (_) => controller.toggleTodoCheck(index),
                  ),
                  title: Row(
                    children: [
                      Text(
                        'Task ${index + 1}: ',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          color: todo.isChecked ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${todo.task}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Times New Roman',
                            decoration: todo.isChecked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                                decorationThickness: 3.0,
                                // decorationColor: Colors.green
                          ),
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue.shade800),
                        onPressed: () => Get.to(() => AddEditTodoScreen(index: index, todo: todo)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.removeTodo(index),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () => Get.to(() => AddEditTodoScreen()),
      ),
    );
  }
}
