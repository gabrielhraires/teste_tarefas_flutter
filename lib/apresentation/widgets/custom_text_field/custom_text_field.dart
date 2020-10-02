import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {

  final bool obscureText;
  final String label;
  final Function onChanged;
  final Function onTap;
  final bool enabled;
  final bool readOnly;
  final TextInputType keyboardType;
  final Widget suffix;
  final int maxLength;
  final int maxLines;
  final TextEditingController controller;
  final List<MaskTextInputFormatter> formatters;
  final dynamic validator;
  final bool autoValidate;

  CustomTextField({
    @required this.label,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.suffix,
    this.maxLength,
    this.maxLines = 1,
    this.controller,
    this.formatters = const [],
    this.validator,
    this.autoValidate = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.white)
          ),
          border: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(32)
          ),
        ),
        onChanged: onChanged != null ? onChanged : (value) {},
        onTap: onTap != null ? onTap : () {},
        enabled: enabled,
        readOnly: readOnly,
        inputFormatters: formatters,
        validator: validator,
        autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : null,
      ),
    );
  }
}
