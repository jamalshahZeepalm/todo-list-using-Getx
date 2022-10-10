import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/controllers/todo_controller.dart';
import 'package:todogetx/app/modules/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  var textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task Screen'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: GetBuilder<TodoController>(
        init: TodoController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE4E7EB),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime time = DateTime.now();
                        Task task = Task(
                            title: textEditingController.text,
                            currentDate: time.day.toString(),
                            uid: '');
                        await controller.addTask(context, task);
                        Get.back();
                      },
                      child: Text('Add Task'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
