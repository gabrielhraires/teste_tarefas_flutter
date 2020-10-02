import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testepraticotasks/apresentation/base_controller.dart';
import 'package:testepraticotasks/apresentation/screens/login/login_controller.dart';
import 'package:testepraticotasks/db/database.dart';
import 'package:testepraticotasks/db/db_provider.dart';
import 'package:testepraticotasks/models/task.dart';
import 'package:testepraticotasks/utils/utils.dart';

class TasksController extends BaseController {

  LoginController _loginController = Get.find();

  AppDatabase db;

  TextEditingController nameController = TextEditingController();
  TextEditingController finishDateController = TextEditingController();
  TextEditingController conclusionDateController = TextEditingController();

  Task editingTask;

  RxList<Task> tasksList = <Task>[].obs;

  final formKey = GlobalKey<FormState>();

  TasksController(){
    getAllTasks();
  }

  getAllTasks() async {
    db = await DBProvider.db.appDatabase;
    tasksList.bindStream(db.taskRepositoryDao.getAllByUser(_loginController.loggedUser.id));
  }

  create() async {
    if(formKey.currentState.validate()) {
      isLoading = true;
      db = await DBProvider.db.appDatabase;

      Task task = Task(
        name: nameController.text,
        finishDate: finishDateController.text,
        conclusionDate: conclusionDateController.text,
        userId: _loginController.loggedUser.id
      );


      try {
        int id = await db.taskRepositoryDao.insertItem(task);
        task.id = id;
        tasksList.add(task);

        Get.back();

        Utils.openSnackBar(
          message: 'Tarefa cadastrada com sucesso',
          type: SnackType.SUCCESS
        );
      } catch (e) {
        print('Erro $e');
      }
      isLoading = false;

    }
  }

  editTask() async {
    if(formKey.currentState.validate()) {
      isLoading = true;
      db = await DBProvider.db.appDatabase;

      editingTask.name = nameController.text;
      editingTask.finishDate = finishDateController.text;
      editingTask.conclusionDate = conclusionDateController.text;

      try {
        await db.taskRepositoryDao.updateItem(editingTask);

        _editListItem(editingTask);

        clearForm();
        Get.back();

        Utils.openSnackBar(
          message: 'Tarefa editada com sucesso',
          type: SnackType.SUCCESS
        );
      } catch(e) {
        print(e);
      }
      isLoading = false;
    }
  }

  concludeTask(Task task) async {
    db = await DBProvider.db.appDatabase;

    try {
      task.conclusionDate = DateFormat('dd/MM/yyyy', 'pt-br').format(DateTime.now());
      await db.taskRepositoryDao.updateItem(task);

      _editListItem(task);

      Utils.openSnackBar(
        message: 'Tarefa concluída',
        type: SnackType.SUCCESS
      );
    } catch (e) {
      print(e);
    }
  }

  deleteTask(Task task) async {
    db = await DBProvider.db.appDatabase;

    try {
      await db.taskRepositoryDao.deleteItem(task);

      tasksList.remove(task);
      Utils.openSnackBar(
          message: 'Tarefa excluída com sucesso',
          type: SnackType.SUCCESS
      );
    } catch (e) {
      print(e);
    }
  }

  void _editListItem(Task task) {
    int index = tasksList.indexOf(task);
    tasksList[index] = task;
  }

  openEditTask(Task task) async {
    editingTask = task;

    nameController.text = editingTask.name;
    finishDateController.text = editingTask.finishDate;
    conclusionDateController.text = editingTask.conclusionDate;
  }

  void clearForm() {
    editingTask = null;

    nameController.clear();
    finishDateController.clear();
    conclusionDateController.clear();
  }

  void signOut() => _loginController.signOut();
}