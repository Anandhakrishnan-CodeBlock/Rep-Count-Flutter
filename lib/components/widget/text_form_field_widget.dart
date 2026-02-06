import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool? readOnly;
  final AutovalidateMode autoValidateMode;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String?)? onChanged;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.readOnly,
    required this.autoValidateMode,
    required this.textInputAction,
    this.validator,
    this.focusNode,
    this.onEditingComplete,
    required this.hintText,
    required this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.style,
    this.hintStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      autovalidateMode: autoValidateMode,
      validator: validator,
      textInputAction: textInputAction,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      style: style,
      decoration: InputDecoration(
        counterText: "",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: style
      ),
    );
  }
}
