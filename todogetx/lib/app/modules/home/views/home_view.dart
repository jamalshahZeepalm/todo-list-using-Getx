// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/controllers/auth_controller.dart';
import 'package:todogetx/app/modules/home/controllers/todo_controller.dart';
import 'package:todogetx/app/modules/home/views/add_task_screen.dart';
import 'package:todogetx/app/modules/home/views/update_screen.dart';
import 'package:todogetx/app/modules/task.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  TodoController todoController = Get.put<TodoController>(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              AuthController.authController.signOut();
            },
            child: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Task>>(
        stream: TodoController.getAllTask(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Task>? taskList = snapshot.data;
          if (taskList!.isEmpty) {
            return const Center(
              child: Text("No Data found"),
            );
          }
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              Task task = taskList[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(task.title),
                            Text('current Date ${task.currentDate}')
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => UpadateTaskScreen(
                                    task: task,
                                  ));
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.blueAccent,
                              size: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Are you sure want to delete..?',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                todoController.deleteTask(task);
                                                Get.back();
                                              },
                                              child: Text('Yes')),
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text('No'))
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTaskScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
