import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.prefixIcon,
    this.initialValue,
  }) : super(key: key);

  final String label;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
