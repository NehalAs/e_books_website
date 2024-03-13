import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.type,
      required this.controller,
      required this.label,
      this.onTap,
      this.onChange,
      this.validate,
      this.obsecure = false,
      this.suffix,
      this.onSubmitt,
      this.outLineBorder = true,
      required this.prefix});
  TextEditingController controller;
  TextInputType type;
  Function(String value)? onChange;
  Function(String value)? onSubmitt;
  Function()? onTap;
  String? Function(String? value)? validate;
  String label;
  Icon prefix;
  IconButton? suffix;
  bool outLineBorder;
  bool obsecure;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmitt,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        obscureText: obsecure,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: outLineBorder ? const OutlineInputBorder() : null,
        ),
      ),
    );
  }
}
