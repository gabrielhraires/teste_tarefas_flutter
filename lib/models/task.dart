import 'package:floor/floor.dart';
import 'package:testepraticotasks/models/entity_base.dart';
import 'package:testepraticotasks/models/user.dart';

@Entity(
  tableName: 'task',
  foreignKeys: [
    ForeignKey(childColumns: ['user_id'], parentColumns: ['id'], entity: User)
  ]
)
class Task extends EntityBase{

  String name;
  String finishDate;
  String conclusionDate;

  @ColumnInfo(name: 'user_id')
  int userId;

  Task({int id, this.name, this.finishDate, this.conclusionDate, this.userId}) : super(id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'finishDate': finishDate,
      'conclusionDate': conclusionDate,
      'userId': userId
    };
  }
}