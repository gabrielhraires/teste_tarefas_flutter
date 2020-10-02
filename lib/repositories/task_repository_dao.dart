import 'package:floor/floor.dart';
import 'package:testepraticotasks/models/task.dart';
import 'package:testepraticotasks/repositories/interfaces/repository_interface.dart';

@dao
abstract class TaskRepositoryDao extends IRepositoryInterface<Task> {

  @Query('SELECT * FROM Task WHERE id = :id')
  Future<Task> getById(int id);

  @Query('SELECT * FROM Task WHERE user_id = :userId')
  Stream<List<Task>> getAllByUser(int userId);
}