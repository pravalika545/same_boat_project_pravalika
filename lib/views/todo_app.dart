import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:same_boat_project/controllers/task_controller.dart';
import 'package:same_boat_project/views/addtask.dart';

class TodoAppList extends StatelessWidget {
  TodoAppList({super.key});

  final taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "TASK APP",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const AddTask());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Add Task",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
        backgroundColor: Colors.green[400],
        body: Obx(
          () => ListView.builder(
              itemCount: taskController.getTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(20),
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      taskController.getTasks[index].title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      taskController.getTasks[index].note,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        taskController.removeTodo(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
