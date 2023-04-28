import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



toast() => Fluttertoast.showToast(
    msg: "controller.loginModel.message",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
