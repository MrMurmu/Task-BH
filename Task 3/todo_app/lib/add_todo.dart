import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/todo_controller.dart';
import 'package:todo_app/todo_model.dart';

class AddEditTodoScreen extends StatelessWidget {
  final int? index;
  final TodoModel? todo;

  AddEditTodoScreen({this.index, this.todo});

  final taskController = TextEditingController();
  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    if (todo != null) {
      taskController.text = todo!.task;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(index == null ? "Add Todo" : "Edit Todo", style: TextStyle(fontFamily: 'Times New Roman', fontWeight: FontWeight.w600, fontSize: 30, color: Colors.white),)),
        backgroundColor: Colors.blue.shade400,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: 400,
            padding: const EdgeInsets.all(25.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: Colors.blue.shade300
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(index == null ? "Add Todo" : "Edit Todo", style: TextStyle(fontFamily: 'Times New Roman',fontWeight: FontWeight.w900, fontSize: 30, color: Colors.blue.shade600),),
                SizedBox(height: 50),
                TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Task",
                    labelStyle: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: const Icon(Icons.title),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  ),
                ),
             
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    iconColor: Colors.blue,
                    side: BorderSide(color: Colors.blue),
                    elevation: 5,
                  ),
                  child: Text(
                    index == null ? "Add" : "Update",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    final newTodo = TodoModel(
                      task: taskController.text,
                    );
                    if (index == null) {
                      controller.addTodo(newTodo);
                    } else {
                      controller.updateTodo(index!, newTodo);
                    }
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
