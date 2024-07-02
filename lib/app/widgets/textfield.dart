import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/pages/calander/widget/add.dart';
import 'package:flutter/material.dart';

class DreamTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final bool? enableInteractiveSelection;
  final bool readOnly;

  const DreamTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.onChanged,
    this.onTap,
    this.textInputAction,
    this.onEditingComplete,
    this.enableInteractiveSelection,
    this.autofocus = false,
    this.isPassword = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        SelectModal().showCategory();
      },
      enableInteractiveSelection: enableInteractiveSelection,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      autofocus: autofocus,
      style: DreamTextTheme.medium14.copyWith(color: DreamColors.color5),
      cursorColor: Colors.black,
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        counterText: "",
        fillColor: const Color(0xfff7f7f7),
        filled: true,
        hintStyle: DreamTextTheme.medium14.copyWith(color: DreamColors.color5),
        floatingLabelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}

class DreamTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool autofocus;
  final bool isPassword;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final bool? enableInteractiveSelection;

  const DreamTextFormField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.maxLength,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.onEditingComplete,
    this.enableInteractiveSelection,
    this.autofocus = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      textInputAction: textInputAction,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      autofocus: autofocus,
      style: DreamTextTheme.regular20,
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      maxLength: maxLength,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        counterText: "",
        fillColor: DreamColors.black,
        filled: true,
        hintStyle: DreamTextTheme.regular20,
        floatingLabelStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontWeight: FontWeight.w500, fontSize: 12),
      ),
      validator: validator,
    );
  }
}
