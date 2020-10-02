import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testepraticotasks/apresentation/screens/tasks/tasks_controller.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_buttom.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_text_field/custom_text_field.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_date_picker.dart';
import 'package:testepraticotasks/validators/validators.dart';

class TaskCreationScreen extends StatelessWidget {

  final TasksController _controller = Get.find();

  bool _isEditing() {
    return _controller.editingTask != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing()
            ? 'Edição de tarefa'
            : 'Cadastro de tarefa'
        ),
      ),
      body: Form(
        key: _controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            CustomTextField(
              label: 'Nome *',
              controller: _controller.nameController,
              validator: Validators.requiredValidator,
            ),
            CustomDatePicker(
              label: 'Data de Entrega *',
              controller: _controller.finishDateController,
              validator: Validators.requiredValidator,
              initialDate: DateTime.now(),
            ),
            CustomDatePicker(
              label: 'Data de Conclusão',
              controller: _controller.conclusionDateController,
              initialDate: DateTime.now(),
            ),
            Obx(() =>
              CustomButton(
                label: _isEditing()
                  ? 'Atualizar'
                  : 'Cadastrar',
                isLoading: _controller.isLoading,
                onPressed: _isEditing()
                  ? _controller.editTask
                  : _controller.create
              )
            )
          ],
        ),
      ),
    );
  }
}
