import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(backgroundColor: kBLUE_700,);
  }
}
