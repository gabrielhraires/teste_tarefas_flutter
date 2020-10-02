import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/screens/initial/initial_screen.dart';
import 'package:testepraticotasks/apresentation/screens/login/login_screen.dart';
import 'package:testepraticotasks/apresentation/screens/signup/signup_screen.dart';
import 'file:///D:/Desenvolvimento/Flutter/teste_pratico_tasks/lib/apresentation/screens/tasks/task_creation_screen.dart';
import 'package:testepraticotasks/apresentation/screens/tasks/tasks_screen.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const SIGNUP = '/signup';
  static const TASKS = '/tasks';
  static const TASK_CREATION = '/task-creation';
}

class AppRoutes {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => InitialScreen()),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    GetPage(name: Routes.SIGNUP, page: () => SignupScreen()),
    GetPage(name: Routes.TASKS, page: () => TasksScreen()),
    GetPage(name: Routes.TASK_CREATION, page: () => TaskCreationScreen()),
  ];
}