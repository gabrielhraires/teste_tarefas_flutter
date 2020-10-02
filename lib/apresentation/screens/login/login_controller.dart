import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/base_controller.dart';
import 'package:testepraticotasks/db/database.dart';
import 'package:testepraticotasks/db/db_provider.dart';
import 'package:testepraticotasks/models/user.dart';
import 'package:testepraticotasks/routes/app_routes.dart';
import 'package:testepraticotasks/utils/shared_pref.dart';
import 'package:testepraticotasks/utils/utils.dart';

class LoginController extends BaseController {

  AppDatabase db;
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User loggedUser;

  signIn({String email, String password}) async {
    email = email ?? emailController.text;
    password = password ?? passwordController.text;
    if(email.isNotEmpty && password.isNotEmpty) {
      this.isLoading = true;
      db = await DBProvider.db.appDatabase;

      try {
        User user = await db.userRepositoryDao.getByEmailAndPassword(email, password);
        if(user != null) {
          loggedUser = user;

          SharedPref.save('loggedUser', loggedUser.toMap());

          Get.offAllNamed(Routes.TASKS);
        } else {
          Utils.openSnackBar(
            message: 'Usuário ou senha inválidos',
            type: SnackType.ERROR
          );
        }
      } catch (e) {
        print(e);
      }
      isLoading = false;
    }
  }

  signOut() async {
    loggedUser = null;
    SharedPref.remove('loggedUser');

    Get.offAllNamed(Routes.LOGIN);
  }
}