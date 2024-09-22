import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_example/resources/app_colors.dart';

class Utils{

  static void feildFocusChange(
    BuildContext context,
      {required FocusNode current, required FocusNode next}){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static flushBarErrorMessages(String message, BuildContext context){
    if (kDebugMode) {
      print("Flush bar message: $message");
    }
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        message: message,
        messageColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(5),
      )..show(context)
    );
  }
}