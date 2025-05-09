import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/todo_model.dart';

class CheckedTodosScreen extends StatelessWidget {
  final _storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final storedChecked = _storage.read<List>('checked_todos');
    final checkedTodos = storedChecked != null
        ? storedChecked
            .map((e) => TodoModel.fromMap(Map<String, dynamic>.from(e)))
            .toList()
        : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Checked Todos",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.blue.shade400,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade50,
      body: checkedTodos.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 60, color: Colors.grey.shade500),
                  const SizedBox(height: 12),
                  const Text(
                    'You have not submitted any tasks yet!',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Times New Roman',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: checkedTodos.length,
                itemBuilder: (context, index) {
                  final todo = checkedTodos[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      leading: Icon(Icons.check_circle,
                          color: Colors.green.shade600),
                      title: Row(
                        children: [
                          Text(
                            'Task : ',
                            style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${todo.task}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Times New Roman',
                                color: Colors.black87,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
