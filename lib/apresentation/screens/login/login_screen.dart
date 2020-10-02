import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/screens/login/login_controller.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_buttom.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_text_field/custom_text_field.dart';
import 'package:testepraticotasks/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {

  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                        tag: 'logo',
                        child:
                          Icon(
                            Icons.playlist_add_check,
                            size: 112,
                            color: Theme.of(context).primaryColor,
                          ),
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                        label: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                        controller: _controller.emailController,
                      ),
                      CustomTextField(
                        label: 'Senha',
                        obscureText: true,
                        controller: _controller.passwordController,
                      ),
                      Obx(() =>
                        CustomButton(
                          label: 'Entrar',
                          isLoading: _controller.isLoading,
                          onPressed: _controller.signIn,
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Não tem uma conta?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomButton(
                        label: 'Cadastre-se',
                        color: CustomButtonColor.SECONDARY,
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
