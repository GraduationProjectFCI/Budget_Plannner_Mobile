import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



toast({
  required String msg
}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
