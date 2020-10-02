import 'package:testepraticotasks/db/database.dart';

class DBProvider {

  static AppDatabase _appDatabase;

  DBProvider._();
  static final DBProvider db  = DBProvider._();

  Future<AppDatabase> get appDatabase async {
    if(_appDatabase != null) {
      return _appDatabase;
    } else {
      _appDatabase = await $FloorAppDatabase.databaseBuilder('tasks_database.db').build();
      return _appDatabase;
    }
  }
}