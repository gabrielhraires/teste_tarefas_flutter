import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testepraticotasks/apresentation/widgets/custom_text_field/custom_text_field.dart';

class CustomDatePicker extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final dynamic validator;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  CustomDatePicker({
    @required this.label,
    this.controller,
    this.validator,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: label,
      keyboardType: TextInputType.datetime,
      readOnly: true,
      controller: controller,
      validator: validator,
      onTap: () => _showDatePicker(context),
    );
  }

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100)
    ).then((value) {
      if(value != null) {
        controller.text = (DateFormat('dd/MM/yyyy', 'pt-br').format(value));
      }
    });
  }
}
