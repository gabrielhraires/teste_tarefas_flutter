import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testepraticotasks/apresentation/screens/signup/signup_controller.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_buttom.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_text_field/custom_text_field.dart';
import 'package:testepraticotasks/constants/masks.dart';
import 'package:testepraticotasks/validators/validators.dart';

class SignupScreen extends StatelessWidget {

  final SignupController _controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              CustomTextField(
                label: 'Nome *',
                controller: _controller.nameController,
                validator: Validators.requiredValidator,
              ),
              CustomTextField(
                label: 'E-mail *',
                keyboardType: TextInputType.emailAddress,
                controller: _controller.emailController,
                  validator: Validators.requiredValidator
              ),
              CustomTextField(
                label: 'Data de Nascimento *',
                keyboardType: TextInputType.datetime,
                readOnly: true,
                controller: _controller.dateOfBirthController,
                validator: Validators.requiredValidator,
                onTap: () => _showDateOfBirthPicker(context),
              ),
              CustomTextField(
                label: 'CPF',
                controller: _controller.cpfController,
                formatters: [Masks.cpf],
                validator: Validators.cpfValidator,
                autoValidate: true,
              ),
              Obx(() => CustomTextField(
                label: 'CEP',
                controller: _controller.cepController,
                onChanged: _controller.searchCep,
                formatters: [Masks.cep],
                suffix: _controller.isSearchingCep.value
                  ? Container(
                    alignment: Alignment.centerRight,
                    width: 25,
                    margin: EdgeInsets.only(right: 15),
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )
                    ),
                  )
                  : null
                ),
              ),
              CustomTextField(
                label: 'Endereço',
                readOnly: true,
                controller: _controller.addressController,
              ),
              CustomTextField(
                label: 'Número',
                controller: _controller.numberController,
              ),
              CustomTextField(
                label: 'Senha *',
                obscureText: true,
                controller: _controller.passwordController,
                validator: Validators.requiredValidator
              ),
              Obx(() =>
                CustomButton(
                  label: 'Cadastrar',
                  isLoading: _controller.isLoading,
                  onPressed: _controller.signUp,
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  _showDateOfBirthPicker(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime minAge = DateTime(today.year - 12, today.month, today.day);
    showDatePicker(
      context: context,
      initialDate: minAge,
      firstDate: DateTime(1900),
      lastDate: minAge
    ).then((value) {
      if(value != null) {
        _controller.dateOfBirthController.text = DateFormat('dd/MM/yyyy', 'pt-br').format(value);
      }
    });
  }
}
