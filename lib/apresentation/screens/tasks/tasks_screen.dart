import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/screens/tasks/tasks_controller.dart';
import 'package:testepraticotasks/apresentation/screens/tasks/widgets/task_item.dart';
import 'package:testepraticotasks/routes/app_routes.dart';

class TasksScreen extends StatelessWidget {

  final TasksController _controller = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        actions: [
          _buildPopupButton()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.clearForm();
          Get.toNamed(Routes.TASK_CREATION);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 16),
        child: Obx(() => ListView.separated(
          separatorBuilder: (_, __) => Divider(),
          itemCount: _controller.tasksList.length,
          itemBuilder: (_, index) => Obx(() => TaskItem(
            task: _controller.tasksList.elementAt(index)
          )),
        )))
      );
  }

  Widget _buildPopupButton() {
    return PopupMenuButton(
      onSelected: (_) => _controller.signOut(),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: Text('Sair')
        )];
      }
    );
  }

}
