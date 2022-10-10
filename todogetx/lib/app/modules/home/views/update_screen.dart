import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/controllers/todo_controller.dart';
import 'package:todogetx/app/modules/task.dart';

class UpadateTaskScreen extends StatelessWidget {
  final Task task;
  UpadateTaskScreen({super.key, required this.task});
  TodoController todoController = Get.put<TodoController>(TodoController());
  var textEditingController = TextEditingController();
  void initState() {
    textEditingController.text = task.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Task Screen'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                filled: true,
                hintText: task.title,
                fillColor: Color(0xFFE4E7EB),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  DateTime time = DateTime.now();
                  task.title = textEditingController.text;
                  task.currentDate = time.day.toString();
                  await todoController.updateTask(task);
                  Get.back();
                },
                child: Text('update Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
