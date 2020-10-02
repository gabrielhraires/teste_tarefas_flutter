import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:testepraticotasks/models/task.dart';
import 'package:testepraticotasks/models/user.dart';
import 'package:testepraticotasks/repositories/task_repository_dao.dart';
import 'package:testepraticotasks/repositories/user_repository_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [User, Task])
abstract class AppDatabase extends FloorDatabase {

  UserRepositoryDao get userRepositoryDao;
  TaskRepositoryDao get taskRepositoryDao;

}