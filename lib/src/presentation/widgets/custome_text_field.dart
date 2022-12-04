import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hint, errorText;
  final String? Function(String?)? validator;
  final void Function(String?)? save;
  final bool? obscureText, enabled;
  final TextInputType? type;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool filled;
  final OutlineInputBorder focusedBorder;
  final OutlineInputBorder enabledBorder;
  final OutlineInputBorder errorBorder;
  final Widget? prefixIcon, suffixIcon;

  const CustomTextField({Key? key,
    this.hint,
    this.errorText,
    this.save,
    this.validator,
    this.suffixIcon,
    this.filled = false,
    this.obscureText = false,
    this.type,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: kBLUE_700, width: 1.2),
    ),
    this.enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: kBLUE_700, width: 1.2),
    ),
    this.errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.2),
    ),
    this.focusNode,
    this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
          style: Theme.of(context).textTheme.headline6?.copyWith(color: kBLUE_700),
          onChanged: onChanged,
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(

              filled: filled,
              hintStyle: Theme
                  .of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Theme
                  .of(context)
                  .colorScheme
                  .secondary, fontWeight: FontWeight.normal),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint,
              errorText: errorText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedErrorBorder: errorBorder,
              focusedBorder: focusedBorder,
              enabledBorder: enabledBorder,
              errorBorder: errorBorder),
          keyboardType: type,
          validator: validator,
          onSaved: save,
          enabled: enabled);
  }
}
