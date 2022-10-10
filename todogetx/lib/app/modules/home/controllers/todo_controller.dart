// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';

import 'package:todogetx/app/modules/task.dart';

CollectionReference todoCollection =
    FirebaseFirestore.instance.collection('TodoList');

class TodoController extends GetxController {
  Future<void> addTask(BuildContext context, Task task) async {
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading..'),
      message: const Text('Please waiting '),
    );
    progressDialog.show();
    try {
      var doc = todoCollection.doc();
      task.uid = doc.id;
      await doc.set(task.toMap());
      progressDialog.dismiss();
      debugPrint('data added');
    } catch (e) {
      progressDialog.dismiss();
      Get.snackbar(
        "error",
        e.toString(),
        borderRadius: 15,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  static Stream<List<Task>> getAllTask() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future updateTask(Task task) async {
    try {
      print(' this is uid ${task.uid}');
      print(' this is title ${task.title}');
      await todoCollection.doc(task.uid).update(task.toMap());
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future deleteTask(Task task) async {
    todoCollection.doc(task.uid).delete();
  }
}
