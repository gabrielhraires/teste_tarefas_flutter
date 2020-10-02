import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/base_controller.dart';
import 'package:testepraticotasks/apresentation/screens/login/login_controller.dart';
import 'package:testepraticotasks/db/database.dart';
import 'package:testepraticotasks/db/db_provider.dart';
import 'package:testepraticotasks/models/user.dart';
import 'package:via_cep/via_cep.dart';

class SignupController extends BaseController {

  final LoginController _loginController = Get.find();

  AppDatabase db;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<DateTime> dateOfBirth = DateTime.now().obs;

  final cep = new via_cep();

  RxBool isSearchingCep = false.obs;

  final formKey = GlobalKey<FormState>();

  signUp() async {
    if(formKey.currentState.validate()) {
      isLoading = true;

      db = await DBProvider.db.appDatabase;
      try {
        User user = User(
          name: nameController.text,
          email: emailController.text,
          dateOfBirth: dateOfBirthController.text,
          cpf: cpfController.text,
          cep: cepController.text,
          address: addressController.text,
          number: numberController.text,
          password: passwordController.text,
        );

        await db.userRepositoryDao.insertItem(user);

        _loginController.signIn(email: user.email, password: user.password);
      } catch (e) {
        print(e);
      }

      isLoading = false;
    }
  }

  searchCep(String text) async {
    if(text.length > 8) {
      isSearchingCep.value = true;
      await cep.searchCEP(text, 'json', '');

      if (cep.getResponse() == 200) {
        addressController.text = cep.getLogradouro();
      } else {
        print(cep.getResponse());
        print(cep.getBody());
      }
      isSearchingCep.value = false;
    } else {
      addressController.text = '';
    }
  }
}