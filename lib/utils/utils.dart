import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType {ERROR, SUCCESS}

abstract class Utils {

  static openBottomSheet({BuildContext context, List<Widget> buttons}) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            child: Wrap(
              children: buttons
            )
          );
        }
    );
  }

  static openDialog({String title, String message, List<Widget> buttons}) {
    Get.dialog(Dialog(
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(height: 12),
              Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: buttons
              )
            ],
          ),
        )
    ));
  }

  static confirmationDialog({String title, String message, Function confirmButton,
    Function declineButton}) {
    Get.dialog(Dialog(
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(height: 12),
              Text(
                message,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _buildConfirmationButton(
                    text: 'Sim',
                    onPressed: confirmButton
                  ),
                  _buildConfirmationButton(
                    text: 'Não',
                    onPressed: declineButton
                  ),
                ]
              )
            ],
          ),
        )
    ));
  }

  static Widget _buildConfirmationButton({String text, Function onPressed}) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
            color: Get.theme.primaryColor
        ),
      ),
      onPressed: onPressed,
    );
  }

  static openSnackBar({String title, String message, Widget action, SnackType type}) {
    Get.snackbar(
        title,
        message,
        barBlur: 100,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: type == SnackType.SUCCESS ? Get.theme.primaryColor : Colors.redAccent,
        margin: EdgeInsets.all(0),
        borderRadius: 0,
        colorText: Colors.white,
        mainButton: action
    );
  }

}