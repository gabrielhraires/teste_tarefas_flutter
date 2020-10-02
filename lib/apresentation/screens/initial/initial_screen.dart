import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/screens/login/login_controller.dart';
import 'package:testepraticotasks/apresentation/screens/login/login_screen.dart';
import 'package:testepraticotasks/models/user.dart';
import 'package:testepraticotasks/routes/app_routes.dart';
import 'package:testepraticotasks/utils/shared_pref.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  LoginController _loginController = Get.put(LoginController(), permanent: true);

  @override
  void initState() {
    super.initState();

    _loadSharedPrefs();

    Timer(Duration(seconds: 2), () {
      if(_loginController.loggedUser != null) {
        Get.offAndToNamed(Routes.TASKS);
      } else {
        Get.off(
          LoginScreen(),
          curve: Curves.easeOut,
          duration:Duration(seconds: 2));
      }
    });
  }

  _loadSharedPrefs() async {
    Map userMap = await SharedPref.read('loggedUser');
    User user = User().fromMap(userMap);

    if(user != null) {
      _loginController.loggedUser = user;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Icon(
            Icons.playlist_add_check,
            size: 112,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
