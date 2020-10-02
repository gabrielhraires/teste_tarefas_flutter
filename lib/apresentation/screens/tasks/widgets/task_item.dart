import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/screens/tasks/tasks_controller.dart';
import 'package:testepraticotasks/models/task.dart';
import 'package:testepraticotasks/routes/app_routes.dart';
import 'package:testepraticotasks/utils/utils.dart';

class TaskItem extends StatelessWidget {

  TasksController _controller = Get.find();

  final Task task;

  TaskItem({
    this.task
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Entrega: ${task.finishDate}'),
          task.conclusionDate.isNotEmpty
          ? Text('Conclusão: ${task.conclusionDate}')
          : Text('Não concluído')
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () => _openBottomSheet(context)
      ),
    );
  }

  _openBottomSheet(BuildContext context) {
    Utils.openBottomSheet(
      context: context,
      buttons: <Widget>[
        task.conclusionDate.isEmpty
            ? ListTile(
          leading: Icon(Icons.check, color: Get.theme.primaryColor),
          title: Text('Concluir'),
          onTap: _concludeTask,
        )
            : Container(),
        ListTile(
          leading: Icon(Icons.edit, color: Get.theme.primaryColor),
          title: Text('Editar'),
          onTap: _editTask,
        ),
        ListTile(
          leading: Icon(Icons.delete, color: Get.theme.primaryColor),
          title: Text('Excluir'),
          onTap: _deleteTask,
        )
      ],
    );
  }

  _concludeTask() {
    Get.back();
    Utils.confirmationDialog(
      title: 'Confirmação',
      message: 'Deseja concluir a tarefa?',
      confirmButton: () {
        _controller.concludeTask(task);
        Get.back();
      },
      declineButton: () => Get.back(),
    );
  }

  _editTask() async {
    Get.back();
    await _controller.openEditTask(task);
    Get.toNamed(Routes.TASK_CREATION);
  }

  _deleteTask() {
    Get.back();
    Utils.confirmationDialog(
      title: 'Confirmação',
      message: 'Deseja excluir a tarefa?',
      confirmButton: () {
        _controller.deleteTask(task);
        Get.back();
      },
      declineButton: () => Get.back(),
    );
  }
}
