import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, {Color? color}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color ?? Theme.of(context).primaryColor,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}