import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CustomButtonColor {PRIMARY, SECONDARY}

class CustomButton extends StatelessWidget {

  final Key key;
  final CustomButtonColor color;
  final String label;
  final Function onPressed;
  final bool isLoading;

  final Color _backgroundColor;
  final Color _labelColor;
  final Color _borderColor;

  CustomButton({
    this.key,
    this.color,
    this.label,
    this.onPressed,
    this.isLoading = false,
  }): _backgroundColor = color == CustomButtonColor.SECONDARY
        ? Colors.grey[200]
        : Get.theme.primaryColor,
      _labelColor = color == CustomButtonColor.SECONDARY
        ? Get.theme.primaryColor
        : Colors.white,
      _borderColor = color == CustomButtonColor.SECONDARY
        ? Get.theme.primaryColor
        : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton(
        key: key,
        color: _backgroundColor,
        disabledColor: _backgroundColor.withAlpha(150),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: _borderColor
          )
        ),
        child: isLoading
          ? Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(_labelColor),
            ),
          )
          : Text(
            label,
            style: TextStyle(
                color: _labelColor,
                fontSize: 18
            ),
          ),
        onPressed: onPressed,
      ),
    );
  }
}
