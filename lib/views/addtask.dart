import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class AddTask extends StatefulWidget {
 const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final TaskController taskController = Get.find();
  bool showsavebutton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (showsavebutton)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  taskController.addTodo(
                    titleController.text,
                    noteController.text,
                  );
                  Get.back();
                  titleController.clear();
                  noteController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 10,
                    bottom: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
        ],
      ),
      backgroundColor: Colors.green[400],
      body: Column(
        children: [
          TextField(
            controller: titleController,
            onChanged: (value) {
              setState(() {
                showsavebutton = value.trim().split("").isNotEmpty;
              });
            },
            maxLength: 20,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                counterText: '',
                contentPadding: EdgeInsets.all(20),
                hintText: "Title",
                hintStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
          ),
          TextField(
            controller: noteController,
            onChanged: (value) {
              setState(() {
                showsavebutton = value.trim().split("").isNotEmpty;
              });
            },
            maxLines: null,
            style:const TextStyle(fontSize: 20, color: Colors.white),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(20),
                hintText: "Write your task....",
                hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
