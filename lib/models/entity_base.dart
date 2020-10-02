import 'package:floor/floor.dart';

class EntityBase {

  @PrimaryKey(autoGenerate: true)
  int id;

  EntityBase(this.id);

}