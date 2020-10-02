import 'package:floor/floor.dart';
import 'package:testepraticotasks/models/entity_base.dart';

abstract class IRepositoryInterface<Entity extends EntityBase> {

  @insert
  Future<int> insertItem(Entity item);

  @update
  Future<int> updateItem(Entity item);

  @delete
  Future<int> deleteItem(Entity item);

}