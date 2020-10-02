import 'package:floor/floor.dart';
import 'package:testepraticotasks/models/entity_base.dart';

@entity
class User extends EntityBase {

  String name;
  String email;
  String dateOfBirth;
  String cpf;
  String cep;
  String address;
  String number;
  String password;

  User({int id, this.name, this.email, this.dateOfBirth, this.cpf, this.cep,
      this.address, this.number, this.password}) : super(id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'cpf': cpf,
      'cep': cep,
      'address': address,
      'number': number,
      'password': password
    };
  }

  User fromMap(Map<String, dynamic> map) {
    return map != null ? User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      dateOfBirth: map['dateOfBirth'],
      cpf: map['cpf'],
      cep: map['cep'],
      address: map['address'],
      number: map['number'],
      password: map['password'],
    ) : null;
  }
}