import 'package:floor/floor.dart';
import 'package:testepraticotasks/models/user.dart';
import 'package:testepraticotasks/repositories/interfaces/repository_interface.dart';

@dao
abstract class UserRepositoryDao extends IRepositoryInterface<User> {

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User> getById(int id);

  @Query('SELECT * FROM User WHERE email = :email AND password = :password')
  Future<User> getByEmailAndPassword(String email, String password);
}